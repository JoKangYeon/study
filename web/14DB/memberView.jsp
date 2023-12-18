<%@ page import="java.sql.*" %>
<%@ page import="com.study.member.vo.MemberVO" %>
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

    String url = "jdbc:oracle:thin:@nextit.or.kr:1521:xe";
    String id = "std205";
    String pw = "oracle21c";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String memId = request.getParameter("memId");

    try{
        conn = DriverManager.getConnection(url, id, pw);

        StringBuffer query = new StringBuffer();
        query.append(" SELECT mem_name, mem_id, mem_hobby, mem_job, mem_del_yn ");
        query.append(" FROM MEMBER ");
        query.append(" WHERE mem_id = ? ");

        ps = conn.prepareStatement(query.toString());
        ps.setString(1, memId);

        rs = ps.executeQuery();

        if(rs.next()){
            MemberVO memberVO = new MemberVO();

            memberVO.setMemName(rs.getString("mem_name"));
            memberVO.setMemId(rs.getString("mem_id"));
            memberVO.setMemHobby(rs.getString("mem_hobby"));
            memberVO.setMemJob(rs.getString("mem_job"));
            memberVO.setMemDelYn(rs.getString("mem_del_yn"));

            request.setAttribute("memberVO", memberVO );
        }

    }catch (SQLException e){
        e.printStackTrace();
    }finally {
        if(conn != null){
            conn.close();
        }
        if(rs != null){
            rs.close();
        }
        if(ps != null){
            ps.close();
        }

    }
%>

${memberVO}

</body>
</html>