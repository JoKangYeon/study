<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="com.study.free.service.IFreeBoardService" %>
<%@ page import="com.study.free.service.FreeBoardServiceImpl" %>
<%@ page import="com.study.free.vo.FreeBoardVO" %>
<%@ page import="com.study.exception.BizPasswordNotMatchedException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	<title>freeDelete.jsp </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>

<jsp:useBean id="freeBoard" class="com.study.free.vo.FreeBoardVO"></jsp:useBean>
<jsp:setProperty name="freeBoard" property="*"></jsp:setProperty>

<%
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
	try {
		freeBoardService.removeBoard(freeBoard);
	} catch (BizPasswordNotMatchedException bnf) {
		request.setAttribute("bnf", bnf);
	}
%>

	

 <div class="container">	
	<h3>회원 정보 삭제</h3>		
		<c:if test="${bnf != null}">
		<div class="alert alert-warning">
			비밀번호가 틀립니다.
		</div>
		</c:if>

	 <c:if test="${bnf == null}">
		<div class="alert alert-success">
			정상적으로 삭제했습니다.
		</div>
	 </c:if>

	<a href="freeList.jsp" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;목록
	</a>
	
		
	

	</div>
</body>
</html>