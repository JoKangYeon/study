<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 7.
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--02includeFile--%>

include 파일 전 <br>
<%
    int a = 4;
%>

<%@include file="02subFile.jsp"%>

<br>
include 파일 후

</body>
</html>
