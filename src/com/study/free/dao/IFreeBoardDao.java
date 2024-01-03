package com.study.free.dao;

import java.sql.Connection;
import java.util.List;


import com.study.common.vo.PagingVO;
import com.study.free.vo.FreeBoardSearchVO;
import com.study.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Param;

public interface IFreeBoardDao {
	
	
public List<FreeBoardVO> getBoardList(@Param("paging") PagingVO paging, @Param("search")FreeBoardSearchVO search) ;
	
  public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search")FreeBoardSearchVO search);
  public FreeBoardVO getBoard( int boNo);  
  public int increaseHit(int boNo); 
  public int updateBoard( FreeBoardVO freeBoard);
  public int deleteBoard( FreeBoardVO freeBoard);
  public int insertBoard(FreeBoardVO freeBoard);

  
}
