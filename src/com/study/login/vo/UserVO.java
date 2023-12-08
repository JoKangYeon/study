package com.study.login.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class UserVO {

    private String UserId;      /* 아이디 */
    private String UserName;    /* 이름 */
    private String UserPass;    /* 비밀번호 */
    private String UserRole;    /* 역할 */

    public UserVO(){}

    public UserVO(String userId, String userName, String userPass, String userRole) {
        UserId = userId;
        UserName = userName;
        UserPass = userPass;
        UserRole = userRole;
    }

    @Override
    public String toString(){
        return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
    }


    public void setUserId(String userId){
        this.UserId = userId;
    }

    public String getUserId() {
        return UserId;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserPass() {
        return UserPass;
    }

    public void setUserPass(String userPass) {
        UserPass = userPass;
    }

    public String getUserRole() {
        return UserRole;
    }

    public void setUserRole(String userRole) {
        UserRole = userRole;
    }
}
