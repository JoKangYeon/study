package com.study.common.filter;

import com.study.login.vo.UserVO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/login/login.wow")
public class LoginCheckFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpSession session = req.getSession();
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        UserVO user = (UserVO) session.getAttribute("USER_INFO");
        if(user != null){ // 로그인성공
            response.getWriter().println("you have been logined");
            return;
        }else {// 로그인 실패
            filterChain.doFilter(servletRequest, servletResponse);
        }


    }
}
