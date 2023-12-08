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
쿠키지속시간 : setMaxage로 설정. 단위는 초 (second)
              설정 안하면 기본값은 -1 (브라우저를 끌 때 같이사라짐)
              100으로 설정하면 브라우저 종료와 상관없이 무조건 100초 유지

<%
    Cookie cookie = new Cookie("maxAge", "maxAge");
    cookie.setMaxAge(15);   // 하루설정
    response.addCookie(cookie);

%>

</body>
</html>