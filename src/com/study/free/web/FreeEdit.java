package com.study.free.web;

import com.study.code.ParentCode;
import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.exception.BizNotFoundException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class FreeEdit implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int boNo = Integer.parseInt(req.getParameter("boNo"));
        IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
        ICommCodeService codeService = new CommCodeServiceImpl();
        try {
            FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
            req.setAttribute("freeBoard", freeBoard);
            List<CodeVO> categoryList = codeService.getCodeListByParent(ParentCode.BC00.name());
            req.setAttribute("categoryList", categoryList);
            return "free/freeEdit";
        } catch (BizNotFoundException bne) {
            req.setAttribute("bne", bne);
        }
        return "free/freeEdit";
    }
}
