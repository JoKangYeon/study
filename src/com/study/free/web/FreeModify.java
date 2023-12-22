package com.study.free.web;

import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.servlet.Handler;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeModify implements Handler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //<jsp:useBean id="freeBoard" class="com.study.free.vo.FreeBoardVO"></jsp:useBean>
        //<jsp:setProperty name="freeBoard" property="*"></jsp:setProperty>
        // setProperty * 처럼 한번에 파라미터를 처리하면 됨
        FreeBoardVO freeBoard = new FreeBoardVO();
        BeanUtils.populate(freeBoard, req.getParameterMap());
        req.setAttribute("freeBoard", freeBoard);
//        {"boTitle" : 값 , "boWriter" 값 ...}

        IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
        try {
            freeBoardService.modifyBoard(freeBoard);
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "freeModify 수정", "성공", "/free/freeList.wow", "목록으로");
            req.setAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        } catch (BizPasswordNotMatchedException bnf) {
            ResultMessageVO resultMessageVO = new ResultMessageVO();
            resultMessageVO.messageSetting(true, "freeModify 수정", "실패", "/free/freeList.wow", "목록으로");
            req.setAttribute("resultMessageVO", resultMessageVO);
            return "common/message";
        }

    }
}
