package com.study.member.web;

import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MemberList implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        IMemberService memberService = new MemberServiceImpl();
        List<MemberVO> memberVOList = memberService.getMemberList();
        req.setAttribute("memberVOList", memberVOList);
        return "member/memberList";
    }
}
