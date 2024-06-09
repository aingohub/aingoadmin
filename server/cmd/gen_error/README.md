
- 服务级错误码：1 位数进行表示，比如 1 为系统级错误；2 为普通错误，通常是由用户非法操作引起。
- 模块级错误码：2 位数进行表示，比如 01 为用户模块；02 为订单模块 (00 缺省全局错误)。
- 具体的错误码：3 位数

> 读取当前目录下config.json 配置文件

```json
{
  "serviceCodes": [
    {
      "code": "1",
      "label":"系统级错误",
      "desc":"1 为系统级错误, 系统意外异常错误如第三方接口调用错误"
    },
    {
      "code": "2",
      "label":"普通错误",
      "desc":"2 为普通错误，通常是由用户非法操作引起"
    }
  ],
  "moduleCodes": [
    {
      "code": "01",
      "label":"系统模块",
      "desc":"01 为系统模块，后台系统配置管理"
    },
    {
      "code": "02",
      "label":"用户模块",
      "desc":"02 为用户模块，包括部门、角色、权限"
    }
  ],
  "file_path": "./internal/code/errors.proto",
  "i18n": ["default","English"]
}
```

## 待生成的示例模板

```golang
syntax = "proto3";

package errcode;

option go_package = "err/errcode";
import "errors/errors.proto";

enum ErrorCode {
  // System Level Errors
  UNKNOWN = 100000 [(errors.msg) = "未知错误", (errors.msg_english) = "unknown error"];

  // Business Logic Validation Errors (5xxxxx)
  INVALID_PARAMS = 200001 [(errors.msg) = "请求参数错误", (errors.msg_english) = "request parameter error"];
  NO_TOKEN = 200002 [(errors.msg) = "Token 不合法或者不存在", (errors.msg_english) = "token is invalid or does not exist"];
  
  LOGIN_FAILURE = 201001 [(errors.msg) = "用户名不存在或者密码错误!", (errors.msg_english) = "The username does not exist or the password is incorrect"];
  USER_BAN = 201002 [(errors.msg) = "用户被禁用", (errors.msg_english) = "user is banned"];

}
```

