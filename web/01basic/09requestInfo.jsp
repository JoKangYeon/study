<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

모든 파라미터 <br>
<%
    Map<String, String[]> parameterMap = request.getParameterMap();
    Set<Map.Entry<String, String[]>> entries = parameterMap.entrySet();
    for(Map.Entry<String, String[]> entry : entries){
        out.print(entry.getKey() + " : " + Arrays.toString(entry.getValue()) + "<br>");
    }
%>
<hr>
uri : <%=request.getRequestURI()%>  <br>
method : <% out.print(request.getMethod()); %> <br>
IP : <%=request.getRemoteUser()%>   <br>
encoding : <%=request.getCharacterEncoding()%>  <br>
length : <%=request.getContentLength()%>    <br>

<hr>
모든 헤더 보기 <br>
<%
    Enumeration<String> headerNames = request.getHeaderNames();
    while (headerNames.hasMoreElements()){
        String headerName = headerNames.nextElement();
        out.print( headerName + " : " + request.getHeader(headerName) + "<br>");
        //  out.print(headerNames.nextElement()
        //  + " : " + request.getHeader(headerNames.nextElement()))
        //
    }

%>



</body>
</html>