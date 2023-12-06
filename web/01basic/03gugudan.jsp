<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 5.
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
    <%
        //01basic/03gugudan.jsp
        out.print("<tr>");
        for (int i = 2; i <= 9; i++) {
            out.print("<th>" + i + "단" + "</th>");
        }
        out.print("</tr>");

        for (int i = 1; i <= 9; i++) {
            out.print("<tr>");
            for (int j = 2; j <= 9; j++) {
                out.print("<td>" + j + " X " + i + "=" + (i * j) + "</td>");
            }
            out.print("</tr>");
        }
    %>
</table>


<hr>

<table border="1">
    <%
        for (int i = 2; i <= 9; i++) {
            out.print("<tr>");
            for (int j = 1; j <= 9; j++) {
                out.print("<td>" + i + "X" + j + "=" + (i * j) + "</td>");
            }
            out.print("</tr>");
        }
    %>
</table>


</body>
</html>
