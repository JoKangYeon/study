<%@ page import="com.study.login.vo.UserVO" %>
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

<%--<%
    UserVO user = new UserVO();
    String userId = request.getParameter("userId");
    user.setUserId(userId);
    //반복
%>--%>

<jsp:useBean id="user" class="com.study.login.vo.UserVO"></jsp:useBean>
<%--<jsp:setProperty name="user" property="userId"value="<%=request.getParameter("userId")%>"></jsp:setProperty>--%>
<jsp:setProperty name="user" property="*"></jsp:setProperty>
<%=user.getUserRole()%>

<%--UserVO의 필드이름이랑 request의 파라미터 이름이 같아야 한다. --%>

</body>
</html>