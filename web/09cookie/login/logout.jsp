<%@page import="com.study.common.util.CookieUtils"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %> 

<%
	CookieUtils cookieUtils = new CookieUtils(request);
	Cookie cookie3 = cookieUtils.getCookie("rememberMe");
	Cookie cookie2 = cookieUtils.getCookie("AUTH");
	String value = cookie2.getValue();

	Cookie cookie = new Cookie("AUTH", "asdsa");
	cookie.setMaxAge(0);
	response.addCookie(cookie);

	if (cookie3 == null){
		response.sendRedirect("/09cookie/login/login.jsp");
	}else {
		System.out.println(cookie3);
		response.sendRedirect("/09cookie/login/login.jsp?remember=" + URLEncoder.encode(value, "utf-8"));
	}





%>


</body>
</html>
