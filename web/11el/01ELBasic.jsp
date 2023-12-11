<%@ page import="com.study.common.util.UserVO" %>
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
01ELBasic
script언어 : 응용 프로그래밍언어 (JAVA) 를 도와주는 언어.
EL :JSP에서 자바를 도와주는 언어
-독립된 언어로서 EL만의 문법이 존재.
+ 자바에서의 '특정'객체와 그 내용을 EL에서 사용가능

1. EL사용법은 예시보면 아니까 패스
2. request, session, pageContext 등의 속성(setAttribute)했던 내용을 '화면에 출력' ->중요

3. 그 외 EL 문법은 맛보기
<hr>
<br><br><br>
<%
    request.setAttribute("req", "abcd");
    session.setAttribute("USER_INFO", new UserVO());
%>
req담은거 EL로 출력 : ${req}  <br>
session에 담은거 EL로 출력 : ${USER_INFO} <br>
<br> <br>





</body>
</html>