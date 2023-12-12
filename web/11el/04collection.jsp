<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Title</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
04collection.jsp
콜렉션 : List[], set{}, map{ key : 0 } 선언
EL은 기본적으로 화면 출력이 됩니다. 변수 선언하는 것도 화면이 출력이돼요
즉, 변수 선언; "" 하면 변수 선언부분은 출력안하고, 빈 ""을 출력하니까
실제로는 그냥 변수만 선언한거 같은 효과

${a=[1,5,3,7,8] ; ""}  ${a} <br>
${set={1,5,3,7,8} ; ""}  ${set} <br>
${ map ={"key1": "val1", "key2" : "val2" ; ""} }    ${map}

<br>
map은 참고로 entrySet 방식으로 동작함


</body>
</html>