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
<form action="01cif.jsp">
    내가 좋아하는 아이돌그룹 : <input type="text" name="idol">   <br>
    <button type="submit">제출</button>

</form>

</body>
</html>