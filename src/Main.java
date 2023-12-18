import oracle.jdbc.driver.OracleDriver;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Main {
    public static void main(String[] args) {

//        //LocalDate LocalTime LocalDateTime를 쓰자..
//
//        //LocalDate 사용이유
//        // 1. 편하고 직관적 2. 날짜 계산이 쉽다. 3. String 변환이 쉽다 ?
//        LocalDate now = LocalDate.now();
//        LocalDate tomorrow =now.plusDays(1l);
//        LocalDate someDay = LocalDate.of(2023, 12, 12);
//        if(tomorrow.compareTo(someDay) < 0){
//            //someday가 더 나중이냐 아니냐
//
//            System.out.println("나중이");
//        }
//
//        String nowStr = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
////        nowStr = now.format(DateTimeFormatter.BASIC_ISO_DATE);
//        System.out.println(nowStr);
//
//        // 4.Spring에서 input type=date의 값이  RequestMapping 메소드의 파라미터로 자동 매핑됩니다.
//
//        // 5. DB의 date,(LocalDate) TimeStamp(LocalDateTime) 타입으로 변환이 됩니다.
//        // DB에 넣을 때 to_date 또는 to_char 등을 이용해서 insert select 등을 하는건 별로 안좋아요
//        // DB에 날짜를 String으로 넣는 건 좋지 않음
//
//        Date date = Date.valueOf(now);  //LocalDate를 DB에서 사용하는 Date타입으로 변환
//        System.out.println(date);
//        System.out.println(Timestamp.valueOf(LocalDateTime.now()));

        OracleDriver oracleDriver = null;
        try {
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@nextit.or.kr:1521:xe", "std205", "oracle21c");

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(" select 99 from dual");

            rs.next();
            System.out.println(rs.getInt(1));

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
