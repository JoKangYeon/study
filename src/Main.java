import com.study.free.vo.FreeBoardVO;
import oracle.jdbc.driver.OracleDriver;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Main {
    public static void main(String[] args) throws InstantiationException, IllegalAccessException, InvocationTargetException {

        //Reflection, Class

        //Class.    자바의 class 중 하나입니다. String class, Class class 처럼
        //Class<FreeBoardVO>. FreeBoardVO class의 정보를 가지고 있는 Class class입니다
        // 필드, 메소드, 생성자 등에 관한 정보가 있습니다 이걸 이용해 객체생성, 메소드실행도 가능

//        Class clazzFree = Class.forName("com.study.free.vo.FreeBoardVO");
        Class clazzFree = FreeBoardVO.class;

//        // 현재 class 이름
//        System.out.println("classFree 이름 :" + clazzFree.getName());
//        System.out.println("classFree 간단이름 :" + clazzFree.getSimpleName());
//        System.out.println("--------------------------------------------------------");
//
//        // 모든필드
//        Field[] declaredFields = clazzFree.getDeclaredFields();     //declared랑 아닌거 : private도 접근가능
//        for(Field field : declaredFields){
//            System.out.println("필드 이름 : " + field.getName());
//            System.out.println("필드 타입 이름 : " + field.getType().getName());
//            System.out.println("필드 타입 간단이름 : " + field.getType().getSimpleName());
//            System.out.println();
//        }

        //모든 메소드
        Method[] declaredMethods = clazzFree.getDeclaredMethods();
        for(Method method : declaredMethods){
            System.out.println("메소드 이름 : " + method.getName() );
            System.out.println("메소드 리턴 타입 : " + method.getReturnType().getSimpleName());
            Parameter[] parameters = method.getParameters();
            if (parameters.length > 0){ //아마도 set
                for (Parameter parameter : parameters){
                    System.out.println("파라미터 이름 : " + parameter.getName());
                    System.out.println("파라미터 타입 : " + parameter.getType().getSimpleName());
                }
            }else{//아마도 get + toString
                System.out.println("파라미터 없음");
            }
        }


        System.out.println("-------------------------------------------------------");
//        FreeBoardVO freeBoard = new FreeBoardVO();
        FreeBoardVO freeBoardVO = (FreeBoardVO) clazzFree.newInstance();
        Method[] methods = clazzFree.getDeclaredMethods();
        for(Method method : methods){
            String methodName = method.getName();
            if(methodName.startsWith("set")){
                Parameter[] parameters = method.getParameters();
                if(parameters[0].getType().getSimpleName().equals("int")){
                    method.invoke(freeBoardVO, 5);
                }else if(parameters[0].getType().getSimpleName().equals("String")){
                    method.invoke(freeBoardVO, "String 값");
                }
            }
        }
        System.out.println(freeBoardVO);

















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

//        OracleDriver oracleDriver = null;
//        try {
//            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@nextit.or.kr:1521:xe", "std205", "oracle21c");
//
//            Statement stmt = connection.createStatement();
//            ResultSet rs = stmt.executeQuery(" select 99 from dual");
//
//            rs.next();
//            System.out.println(rs.getInt(1));
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

    }

    public static Object etAllfields(Class clazz) throws Exception{
        Object o = clazz.newInstance();
        Method[] methods = clazz.getDeclaredMethods();
        for(Method method : methods){
            String methodName = method.getName();
            if(methodName.startsWith("set")){
                Parameter[] parameters = method.getParameters();
                if(parameters[0].getType().getSimpleName().equals("int")){
                    method.invoke(o, 5);
                }else if(parameters[0].getType().getSimpleName().equals("String")){
                    method.invoke(o, "String 값");
                }
            }
        }
        return o;


    }
}
