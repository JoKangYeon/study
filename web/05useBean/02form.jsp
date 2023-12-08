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
<form action="02allSetting.jsp">
    userID : <input type="text" name="userId"> <br>
    userName : <input type="text" name="userName"> <br>
    userPass : <input type="text" name="userPass"> <br>
    userRole : <input type="text" name="userRole"> <br>
    <button type="submit">제출</button>
</form>

</body>
</html>