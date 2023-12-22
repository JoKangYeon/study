package com.study.login.web;

import com.study.common.util.CookieUtils;
import com.study.servlet.Handler;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

public class Logout implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        HttpSession session = req.getSession();
        session.removeAttribute("USER_INFO");

        return "redirect:/";
    }
}
