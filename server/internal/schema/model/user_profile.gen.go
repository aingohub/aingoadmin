// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

const TableNameUserProfile = "user_profile"

// UserProfile mapped from table <user_profile>
type UserProfile struct {
	Username string `gorm:"column:username" json:"username"`
	UserID   int64  `gorm:"column:user_id;primaryKey" json:"user_id"`
}

// TableName UserProfile's table name
func (*UserProfile) TableName() string {
	return TableNameUserProfile
}