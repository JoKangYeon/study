<%@ page import="java.sql.*" %>
<%@ page import="com.study.free.vo.FreeBoardVO" %>
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
02dbcpTest.jsp

<%
    // 1. 로드(서버 켜질때) 2. 연결 3. 쿼리 4. 종료
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try{
        conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
        ps = conn.prepareStatement(" SELECT * FROM free_board");
        rs = ps.executeQuery();
        List<FreeBoardVO> freeBoardList = new ArrayList<>();
        while (rs.next()){
            FreeBoardVO freeBoard = new FreeBoardVO();
            int boNo = rs.getInt("bo_no");
            String boTitle = rs.getString("bo_title");
            String boCategory = rs.getString("bo_category");
            String boWriter = rs.getString("bo_writer");
            freeBoard.setBoNo(boNo);
            freeBoard.setBoTitle(boTitle);
            freeBoard.setBoCategory(boCategory);
            freeBoard.setBoWriter(boWriter);

            freeBoardList.add(freeBoard);
        }
        request.setAttribute("freeBoardList", freeBoardList);

    }catch (SQLException e){
        e.printStackTrace();
    }finally {
        if(conn != null){
            conn.close();
        }
        if(rs != null){
            rs.close();
        }
        if(ps != null) {
            ps.close();
        }
    }
%>
${freeBoardList}

</body>
</html>