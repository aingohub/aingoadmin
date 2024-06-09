package main

import (
	"bufio"
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
	"unicode"
)

// Config 配置结构
type Config struct {
	ServiceCodes []CodeLabel `json:"service_codes"` // 服务级错误码
	ModuleCodes  []CodeLabel `json:"module_codes"`  // 模块级错误码
	I18n         []string    `json:"i18n"`          // 支持的语言列表
	FilePath     string      `json:"file_path"`     // 错误码文件路径
}

// CodeLabel 代码标签结构
type CodeLabel struct {
	Code  string `json:"code"`  // 代码
	Label string `json:"label"` // 标签
	Desc  string `json:"desc"`  // 描述
}

// 错误码常量到错误码的映射
var errorKeyCodeMap = make(map[string]int)

// 错误码到行号的映射
var errorCodeLine = make(map[int]int)
var configPath = flag.String("c", "", "配置文件路径（例如：-c ./config.json）")

var messages = make(map[string]string)

func main() {

	flag.Parse()
	// 检查configPath是否被设置
	if *configPath == "" {
		fmt.Println("必须指定配置文件路径（使用-c选项）")
		os.Exit(1)
	}
	// 命令行工具的主入口
	config, err := loadConfig(*configPath)
	if err != nil {
		fmt.Printf("配置文件加载错误: %v\n", err)
		return
	}

	serviceCode := selectFromConfig(config.ServiceCodes, "请选择服务级错误码:", len(config.ServiceCodes)-1)
	moduleCode := selectFromConfig(config.ModuleCodes, "请选择模块级错误码:", len(config.ModuleCodes)-1)

	errorCodeKey := inputConst(config.FilePath)

	for k, lang := range config.I18n {
		inputMsg(k, lang, errorCodeKey)
	}

	updateProtoFile(config.FilePath, serviceCode, moduleCode, errorCodeKey)
}

func loadConfig(path string) (*Config, error) {
	// 加载配置文件
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	var config Config
	err = json.NewDecoder(file).Decode(&config)
	return &config, err
}

func inputMsg(k int, lang, errorCodeKey string) bool {
	fmt.Printf("为 %s 输入错误信息:\n", lang)
	reader := bufio.NewReader(os.Stdin)
	msg, _ := reader.ReadString('\n')
	msg = strings.TrimSpace(msg)
	if msg == "" && k == 0 {
		fmt.Println("输入无效, 不能为空.")
		return inputMsg(k, lang, errorCodeKey)
	}
	if msg == "" && strings.ToLower(lang) == "english" {
		fmt.Println("英文信息为空，同步使用常量值")
		messages["english"] = ToLowerSnakeCase(errorCodeKey, ' ')
		return true
	} else {
		messages[lang] = strings.TrimSpace(msg)
	}
	return true
}

func inputConst(FilePath string) (outCodeKey string) {
	fmt.Print("请输入错误码常量键: ")
	reader := bufio.NewReader(os.Stdin)
	errorCodeKey, _ := reader.ReadString('\n')
	errorCodeKey = strings.TrimSpace(errorCodeKey)
	if errorCodeKey == "" {
		fmt.Println("输入无效, 不能为空.")
		return inputConst(FilePath)
	}
	// 尝试将字符串转换为整数
	if _, err := strconv.Atoi(errorCodeKey); err == nil {
		fmt.Println("输入无效, 常量Key不能为数字")
		return inputConst(FilePath)
	}
	if isUpperCamelCase(errorCodeKey) {
		outCodeKey = errorCodeKey
	} else {
		outCodeKey = ToUpperCamelCase(strings.ToLower(strings.ReplaceAll(strings.TrimSpace(errorCodeKey), " ", "_")))
	}
	if exists, _ := checkErrorCodeExists(FilePath, outCodeKey); exists {
		fmt.Println("错误码键已存在，请输入不同的键.")
		return inputConst(FilePath)
	}
	return outCodeKey
}

func selectFromConfig(items []CodeLabel, prompt string, defaultKey int) string {
	// 从配置中选择一个项目
	fmt.Println(prompt)
	for i, item := range items {
		if i == defaultKey {
			fmt.Printf("%d: %s [%s](默认)\n", i, item.Label, item.Desc)
		} else {
			fmt.Printf("%d: %s [%s]\n", i, item.Label, item.Desc)
		}
	}

	fmt.Print("输入编号 (回车为默认): ")
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	if input == "" {
		return items[defaultKey].Code
	}

	index, err := strconv.Atoi(input)
	if err != nil || index < 0 || index >= len(items) {
		fmt.Println("输入无效, 请重新输入.")
		return selectFromConfig(items, prompt, defaultKey)
	}
	return items[index].Code
}

func checkErrorCodeExists(filePath, errorCodeKey string) (bool, error) {
	// 检查错误码键是否存在
	dir := filepath.Dir(filePath)
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		if err := os.MkdirAll(dir, 0755); err != nil {
			return false, fmt.Errorf("创建目录错误: %v", err)
		}
	}

	if _, err := os.Stat(filePath); os.IsNotExist(err) {
		if err := initializeProtoFile(filePath); err != nil {
			return false, fmt.Errorf("初始化proto文件错误: %v", err)
		}
	}

	if err := parseProtoFile(filePath); err != nil {
		return false, fmt.Errorf("解析proto文件错误: %v", err)
	}

	_, exists := errorKeyCodeMap[errorCodeKey]
	return exists, nil
}

func initializeProtoFile(filePath string) error {
	//fmt.Println("filePath==", filePath)
	// 确保文件所在目录存在
	dir := filepath.Dir(filePath)
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		if err := os.MkdirAll(dir, 0755); err != nil {
			return fmt.Errorf("创建目录错误: %v", err)
		}
	}

	// 初始化proto文件的内容
	content := `syntax = "proto3";

package errcode;

option go_package = "internal/code/errcode";
import "google/protobuf/descriptor.proto";

message Error {
  int32 code = 1;
  string msg = 2;
};

extend google.protobuf.EnumValueOptions {
  string msg = 1108;
  string msg_english = 1109;
}

enum ErrorCode {
  SUCCESS = 0 [(msg) = "成功", (msg_english) = "successful"];  // 成功

  // System Level Errors
  UNKNOWN  = 100000 [(msg) = "服务器未知错误", (msg_english) = "unknown error"];
  RedisConnectError = 100001 [(msg) = "Redis 连接失败", (msg_english) = "redis connect error"];
  MySQLConnectError = 100002 [(msg) = "MySQL 连接失败", (msg_english) = "mysql connect error"];
  WriteConfigError = 100003 [(msg) = "写入配置文件失败", (msg_english) = "write config error"];

  // Business Logic Validation Errors (5xxxxx)
  DefaultInternalServerErrorID = 200000 [(msg) = "内部服务器错误", (msg_english) = "internal server error"];
  DefaultBadRequestID = 200001 [(msg) = "请求失败", (msg_english) = "bad request"];
  DefaultUnauthorizedID = 200002 [(msg) = "签名信息错误", (msg_english) = "unauthorized"];
  DefaultForbiddenID = 200003 [(msg) = "请求被禁止", (msg_english) = "forbidden"];
  DefaultNotFoundID = 200004 [(msg) = "资源不存在", (msg_english) = "not found"];
  DefaultMethodNotAllowedID = 200005 [(msg) = "暂无访问权限", (msg_english) = "method not allowed"];
  DefaultTooManyRequestsID = 200006 [(msg) = "请求过多", (msg_english) = "too many requests"];
  DefaultRequestEntityTooLargeID = 200007 [(msg) = "请求内容大小超过限制", (msg_english) = "request entity too large"];
  DefaultConflictID = 200008 [(msg) = "发生冲突,请重试或合并更新", (msg_english) = "conflict"];
  DefaultRequestTimeoutID = 200009 [(msg) = "请求超时", (msg_english) = "request timeout"];
  DefaultParamBindErrorID = 200010 [(msg) = "参数信息错误", (msg_english) = "param bind error"];
  DefaultUrlSignErrorID = 200011 [(msg) = "参数签名错误", (msg_english) = "url sign error"];
  DefaultSocketConnectError = 200012 [(msg) = "Socket 未连接", (msg_english) = "socket connect error"];
  DefaultSocketSendError = 200013 [(msg) = "Socket 消息发送失败", (msg_english) = "default socket send error"];
}
`
	// 尝试写入文件
	err := os.WriteFile(filePath, []byte(content), 0644)
	if err != nil {
		return fmt.Errorf("写入文件错误: %v, 确保文件路径 '%s' 是正确的并且有写入权限", err, filePath)
	}

	return nil
}

func parseProtoFile(filePath string) error {
	// 解析proto文件
	file, err := os.Open(filePath)
	if err != nil {
		return err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	lineNumber := 0
	re := regexp.MustCompile(`^\s*(\w+)\s*=\s*(\d+)\s*\[`)
	for scanner.Scan() {
		line := scanner.Text()
		lineNumber++
		if matches := re.FindStringSubmatch(line); matches != nil {
			errorCodeKey := matches[1]
			errorCode := matches[2]
			codeInt, _ := strconv.Atoi(errorCode)
			errorKeyCodeMap[errorCodeKey] = codeInt
			errorCodeLine[codeInt] = lineNumber
		}
	}

	return scanner.Err()
}

func updateProtoFile(filePath, serviceCode, moduleCode, errorCodeKey string) {
	// 确保目录存在
	dir := filepath.Dir(filePath)
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		if err := os.MkdirAll(dir, 0755); err != nil {
			fmt.Printf("创建目录错误: %v\n", err)
			return
		}
	}

	// 检查文件是否存在，如果不存在则创建并初始化
	var content []byte
	if _, err := os.Stat(filePath); os.IsNotExist(err) {
		if err := initializeProtoFile(filePath); err != nil {
			fmt.Printf("初始化proto文件错误: %v\n", err)
			return
		}
		content, _ = os.ReadFile(filePath) // 读取刚创建的文件
	} else {
		var err error
		content, err = os.ReadFile(filePath)
		if err != nil {
			fmt.Printf("读取文件错误: %v\n", err)
			return
		}
	}

	// 更新或插入新的错误码定义
	updatedContent, err := insertOrUpdateErrorCode(string(content), errorCodeKey, serviceCode, moduleCode)
	if err != nil {
		return
	}
	// 写回更新后的内容到 .proto 文件
	if err := os.WriteFile(filePath, []byte(updatedContent), 0644); err != nil {
		fmt.Printf("写入更新文件错误: %v\n", err)
		return
	}

	fmt.Println("更新errors.proto文件:", filePath)
}

func buildErrorCodeDefinition(serviceCode, moduleCode, errorCodeKey string) string {
	// 构建新的错误码定义
	newCode, _ := getNextErrorCode(serviceCode, moduleCode)
	fullErrorCode := serviceCode + moduleCode + newCode

	var builder strings.Builder
	builder.WriteString(fmt.Sprintf("\n  %s = %s [", errorCodeKey, fullErrorCode))

	keys := make([]string, 0, len(messages))
	for k := range messages {
		keys = append(keys, k)
	}
	// 对切片进行排序
	fmt.Println("keys=sort", keys)
	sort.Strings(keys)

	for i, lang := range keys {
		msg := messages[lang]
		langKey := fmt.Sprintf("msg_%s", strings.ToLower(lang))
		if lang == "default" {
			langKey = "msg"
		}

		builder.WriteString(fmt.Sprintf("(%s) = \"%s\"", langKey, msg))
		if i < len(keys)-1 {
			builder.WriteString(", ")
		}
	}

	builder.WriteString("];")
	return builder.String()
}

func insertOrUpdateErrorCode(content, errorCodeKey, serviceCode, moduleCode string) (string, error) {

	// 检查新的错误码常量名是否已存在
	if _, ok := errorKeyCodeMap[errorCodeKey]; ok {
		return "", fmt.Errorf("错误码常量名 %s 已存在", errorCodeKey)
	}

	// 找到与新错误码前缀相同（前三位）且后三位最大值的行号
	prefix, _ := strconv.Atoi(serviceCode + moduleCode)
	prefixMax := prefix*1000 + 999
	maxCode := 0
	//fmt.Println("prefixMax===", prefixMax)
	fmt.Println("errorKeyCodeMap", errorKeyCodeMap)
	for _, code := range errorKeyCodeMap {
		//fmt.Println("code===", code)
		if code > maxCode && code <= prefixMax {
			//fmt.Println("maxCode = code----", code)
			maxCode = code
		}
	}
	//fmt.Println("maxCode", maxCode)
	// 使用正则表达式匹配到指定的错误码行
	regStr := fmt.Sprintf(`(\s*) = %d.*\n`, maxCode)
	regex1 := regexp.MustCompile(regStr)
	//fmt.Println("regex1", regex1)
	matches1 := regex1.FindStringSubmatch(content)
	//fmt.Println("matches1", matches1)
	if len(matches1) == 0 {
		return "", fmt.Errorf("未找到指定的错误码行")
	}
	// 构建新的错误码定义
	newErrorCodeDefinition := buildErrorCodeDefinition(serviceCode, moduleCode, errorCodeKey)

	newLine := matches1[0]
	fmt.Println("maxCode=", maxCode)
	fmt.Println("maxCode/1000=", maxCode/1000)
	fmt.Println("prefix=", prefix)
	if maxCode/1000 == prefix {
		newLine = strings.TrimRight(matches1[0], "\n")
	}

	// 在匹配到的错误码行后插入新的错误码信息
	content = strings.Replace(content, matches1[0], newLine+newErrorCodeDefinition+"\n", 1)

	return content, nil
}

func getNextErrorCode(serviceCode, moduleCode string) (string, error) {
	// 生成新的错误码
	maxCode := 0
	prefix := serviceCode + moduleCode
	for code, _ := range errorCodeLine {
		codeStr := strconv.Itoa(code)
		if strings.HasPrefix(codeStr, prefix) {
			suffix, err := strconv.Atoi(codeStr[len(prefix):])
			if err != nil {
				continue
			}
			if suffix > maxCode {
				maxCode = suffix
			}
		}
	}
	newCode := maxCode + 1
	return fmt.Sprintf("%03d", newCode), nil
}

// ToUpperCamelCase converts a snake_case string to UpperCamelCase (PascalCase).
func ToUpperCamelCase(s string) string {
	// 使用 strings.Split 将字符串按 "_" 分割成单词切片
	parts := strings.Split(s, "_")
	// 初始化一个 buffer 来收集转换后的单词
	var buf strings.Builder
	// 遍历每个单词，将首字母转为大写，并连接到 buffer 中
	for _, part := range parts {
		// 将首字母转为大写
		buf.WriteRune(unicode.ToUpper(rune(part[0])))
		// 如果单词不止一个字符，添加剩余部分
		if len(part) > 1 {
			buf.WriteString(part[1:])
		}
	}
	return buf.String()
}

// ToLowerSnakeCase converts a CamelCase string to lower snake_case.
func ToLowerSnakeCase(s string, j rune) string {
	var b strings.Builder
	for i, r := range s {
		if unicode.IsUpper(r) && i > 0 {
			b.WriteRune(j) // 在大写字母前添加下划线
		}
		b.WriteRune(unicode.ToLower(r)) // 转换为小写
	}
	return b.String()
}

func isUpperCamelCase(str string) bool {
	// 使用正则表达式匹配大写驼峰命名法
	re := regexp.MustCompile(`^[A-Z][a-zA-Z0-9]*$`)
	return re.MatchString(str)
}
