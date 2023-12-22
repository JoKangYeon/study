package com.study.login.web;

import com.study.common.util.CookieUtils;
import com.study.login.service.ILoginService;
import com.study.login.service.LoginServiceImpl;
import com.study.login.vo.UserVO;
import com.study.servlet.Handler;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

public class Login implements Handler {

    ILoginService loginService = new LoginServiceImpl();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String method = req.getMethod();
        if (method.equals("GET")) {
            return "login/login";
        }
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPass");
        String rememberYN = req.getParameter("rememberMe");


        UserVO user = loginService.getUser(userId, userPw);

        if (userId == null || userPw == null || userId.isEmpty() || userPw.isEmpty()) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 입력해주세요", "utf-8");
        }
        if (user == null) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요", "utf-8");
        } else {

            //로그인 성공
            HttpSession session = req.getSession();
            // 사용자가 login.wow전에 여기저기 돌아다녔다면 서버는 당연히 그 사용자에 대한 session이 있음
            // 가지고 있는 session 그대로 전달
            // 만약 어느 사용자의 첫 요청이 login.wow라면 서버는 현재 사용자에 대한 session이 없음
            // getSession한 순간 session 새로 만들고 그 session을 return


            if (user.getUserPass().equals(userPw)) {

                session.setAttribute("USER_INFO", user);
                System.out.println("afadsd");
//
//                    if (rememberYN == null) {
//                        System.out.println(rememberYN);
//                    } else if (rememberYN.equals("Y")) {
//                        System.out.println(rememberYN);
//                    }
//                    Cookie cookie = new Cookie("AUTH", userId);
//                    resp.addCookie(cookie);

                return "redirect:/";
            } else {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요", "utf-8");
            }


        }


    }
}
