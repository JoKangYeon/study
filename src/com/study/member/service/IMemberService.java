package com.study.member.service;

import java.util.List;

import com.study.common.vo.PagingVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(PagingVO paging, MemberSearchVO search);
	public MemberVO getMember(String memId)  throws BizNotFoundException;
	public void modifyMember(MemberVO member) throws BizDuplicateKeyException;
	public void removeMember(MemberVO member) throws BizDuplicateKeyException;
	public void registMember(MemberVO member) throws BizDuplicateKeyException, BizNotFoundException;
}
