<%@page import="com.study.common.util.CookieUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.UserList"%>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
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
<title></title>
</head>
<body>
http://localhost:8080/09cookie/login/login.jsp

<%
	com.study.common.util.UserVO user = new com.study.common.util.UserVO();
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPass");
	String rememberYN = request.getParameter("rememberMe");
	user.setUserId(userId);
	user.setUserPass(userPw);
	user.setUserName("sada");
	user.setUserRole("asd");

	UserList userList = new UserList();

	if(userId == null || userPw == null || userId.isEmpty() || userPw.isEmpty()) {
		response.sendRedirect("/09cookie/login/login.jsp?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 입력해주세요", "utf-8"));
	}else if(userList.getUser(userId) == null){
		response.sendRedirect("/09cookie/login/login.jsp?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요", "utf-8"));
	}else if(userList.getUser(userId).getUserId().equals(userId) && userList.getUser(userId).getUserPass().equals(userPw)){
		Cookie cookie = new Cookie("AUTH", userId);
		response.sendRedirect("/09cookie/login/login.jsp?login=" + URLEncoder.encode("isTrue", "utf-8"));
		if (rememberYN.equals("Y")){
			Cookie newCookie = CookieUtils.createCookie("rememberMe", userId, "/", (60 * 60 * 24 * 7));
			response.addCookie(newCookie);
		}
	}else{
		response.sendRedirect("/09cookie/login/login.jsp?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요", "utf-8"));
	}






//	Cookie[] cookies = request.getCookies();
//	for(Cookie cookie : cookies){
//		cookie.
//	}









%>




	
	
</body>
</html>