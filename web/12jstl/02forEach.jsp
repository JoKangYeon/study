<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
02forEach.jsp
<%
    for (int i = 0; i < 3; i++) {
        // 이런 반복문이 있고
    }
    List<String> newJeans = new ArrayList<>();
    newJeans.add("민지");
    newJeans.add("하니");
    newJeans.add("다니엘");
    newJeans.add("해린");
    newJeans.add("혜인");
    for(String newJeansMember : newJeans){
        // 이런 반복문
        request.setAttribute("newJeans", newJeans);
    }
%>

<h1>index 반복</h1>
<h2>forEach태그에서 설정한 var변수는 태그내부에서 EL로 사용한다</h2>
<h5><pre>
    varStatus : forEach태그 반복자에 정보를 가지고 있습니다. 역시 태그내부에서 EL로 사용가능
    varStatus의 속성들
    - begin, end step : forEach태그 쓰면서 설정한 바로 그값
    - first, last: 각각 처음에만 true, 마지막에만 true가 나옴
    - index, count : index는 index값, count는 실제 반복횟수
    - current : 현재 객체
</pre></h5>
<hr><hr><hr>
<c:forEach begin="1" end="9" step="2" var="i" varStatus="status">
    <c:if test="${status.first}"><h3>반복중 처음에만 실행되는 코드</h3></c:if>
        지금 몇번째 반복되고 있는지 : ${status.count}   <br>
        지금 index : ${status.index}  <br>
        var i의 현재 값 : ${i} <br>
    <c:if test="${status.last}"><h3>반복중 마지막에만 실행되는 코드</h3></c:if>
    <hr>



</c:forEach>


</body>
</html>