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
    //접속시간이 늦으면 삭제 되기도 하는데, 강제로 삭제 시킬 수 있음
//    session.invalidate();

    // 브라우저는 기억하고 싶다. -> 속성만 삭제
    session.removeAttribute("USER_INFO");
%>

</body>
</html>