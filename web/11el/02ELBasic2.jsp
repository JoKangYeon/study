<%@ page import="com.study.common.util.UserVO" %>
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
<%--EL은 기본적으로 req, session 속성에 담은 객체 화면 출력용.--%>
<%
    UserVO user = new UserVO("minji", "민지", "1004", "USER");
    session.setAttribute("user", user);
%>
<%--session에 담았으니까 꼭 지금 jsp 아니어도 다른 jsp에서 EL 사용하면 내용 출력가능--%>

기본 객체 출력 ${user}    <br>
객체의 속성 출력 : ${user.userId}, ${user.userName}, ${user.userPass}, ${user.userRole}    <br>
객체의 속성 출력2 : ${user["userId"]}, ${[user["userName"]]}, ${[user["userPass"]]}    <br>
<%--user.userId가 필드이름이랑 연관된거 같지만 실제로는 get의 이름을 보고 출력--%>
<%--다만 javaBean 에서는 필드이름이랑 get메소드 이름이랑 규칙 잘 지켜서 만드니까 상관 x--%>

이거는 어떻게 될까? : ${abcdefg}   . 출력이 안되면 속성에 set했던 이름이랑 EL이름이랑 비교 <br>
user. 없는 속성을 입력하면 프로퍼티 에러가 발생함





</body>
</html>