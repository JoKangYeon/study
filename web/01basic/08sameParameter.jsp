<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<%
    String name1=request.getParameter("name");  // 첫 번째것만 주지 않나?
    String name2=request.getParameter("name");
    String[] names = request.getParameterValues("name");
    String[] hobbies = request.getParameterValues("hobby");
%>
이름1 : <%=names[0]%> <br>
이름2 : <%=names[1]%> <br>
내 취미 <%= Arrays.toString(hobbies)%>
<hr>

<%
    // request의 모든 파라미터 이름을 알고 싶어요.
    // name, hobby를 얻을 수 있을 거고
    // name : 이름 1, 이름2
    // hobby : 선택한 취미들을 out.print()
    Enumeration<String> parameterNames = request.getParameterNames();
    while (parameterNames.hasMoreElements()){
        String param = parameterNames.nextElement(); //name, hobby

        // for문 쓰면 되긴하는데..
        out.print(param + " : " + Arrays.toString(request.getParameterValues(param)));
    }
    out.print("<br>");

    Map<String, String[]> parameterMap = request.getParameterMap();
    Set<Map.Entry<String, String[]>> entries = parameterMap.entrySet();
    for(Map.Entry<String, String[]> entry : entries){
        out.print(entry.getKey() + " : " + Arrays.toString(entry.getValue()));
    }

%>


</body>
</html>
