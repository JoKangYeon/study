<%@page import="com.study.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	
	
	<%@include file="/WEB-INF/inc/top.jsp"%>

	<%
		String user = request.getParameter("remember");
	%>

	<%
		if (request.getParameter("login") != null) {


	%>
	로그인 중
	<a href="logout.jsp" class="btn btn-success btn-sm">로그아웃</a>
	<%
		}else{

	%>



	<div class="container">
		<form action="loginCheck.jsp" class="loginForm">
			<h2>로그인</h2>
			<%
				if(request.getParameter("msg") != null){
					out.print(request.getParameter("msg"));
				}
			%>
			<table class="table table-bordered">
				<tbody>
				<tr>
					<% if (user != null) {
					%>

					<th> 아이디</th>
					<td><input type="text" name="userId"
							   class="form-control input-sm" value=<%=user%>></td>
					<%
					} else {
					%>
					<th> 아이디</th>
					<td><input type="text" name="userId"
							   class="form-control input-sm" value=""></td>
					<%
					}%>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPass"
							class="form-control input-sm"></td>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox"
								name="rememberMe" value="Y" >ID 기억하기</label></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary btn-sm pull-right">로그인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- container -->
	<%
		}%>
</body>
</html>