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

<%
    Cookie cookie = new Cookie("new", "jeans"); //이름, 값 필수
    response.addCookie(cookie);
    out.print("뉴진스 쿠키");


%>

</body>
</html>