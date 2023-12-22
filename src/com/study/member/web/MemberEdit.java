package com.study.member.web;

import com.study.code.ParentCode;
import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MemberEdit implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String memId = req.getParameter("memId");
        IMemberService memberService = new MemberServiceImpl();
        ICommCodeService codeService = new CommCodeServiceImpl();

        try {
            MemberVO memberVO = memberService.getMember(memId);
            req.setAttribute("memberVO", memberVO);
            List<CodeVO> jobList = codeService.getCodeListByParent(ParentCode.JB00.name());
            req.setAttribute("jobList", jobList);
            List<CodeVO> hobbyList = codeService.getCodeListByParent(ParentCode.HB00.name());
            req.setAttribute("hobbyList", hobbyList);
            return "member/memberEdit";

        } catch (BizNotFoundException bne) {
            req.setAttribute("bne", bne);
        }
        return "member/memberEdit";
    }
}
