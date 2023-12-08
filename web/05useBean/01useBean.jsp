<%@ page import="com.study.login.vo.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Title</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

자바빈 : 자바빈규약에 맞는 객체

자바빈 규약
1. 패키지에 있어야된다.
2. 기본 생성자가 있어야 된다.
3. 필드는 private
4. get/set은 public
5. 직렬화(선택)

<%
    UserVO user = (UserVO) request.getAttribute("user");
    if(user==null){
            user = new UserVO("mingi", "민지", "1004", "MEMBER");
            request.setAttribute("user", user);
    }
%>

<jsp:useBean id="user2" class="com.study.login.vo.UserVO"></jsp:useBean>

</body>
</html>