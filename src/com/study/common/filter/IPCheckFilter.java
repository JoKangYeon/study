package com.study.common.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebFilter(urlPatterns = "/*")
public class IPCheckFilter implements Filter {
    private Map<String, Boolean> ipDenyMap = new HashMap<>();
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ipDenyMap.put("192.168.0.11", false);
        ipDenyMap.put("192.168.0.25", false);

        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        String ip = req.getRemoteAddr();
        System.out.println(ip);

        if(ipDenyMap.get(ip) != null){
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            response.getWriter().println("허용되지 않는 ip입니다");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
