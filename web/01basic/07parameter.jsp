<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String age = request.getParameter("num");
        int intAge = Integer.parseInt(age);
    %>
내년 나이 : <%=intAge+1%>

</body>
</html>