<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 7.
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    errorPage="01errorPage.jsp"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

여기는 에러가 발생하는 페이지
<%
    Integer[] arr = new Integer[11];
    for (int i = 1; i < arr.length; i++) {
        arr[i] = (int)(Math.random()*10); //Random
    }
    Arrays.sort(arr);   // NullPointerException 0번째 1번째랑 비교 큰지작은지 비교
    // null < 1 비교불가
%>












</body>
</html>
