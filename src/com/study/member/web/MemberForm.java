package com.study.member.web;


import com.study.code.ParentCode;
import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MemberForm implements Handler {
    ICommCodeService codeService = new CommCodeServiceImpl();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        List<CodeVO> jobList = codeService.getCodeListByParent(ParentCode.JB00.name());
        req.setAttribute("jobList", jobList);
        List<CodeVO> hobbyList = codeService.getCodeListByParent(ParentCode.HB00.name());
        req.setAttribute("hobbyList", hobbyList);
        return "member/memberForm";
    }
}
