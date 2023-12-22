package com.study.free.web;

import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.servlet.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class FreeList implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList();
        req.setAttribute("freeBoardList", freeBoardList);

        return "free/freeList";
    }
}
