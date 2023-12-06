<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 5.
  Time: 오전 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>star</title>
</head>
<body>






<%--줄바꿈은 <br>태그, 띄어쓰기 &nbsp--%>
<%
    //out.print()랑 같이쓰면 헷갈림..
    //01basic/02star.jsp

    String num = request.getParameter("num");
    int intNum = Integer.parseInt(num);

    String star = "*";
    for (int i = 0; i < intNum; i++) {
        out.print(star);
        star += "*";
        out.print("<br>");
    }
    out.print("<br>");

    int b = intNum;
    String stars = "*";
    String emptyBox = "";
   // 층수
    for (int i = 1; i <= intNum; i++) {

        // 빈공간 만들기
        for (int j = 0; j < b - 1; j++) {
            out.print("&nbsp");
        }

        b--;

        // 별찍기
        for (int j = 0; j < i; j++) {
            out.print("*");
        }
        out.print("<br>");
    }
    out.print("<br>");


    int space = intNum;
    for (int i = 1; i <= intNum; i++) {
        for (int j = 0; j < space - 1; j++) {
             out.print("&nbsp");
        }
        space--;
        for (int j = 0; j < (2*i) - 1; j++) {
            out.print("*");
        }
        out.print("<br>");
    }













%>

</body>
</html>
