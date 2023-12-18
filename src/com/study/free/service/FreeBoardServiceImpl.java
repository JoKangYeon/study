package com.study.free.service;

import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.dao.FreeBoardDaoOracle;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;

import java.util.List;

public class FreeBoardServiceImpl implements IFreeBoardService{

    IFreeBoardDao freeBoardDao = new FreeBoardDaoOracle();

    @Override
    public List<FreeBoardVO> getBoardList() {
        return freeBoardDao.getBoardList();
    }

    @Override
    public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(boNo);    // DB를 정상적으로 실행
        if( freeBoard == null){
            throw new BizNotFoundException();
        }
        return freeBoard;
    }

    @Override
    public void modifyBoard(FreeBoardVO freeBoard) throws BizPasswordNotMatchedException {
        //freeBoard는 사용자가 입력한 데이터
        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getBoNo());    // vo는 현재 DB에 있는 데이터
        if(freeBoard.getBoPass().equals(vo.getBoPass())){
            // 작성자니까 비밀번호 맞출 수 있는 경우
            freeBoardDao.updateBoard(freeBoard);
        }else{
            throw new BizPasswordNotMatchedException("비밀번호 틀림. 사용자가아님");
        }


    }

    @Override
    public void removeBoard(FreeBoardVO freeBoard) throws BizPasswordNotMatchedException {
        //freeBoard는 사용자가 입력한 데이터
        FreeBoardVO vo = freeBoardDao.getBoard(freeBoard.getBoNo());    // vo는 현재 DB에 있는 데이터
        if(freeBoard.getBoPass().equals(vo.getBoPass())){
            // 작성자니까 비밀번호 맞출 수 있는 경우
            freeBoardDao.deleteBoard(freeBoard);
        }else{
            throw new BizPasswordNotMatchedException("비밀번호 틀림. 사용자가아님");
        }
    }

    @Override
    public void registBoard(FreeBoardVO freeBoard) {
        freeBoardDao.insertBoard(freeBoard);
    }
}
