

<%@page import="com.study.member.vo.MemberVO"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.study.member.service.IMemberService" %>
<%@ page import="com.study.member.service.MemberServiceImpl" %>
<%@ page import="com.study.exception.BizPasswordNotMatchedException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	
	
	<div class="container">
		<h3>회원삭제</h3>
		<c:if test="${bnf == null}">
<%--			SELECT문 사용해서 값이 Y인걸 확인했을 떄--%>
			<div class="alert alert-warning">
				<h4>삭제 성공</h4>
				정상적으로 회원을 삭제했습니다.
			</div>
		</c:if>
		



			<c:if test="${bnf != null}">
			<div class="alert alert-warning">
				<h4>회원이 존재하지 않습니다.</h4>
				올바르게 접근해주세요.
			</div>
			</c:if>
	
		
	
		
		<a href="memberList.wow?" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록
		</a>
	</div>
</body>
</html>