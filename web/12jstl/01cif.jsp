<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    String idol = request.getParameter("idol");
    request.setAttribute("idol", idol); // EL사용하기 위해서
    // c:if test=""값이 반드시 true일 때만 사용되는 태그입니다
%>
<c:if test="true가 아니면 실행 안됨">test 값이 true 일때만 실행되는 태그.</c:if>


<c:choose>
    <c:when test="${idol eq '뉴진스'}"><h1>버니즈</h1></c:when>
    <c:when test="${idol eq '아이들'}"><h1>당신은 네버버</h1></c:when>
    <c:when test="${idol eq '르세라핌'}"><h1>피어나</h1></c:when>
    <:c:otherwise>3개 다 아님</:c:otherwise>
</c:choose>

<%--c:choose c:when, c:otherwise--%>

</body>
</html>