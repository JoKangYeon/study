<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 5.
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<ul>
    <%
        // 01basic/01jspBasic.jsp?num=8
        String num = request.getParameter("num");
        if(num != null){
            int intNum = Integer.parseInt(num);
            out.print("<ul>");
            for (int i = 1; i <= intNum; i++) {
                out.print("<li>" + i + "</li>");
            }
            out.print("</ul>");
        }else{
            out.print("파라미터가 없습니다.");
        }
    %>
</ul>

</body>
</html>
