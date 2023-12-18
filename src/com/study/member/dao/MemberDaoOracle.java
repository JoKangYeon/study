package com.study.member.dao;

import com.study.exception.DaoException;
import com.study.member.vo.MemberVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDaoOracle implements IMemberDao{
    @Override
    public List<MemberVO> getMemberList() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append("  SELECT                                    		     ");
            query.append("      mem_id,         mem_pass,       mem_name,        ");
            query.append("      mem_bir,        mem_zip,        mem_add1,        ");
            query.append("      mem_add2,       mem_hp,         mem_mail,        ");
            query.append("      mem_job,        mem_hobby,      mem_mileage,     ");
            query.append("      mem_del_yn                                       ");
            query.append("  FROM                                                 ");
            query.append("      member                                           ");

            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();

            List<MemberVO> memberVOList = new ArrayList<>();
            while (rs.next()){
                MemberVO memberVO = new MemberVO();
                memberVO.setMemId(rs.getString("mem_id"));
                memberVO.setMemPass(rs.getString("mem_pass"));
                memberVO.setMemName(rs.getString("mem_name"));
                memberVO.setMemBir(rs.getString("mem_bir"));
                memberVO.setMemZip(rs.getString("mem_zip"));
                memberVO.setMemAdd1(rs.getString("mem_add1"));
                memberVO.setMemAdd2(rs.getString("mem_add2"));
                memberVO.setMemHp(rs.getString("mem_hp"));
                memberVO.setMemMail(rs.getString("mem_mail"));
                memberVO.setMemJob(rs.getString("mem_job"));
                memberVO.setMemHobby(rs.getString("mem_hobby"));
                memberVO.setMemMileage(rs.getInt("mem_mileage"));
                memberVO.setMemDelYn(rs.getString("mem_del_yn"));

                memberVOList.add(memberVO);
            }
            return memberVOList;
        }catch ( SQLException e){
            throw new DaoException("memberList에서 에러발생", e);
        }finally {
            if(conn != null){try {conn.close();} catch (SQLException e) {}}
            if(ps != null){try {ps.close();} catch (SQLException e) { }}
            if(rs != null){try {rs.close();} catch (SQLException e) { }}
        }
    }

    @Override
    public MemberVO getMember(String memId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

            try {
                conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
                StringBuffer query = new StringBuffer();
                query.append("  SELECT                                    		     ");
                query.append("      mem_id,         mem_pass,       mem_name,        ");
                query.append("      mem_bir,        mem_zip,        mem_add1,        ");
                query.append("      mem_add2,       mem_hp,         mem_mail,        ");
                query.append("      mem_job,        mem_hobby,      mem_mileage,     ");
                query.append("      mem_del_yn                                       ");
                query.append("  FROM                                                 ");
                query.append("      member                                           ");
                query.append("  WHERE mem_id = ?                                     ");

                ps = conn.prepareStatement(query.toString());
                int idx = 1;
                ps.setString(idx, memId);

                rs = ps.executeQuery();

                if (rs.next()) {
                    MemberVO memberVO = new MemberVO();

                    memberVO.setMemId(rs.getString("mem_id"));
                    memberVO.setMemPass(rs.getString("mem_pass"));
                    memberVO.setMemName(rs.getString("mem_name"));
                    memberVO.setMemBir(rs.getString("mem_bir"));
                    memberVO.setMemZip(rs.getString("mem_zip"));
                    memberVO.setMemAdd1(rs.getString("mem_add1"));
                    memberVO.setMemAdd2(rs.getString("mem_add2"));
                    memberVO.setMemHp(rs.getString("mem_hp"));
                    memberVO.setMemMail(rs.getString("mem_mail"));
                    memberVO.setMemJob(rs.getString("mem_job"));
                    memberVO.setMemHobby(rs.getString("mem_hobby"));
                    memberVO.setMemMileage(rs.getInt("mem_mileage"));
                    memberVO.setMemDelYn(rs.getString("mem_del_yn"));

                    return memberVO;
                }

                return null;    // 해당멤버가 없을 때

            } catch (SQLException e) {
                throw new DaoException("getMember에서 에러발생", e);
            } finally {
                if(conn != null){try {conn.close();} catch (SQLException e) {}}
                if(ps != null){try {ps.close();} catch (SQLException e) {}}
                if(rs != null){try {rs.close();} catch (SQLException e) {}}
            }
    }

    @Override
    public int updateMember(MemberVO member) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append("  UPDATE member SET                               ");
            query.append("      mem_pass = ?    ,                           ");
            query.append("      mem_name = ?    ,                           ");
            query.append("      mem_bir = ?     ,   					    ");
            query.append("      mem_zip = ?     ,                           ");
            query.append("      mem_add1 = ?    ,                           ");
            query.append("      mem_add2 = ?    ,                           ");
            query.append("      mem_mail = ?    ,                           ");
            query.append("      mem_job = ?     ,                           ");
            query.append("      mem_hobby = ?                               ");
            query.append("  WHERE mem_id = ?                                ");

            ps = conn.prepareStatement(query.toString());
            int idx = 1;
            ps.setString(idx++, member.getMemPass());
            ps.setString(idx++, member.getMemName());
            ps.setString(idx++, member.getMemBir());
            ps.setString(idx++, member.getMemZip());
            ps.setString(idx++, member.getMemAdd1());
            ps.setString(idx++, member.getMemAdd2());
            ps.setString(idx++, member.getMemMail());
            ps.setString(idx++, member.getMemJob());
            ps.setString(idx++, member.getMemHobby());
            ps.setString(idx++, member.getMemId());

            int row = ps.executeUpdate();

            return row;


        } catch (SQLException e) {
            throw new DaoException("updateMember 도중 에러 발생", e);
        } finally {
            if(conn != null){try {conn.close();} catch (SQLException e) {}}
            if(ps != null){try {ps.close();} catch (SQLException e) {}}
            if(rs != null){try {rs.close();} catch (SQLException e) {}}
        }

    }

    @Override
    public int deleteMember(MemberVO member) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append("  UPDATE member SET                               ");
            query.append("      mem_del_yn = 'Y'                            ");
            query.append("  WHERE mem_id = ?                                ");

            ps = conn.prepareStatement(query.toString());
            int idx = 1;
            ps.setString(idx, member.getMemId());

            int row = ps.executeUpdate();
            return row;


        } catch (SQLException e) {
            throw new DaoException("delete 도중 에러 발생", e);
        } finally {
            if(conn != null){try {conn.close();} catch (SQLException e) {}}
            if(ps != null){try {ps.close();} catch (SQLException e) {}}
        }
    }

    @Override
    public int insertMember(MemberVO member) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();

            query.append("        INSERT INTO member (                                  ");
            query.append("           mem_id,                                            ");
            query.append("           mem_pass,                                          ");
            query.append("           mem_name,                                          ");
            query.append("           mem_bir,                                           ");
            query.append("           mem_zip,                                           ");
            query.append("           mem_add1,                                          ");
            query.append("           mem_add2,                                          ");
            query.append("           mem_hp,                                            ");
            query.append("           mem_mail,                                          ");
            query.append("           mem_job,                                           ");
            query.append("           mem_hobby,                                         ");
            query.append("           mem_mileage,                                       ");
            query.append("           mem_del_yn                                         ");
            query.append("       ) VALUES (                                             ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         to_date(?, 'YYYY-MM-DD'),                            ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         ? ,                                                  ");
            query.append("         0 ,                                                  ");
            query.append("         'N'                                                  ");
            query.append("       )                                                     ");

            ps = conn.prepareStatement(query.toString());
            int idx = 1;
            ps.setString(idx++, member.getMemId());
            ps.setString(idx++, member.getMemPass());
            ps.setString(idx++, member.getMemName());
            ps.setString(idx++, member.getMemBir());
            ps.setString(idx++, member.getMemZip());
            ps.setString(idx++, member.getMemAdd1());
            ps.setString(idx++, member.getMemAdd2());
            ps.setString(idx++, member.getMemHp());
            ps.setString(idx++, member.getMemMail());
            ps.setString(idx++, member.getMemJob());
            ps.setString(idx++, member.getMemHobby());

            int row = ps.executeUpdate();
            return row;

        }catch ( SQLException e){
            throw new DaoException("insert 중 에러 발생", e);
        }finally {
            if(conn != null){try {conn.close();} catch (SQLException e) {}}
            if(ps != null){try {ps.close();} catch (SQLException e) {}}
            if(rs != null){try {rs.close();} catch (SQLException e) {}}
        }
    }
}
