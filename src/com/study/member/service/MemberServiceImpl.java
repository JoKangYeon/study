package com.study.member.service;

import com.study.common.util.MybatisSqlSessionFactory;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotFoundException;
import com.study.free.dao.IFreeBoardDao;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;


public class MemberServiceImpl implements IMemberService {

    SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    @Override
    public List<MemberVO> getMemberList() {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            IMemberDao iMemberDao = session.getMapper(IMemberDao.class);
            return iMemberDao.getMemberList();
        }
    }

    @Override
    public MemberVO getMember(String memId) throws BizNotFoundException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            IMemberDao iMemberDao = session.getMapper(IMemberDao.class);
            MemberVO memberVO = iMemberDao.getMember(memId);
            if (memberVO == null) {
                throw new BizNotFoundException();
            }
            return memberVO;
        }
    }

    @Override
    public void modifyMember(MemberVO member) throws BizDuplicateKeyException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            IMemberDao iMemberDao = session.getMapper(IMemberDao.class);
            MemberVO vo = iMemberDao.getMember(member.getMemId());
            if (member.getMemPass().equals(vo.getMemPass())) {
                iMemberDao.updateMember(member);
            } else {
                throw new BizDuplicateKeyException("비밀번호 틀림, 사용자가 아님");
            }
        }

    }

    @Override
    public void removeMember(MemberVO member) throws BizDuplicateKeyException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            IMemberDao iMemberDao = session.getMapper(IMemberDao.class);
            MemberVO vo = iMemberDao.getMember(member.getMemId());
            if (member.getMemPass().equals(vo.getMemPass())) {
                iMemberDao.deleteMember(member);
            } else {
                throw new BizDuplicateKeyException("비밀번호 틀림, 사용자가 아님");
            }
        }
    }

    @Override
    public void registMember(MemberVO member) throws BizNotFoundException {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            IMemberDao iMemberDao = session.getMapper(IMemberDao.class);
            MemberVO vo = iMemberDao.getMember(member.getMemId());
            if (vo == null) {
                iMemberDao.insertMember(member);
            } else {

                throw new BizNotFoundException("중복된 아이디입니다.");
            }
        }
    }
}
