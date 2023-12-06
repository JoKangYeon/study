<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 6.
  Time: 오후 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  System.out.println("요청이 올때마다 콘솔에 출력이됩니다.");

%>
<%
    out.print("<script> let a=false; if(a){");
%>
        <% System.out.println("출력이될까요 안될까요?");%>

<%
    out.print("}");
%>
</script>
</body>
</html>
