<%@ page import="java.util.Arrays" %>
<%@ page import="java.io.IOException" %>
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
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie : cookies){
        out.print(cookie.getName() + " : " + cookie.getValue() + "<br>");
    }

    out.print("<hr>");

//    Arrays.stream(cookies).forEach((o) -> {
//        try {
//            out.print(o.getName() + " : " + o.getValue() + "<br>");
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    });

    //특정 쿠키로 무언가 하고싶다
    for(Cookie cookie : cookies){
        if(cookie.getName().equals("new")){
            out.print("new라는 쿠키를 찾았다 <br>");
            out.print(cookie.getName() + " : " + cookie.getValue());;
        }
    }









%>
</body>
</html>