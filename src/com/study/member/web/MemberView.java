package com.study.member.web;

import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberView implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String memId = req.getParameter("memId");
        IMemberService memberService = new MemberServiceImpl();
        try {
            MemberVO memberVO = memberService.getMember(memId);
            req.setAttribute("memberVO", memberVO);
        } catch (BizNotFoundException bne) {
            req.setAttribute("bne", bne);
        }
        return "member/memberView";
    }
}
