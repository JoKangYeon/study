<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 6.
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
난 이름이 2개야 영어이름, 한글이름
<form action="08sameParameter.jsp">
    이름1 : <input type="text" name="name"> <br>
    이름2 : <input type="text" name="name"> <br>
    취미 : <br>
    운동 <input type="checkbox" name="hobby" value="physics">
    음악 <input type="checkbox" name="hobby" value="music">
    먹기 <input type="checkbox" name="hobby" value="eating">

    <button type="submit">제출</button>

</form>

</body>
</html>
