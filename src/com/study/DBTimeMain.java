package com.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBTimeMain {
    public static void main(String[] args) throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");


        long start = System.currentTimeMillis();

        for (int i = 0; i < 50; i++) {
            Connection conn = null;
            PreparedStatement preparedStatement = null;
            ResultSet rs = null;

            conn = DriverManager.getConnection("jdbc:oracle:thin:@nextit.or.kr:1521:xe", "std205", "oracle21c");
            //DB에서 직접 연결하는 코드 x
            // DB에서 직접 연결한 코든느 서버 시작전에 처음 한번만
            // jsp에서는 ConnectionPool에 Connection 객체 요청하도록 변경

            String query= "select 55 from dual";
            preparedStatement = conn.prepareStatement(query);
            rs= preparedStatement.executeQuery(query);
            rs.next();
            System.out.println(rs.getInt(1));
            conn.close();
            preparedStatement.close();
            rs.close();
        }


        long end = System.currentTimeMillis();
        System.out.println(end-start);







    }
}
