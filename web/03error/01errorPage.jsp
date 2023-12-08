<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 7.
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    isErrorPage="true"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
실행하다가 에러가 나면 이 화면이 대신 보입니다.
<br>

에러 정보는 다음을 참고하세요 <br>
<%=exception.getClass().getSimpleName()%>

</body>
</html>
