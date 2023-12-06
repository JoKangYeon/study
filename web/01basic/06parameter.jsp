<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 6.
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8");%>
    <title>Title</title>
</head>
<body>
</body>
<%
    String newJeansMember = request.getParameter("new");
    newJeansMember.matches("하니");
%>
내가 좋아하는 멤버 : <%=newJeansMember%>
</body>
</html>
