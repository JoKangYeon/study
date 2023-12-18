package com.study.member.service;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.dao.IMemberDao;
import com.study.member.dao.MemberDaoOracle;
import com.study.member.vo.MemberVO;

import java.util.List;


public class MemberServiceImpl implements IMemberService{

    IMemberDao memberDao = new MemberDaoOracle();

    @Override
    public List<MemberVO> getMemberList() {
        return memberDao.getMemberList();
    }

    @Override
    public MemberVO getMember(String memId) throws BizNotFoundException {
        MemberVO memberVO = memberDao.getMember(memId);
        if(memberVO == null){
            throw new BizNotFoundException();
        }
        return  memberVO;
    }

    @Override
    public void modifyMember(MemberVO member) throws BizPasswordNotMatchedException {
        MemberVO vo = memberDao.getMember(member.getMemId());
        if(member.getMemPass().equals(vo.getMemPass())){
            memberDao.updateMember(member);
        }else {
            throw new BizPasswordNotMatchedException("비밀번호 틀림, 사용자가 아님");
        }

    }

    @Override
    public void removeMember(MemberVO member) throws BizPasswordNotMatchedException {
        MemberVO vo = memberDao.getMember(member.getMemId());
        if(member.getMemPass().equals(vo.getMemPass())){
            memberDao.deleteMember(member);
        }else {
            throw new BizPasswordNotMatchedException("비밀번호 틀림, 사용자가 아님");
        }
    }

    @Override
    public void registMember(MemberVO member) {
        memberDao.insertMember(member);
    }
}
