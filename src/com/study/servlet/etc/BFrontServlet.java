package com.study.servlet.etc;

import com.study.exception.BizNotFoundException;
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

public class BFrontServlet extends HttpServlet {
    // servlet하나가 모든 요청을 앞에서 처리하기 때문에 front라고 함

    //list, view의 get도 처리하고, modify의 post도 처리하기 떄문에


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();

        if(uri.equals("/free/freeList.wow")){
            // list로 오면 여기..
            IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
            List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList();
            req.setAttribute("freeBoardList", freeBoardList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/free/freeList.jsp");
            requestDispatcher.forward(req,resp);
        }else if(uri.equals("/free/freeView.wow")){
            // view로 오면 여기..
            int boNo = Integer.parseInt(req.getParameter("boNo"));
            IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
            try {
                FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
                req.setAttribute("freeBoard", freeBoard);
            } catch (BizNotFoundException bne) {
                req.setAttribute("bne", bne);
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/free/freeView.jsp");
            requestDispatcher.forward(req,resp);

        }else if(uri.equals("/free/freeEdit.wow")){
            // edit로 오면 여기..
            int boNo = Integer.parseInt(req.getParameter("boNo"));
            IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
            try {
                FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
                req.setAttribute("freeBoard", freeBoard);
            } catch (BizNotFoundException bne) {
                req.setAttribute("bne", bne);
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/free/freeEdit.jsp");
            requestDispatcher.forward(req,resp);
        }


    }
}
