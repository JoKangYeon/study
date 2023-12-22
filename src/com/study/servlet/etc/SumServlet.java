package com.study.servlet.etc;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/sum.do")
//Get 방식 + url이 firstServlet으로 왔을때 이 클래스의 doget메소드 실행
public class SumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException, ServletException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<html><body><ul> ");

        int sum = 0;
        for (int i = 1; i < 10; i++) {
            sum += i;
            out.println("<li>1부터" + i + "까지 합 :" + sum + "</li>");
        }
        out.println("</html></body></ul>");







    }
}
