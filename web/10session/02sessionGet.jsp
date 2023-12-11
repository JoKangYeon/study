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

set에서 담았던 user 객체 확인 <br>

<%
    UserVO user = (UserVO) session.getAttribute("USER_INFO");
%>
user : <%=user%>

sessionId : <%=session.getId()%>


</body>
</html>