<%@ page import="java.util.TimeZone" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
//    session. //브라우저 별로 생성된 객체. 요청의 J쿠키의 존재여부를 보고 서버가 생성한 객체
    long creationTime = session.getCreationTime();  // 생성시간
    session.setMaxInactiveInterval(20);
    long lastAccessedTime = session.getLastAccessedTime();
    //최근 접속 시간 보통 30분 or 1시간 동안 접속(같은 브라우저한테 온 요청) 이 없으면 session을 삭제함.

    //Date, Calendar : 그냥 안 좋음
    // LocalDate(Time) : 1970년 1월 1일부터 long으로 제공하는 숫자 빼고 다좋음
    LocalDateTime creationTimeLDT=LocalDateTime.ofInstant(Instant.ofEpochMilli(creationTime), TimeZone.getDefault().toZoneId());
    LocalDateTime lastAccessedTimeLDT= LocalDateTime.ofInstant(Instant.ofEpochMilli(lastAccessedTime), TimeZone.getTimeZone("Asia/Seoul").toZoneId());
    session.setMaxInactiveInterval(10);
%>
생성시간 : <%=creationTimeLDT.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))%> <br>
접근시간 : <%=lastAccessedTimeLDT.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))%> <br>




</body>
</html>