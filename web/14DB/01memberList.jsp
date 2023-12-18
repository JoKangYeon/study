<%@ page import="com.sun.jdi.connect.spi.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.study.member.vo.MemberVO" %>
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
01memberList.jsp  01 memberView.jsp?memId=a002
member 정보들 화면에 출력
MemberVO member = new MemberVO();
set 하는 것도 하고싶은거 2,3개만 <br>
<%

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    String url = "jdbc:oracle:thin:@nextit.or.kr:1521:xe";
    String id = "std205";
    String pw = "oracle21c";

    java.sql.Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(url, id, pw);

        StringBuffer query = new StringBuffer();

        query.append(" SELECT mem_id, mem_pass, mem_name, mem_job ");
        query.append(" FROM MEMBER ");

        ps = conn.prepareStatement(query.toString());
        rs = ps.executeQuery();

        List<MemberVO> memList = new ArrayList<>();

        while (rs.next()){
            MemberVO member = new MemberVO();
            String memId = rs.getString("mem_id");
            String memPass = rs.getString("mem_pass");
            String memName = rs.getString("mem_name");
            String memJob = rs.getString("mem_job");

            member.setMemId(memId);
            member.setMemPass(memPass);
            member.setMemName(memName);
            member.setMemJob(memJob);

            memList.add(member);
        }
        request.setAttribute("memList", memList);


    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if(rs != null){
            rs.close();
        }
        if(ps != null){
            ps.close();
        }
        if(conn != null){
            conn.close();
        }

    }


%>

${memList}












</body>
</html>