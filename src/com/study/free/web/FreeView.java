package com.study.free.web;

import com.study.exception.BizNotFoundException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeView implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int boNo = Integer.parseInt(req.getParameter("boNo"));
        IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
        try {
            FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
            req.setAttribute("freeBoard", freeBoard);
        } catch (BizNotFoundException bne) {
            req.setAttribute("bne", bne);
        }
        return "free/freeView";







    }
}
