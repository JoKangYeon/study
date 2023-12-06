package com.study.servlet;



import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//Get 방식 + url이 firstServlet으로 왔을때 이 클래스의 doget메소드 실행
public class FirstServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {

        PrintWriter out = resp.getWriter();     //out도 resp로부터 얻은 거...
        out.println("<html><body> Hello first world");

        out.println("<ul>");
        for (int i = 0; i < 10; i++) {
            out.println("<li>" + i);
        }

        out.println("</ul>");
        out.println("</body></html>");



    }
}
