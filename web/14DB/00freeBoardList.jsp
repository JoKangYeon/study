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

<%
    // 1. 로드 (Class.forName)
    // 2. 연결 (DriverManager.getConnection())
    // 3. 쿼리 실행
    // 4. 종료

    //기본 첫 free_board List(select)
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch ( ClassNotFoundException e) {
        e.printStackTrace();
    }


    try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@nextit.or.kr:1521:xe", "std205", "oracle21c");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(" SELECT bo_no, bo_title, bo_category, bo_writer  " +
                " FROM free_board");){
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





    } catch (SQLException e){
        e.printStackTrace();
    } finally {
        if(conn != null) conn.close();
        if(stmt != null) stmt.close();
        if(rs != null) rs.close();
    }



%>

${freeBoardList}

</body>
</html>