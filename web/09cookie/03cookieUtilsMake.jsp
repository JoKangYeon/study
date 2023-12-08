<%@ page import="com.study.common.util.CookieUtils" %>
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
//    Cookie cookie = new Cookie("ive", "ive");
//    cookie.setMaxAge(60*60);
//    cookie.setPath("/");
    // 생성하고, age설정하고, path설정하는게 귀찮아
    // 근데 Cookie에는 한번에 만들어주는 생성자가 없네 ?

    Cookie cookie = CookieUtils.createCookie("new", "jeans", 600);
    response.addCookie(cookie);



%>

</body>
</html>