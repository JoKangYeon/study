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

sessionSet은 session에 데이터 담았을 뿐입니다

<%
    UserVO user = new UserVO("minji", "민지", "1004", "MEMBER");

    session.setAttribute("USER_INFO", user);
%>



</body>
</html>