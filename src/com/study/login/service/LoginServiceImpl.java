package com.study.login.service;

import com.study.common.util.MybatisSqlSessionFactory;
import com.study.login.vo.UserVO;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class LoginServiceImpl implements ILoginService {

    SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    @Override
    public UserVO getUser(String id, String password) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            IMemberDao iMemberDao = session.getMapper(IMemberDao.class);
            MemberVO member = iMemberDao.getMember(id);
            if (member == null) {
                return null;    // id가 틀림
            }
            if (!member.getMemPass().equals(password)) {
                return null;
            }
            UserVO user = new UserVO(member.getMemId(), member.getMemName(), member.getMemPass(), "MEMBER");
            return user;
        }
    }
}
