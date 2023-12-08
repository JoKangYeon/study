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
경로별로 쿠키를 만듭니다.
쿠키가 동작하는 경로는 설정된 경로의 하위경로에서만

<%
    Cookie basic = new Cookie("basic", "basic");
    Cookie absolute = new Cookie("absolute", "absolute");
    Cookie path1 = new Cookie("path1", "path1");
    Cookie path2 = new Cookie("path2", "path2");

    absolute.setPath("/");
    path1.setPath("09cookie/path1");
    path2.setPath("09cookie/path2");

    response.addCookie(basic);
    response.addCookie(absolute);
    response.addCookie(path1);
    response.addCookie(path2);
%>

</body>
</html>