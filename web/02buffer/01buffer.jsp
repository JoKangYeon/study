<%--
  Created by IntelliJ IDEA.
  User: pc11
  Date: 23. 12. 7.
  Time: 오전 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    buffer="8kb" autoFlush="true"
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
버퍼  : 임시 데이터 저장공간.
        응답할 때 out.print()의 내용(html)을 버퍼에 저장했다가 한번에 전달.

flush : 현재 버퍼에 있는 내용을 브라우저에 전달
clear : 현재 버퍼에 있는 내용을 삭제

에러처리, jsp:forward 등을 사용할 때 buffer의 동작을 이해해야 결과 화면이 어떻게 나오는지 알 수 있다.

버퍼를 사용안하면 속도가 느림
버퍼 autoflush false로 하고 데이터를 엄청많이(8kb)이상 담으면 에러가 남.


</body>
</html>
