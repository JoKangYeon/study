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
    CookieUtils cookieUtils = new CookieUtils(request);
    // new라는 쿠키만 얻어서 보고싶다.
    Cookie cookie = cookieUtils.getCookie("new");
    out.print(cookie.getName() + " : " + cookie.getValue());

%>

</body>
</html>