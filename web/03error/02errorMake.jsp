<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 7.
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
02errorMake.jsp

<%
    String error = request.getParameter("error");
    if(error == null || error.isEmpty()){
        throw new NullPointerException();
    }else if(error.equals("abc")){
        throw new ArrayIndexOutOfBoundsException();
    }
%>


</body>
</html>
