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

03ELOperator <br>

${  10 + "1"   }    <br>    :  EL에서는 사칙연산은 long, double로 바꾼다음에 연산 <br>
${  5.5 + 3.3 }     <br>

EL에서는 10 + "a"는 문자 "a"를 long으로 바꿀 수 없어서 에러. <br>

<hr>
3<5 : ${ 3 < 5}   <br>
3<5 : ${3 lt 5 }  <br>
<  :  lt,   <= :  le,  > : gt,  >= : ge,  == : eq,  !=  :  ne,  ! :  not
등으로 대체할 수 있다.   <br>

empty and or not 도 가능 <br>

3<5 && 3==4  :  ${(3 lt 5) and 3 eq 4}
empty : 컬렉션, 배열에서 null, 값이 없는 경우 true <br>



</body>
</html>