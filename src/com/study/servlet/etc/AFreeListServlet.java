package com.study.servlet.etc;

import com.study.common.vo.PagingVO;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet("/free/freeList.wow")
public class AFreeListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // freeList에 필요한 데이터 얻기
//        IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
//        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList();
//        req.setAttribute("freeBoardList", freeBoardList);
//
//        // freeList.jsp로 포워딩
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/free/freeList.jsp");
//        requestDispatcher.forward(req,resp);
    }
}
