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
<%--jstl을 이용해서 별 그리기--%>
<%-- gugudan 만들기 --%>
<%--jstl을 이용해서 prodList, prodView 완성해보기 --%>

<table border="1">
    <tr>
        <c:forEach begin="2" end="9" step="1" var="k">
            <th>${k}단</th>
        </c:forEach>
    </tr>
<c:forEach begin="1" end="9" step="1" var="i">
    <tr>
        <c:forEach begin="2" end="9" step="1" var="k">
            <td>${k}<%= " X "%>${i} <%= " = "%>${i*k}</td>
        </c:forEach>
    </tr>
</c:forEach>
</table>
<br>
<hr>

<%
    int blank = 4;
    int blank2 = 0;
    int blank3 = 5;
    int height = 5;
    int height2 = 1;
%>


<c:forEach begin="1" end="5" step="1" var="i">
    <c:forEach begin="1" end="<%=blank%>" step="1" var="k">
        &nbsp;
    </c:forEach>
    <c:forEach begin="1" end="${i}" step="1" var="j">
        ${"*"}
    </c:forEach>
    <% blank--; %>
    <br>
</c:forEach>

<br><br><hr>

<c:forEach begin="1" end="5" step="1" var="i">
    <c:forEach begin="1" end="<%=blank2%>" step="1" var="k">
        &nbsp;
    </c:forEach>
    <c:forEach begin="1" end="<%=height%>" step="1" var="j">
        ${"*"}
    </c:forEach>
    <% blank2++; %>
    <% height--; %>
    <br>
</c:forEach>

<br><br><hr>

<c:forEach begin="1" end="5" step="1" var="i">
    <c:forEach begin="1" end="<%=blank3%>" step="1" var="k">
        &nbsp;
    </c:forEach>
    <c:forEach begin="1" end="<%=height2%>" step="1" var="j">
        ${"*"}
    </c:forEach>
    <% blank3--; %>
    <% height2 += 2; %>
    <br>
</c:forEach>

<br><br><hr>






















</body>
</html>