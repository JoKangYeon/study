<%@ page import="java.sql.*" %>
<%@ page import="com.study.free.vo.FreeBoardVO" %>
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
<%
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
    int boNo = Integer.parseInt(request.getParameter("boNo"));
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@nextit.or.kr:1521:xe", "std205", "oracle21c");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM free_board WHERE bo_no=? ");
    ps.setInt(1,boNo);
    // 쿼리는 stmt보다는 PrepareStatement를 사용하도록 권장 SQL INJECTION 방어
    ResultSet rs = ps.executeQuery();
    try(conn ; ps ; rs ; ){

        if(rs.next()){
            FreeBoardVO freeBoard = new FreeBoardVO();
            freeBoard.setBoNo(rs.getInt("bo_no"));
            freeBoard.setBoCategory(rs.getString("bo_category"));
            freeBoard.setBoContent(rs.getString("bo_content"));
            freeBoard.setBoWriter(rs.getString("bo_writer"));
            freeBoard.setBoPass(rs.getString("bo_pass"));
            request.setAttribute("freeBoard", freeBoard);
        }

    }catch (SQLException e){
        e.printStackTrace();
    }
%>

${freeBoard}
</body>
</html>