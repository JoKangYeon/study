package com.study.free.dao;

import com.study.exception.DaoException;
import com.study.free.vo.FreeBoardVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FreeBoardDaoOracle implements IFreeBoardDao{


    @Override
    public List<FreeBoardVO> getBoardList() {
        // 1. 로드(서버 켜질때) 2. 연결 3. 쿼리 4. 종료
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append("   SELECT                                                     ");
            query.append("      bo_no,      bo_title,       bo_category,                ");
            query.append("      bo_writer,  bo_pass,        bo_content,                 ");
            query.append("      bo_hit,                                                 ");
            query.append("      to_char(bo_reg_date, 'YYYY-MM-DD') AS bo_reg_date,      ");
            query.append("      to_char(bo_mod_date, 'YYYY-MM-DD') AS bo_mod_date,      ");
            query.append("      bo_del_yn                                               ");
            query.append("  FROM                                                        ");
            query.append("      free_board                                             ");
            query.append("                                                              ");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();

            List<FreeBoardVO> freeBoardList = new ArrayList<>();

            while (rs.next()) {
                FreeBoardVO freeBoard = new FreeBoardVO();

                freeBoard.setBoNo(rs.getInt("bo_no"));
                freeBoard.setBoTitle(rs.getString("bo_title"));
                freeBoard.setBoCategory(rs.getString("bo_category"));
                freeBoard.setBoWriter(rs.getString("bo_writer"));
                freeBoard.setBoPass(rs.getString("bo_pass"));
                freeBoard.setBoContent(rs.getString("bo_content"));
                freeBoard.setBoHit(rs.getInt("bo_hit"));
                freeBoard.setBoRegDate(rs.getString("bo_reg_date"));
                freeBoard.setBoModDate(rs.getString("bo_mod_date"));
                freeBoard.setBoDelYn(rs.getString("bo_del_yn"));

                freeBoardList.add(freeBoard);
            }
            return freeBoardList;

        } catch (SQLException e) {
            throw new DaoException("freeBoardList에서 에러발생", e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {

                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {

                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {

                }
            }
        }
    }

    @Override
    public FreeBoardVO getBoard(int boNo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append("   SELECT                                                     ");
            query.append("      bo_no,      bo_title,       bo_category,                ");
            query.append("      bo_writer,  bo_pass,        bo_content,                 ");
            query.append("      bo_hit,                                                 ");
            query.append("      to_char(bo_reg_date, 'YYYY-MM-DD') AS bo_reg_date,      ");
            query.append("      to_char(bo_mod_date, 'YYYY-MM-DD') AS bo_mod_date,      ");
            query.append("      bo_del_yn                                               ");
            query.append("  FROM                                                        ");
            query.append("      free_board                                              ");
            query.append("  WHERE bo_no=?                                               ");

            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, boNo);

            rs = ps.executeQuery();

            if (rs.next()) {
                FreeBoardVO freeBoard = new FreeBoardVO();

                freeBoard.setBoNo(rs.getInt("bo_no"));
                freeBoard.setBoTitle(rs.getString("bo_title"));
                freeBoard.setBoCategory(rs.getString("bo_category"));
                freeBoard.setBoWriter(rs.getString("bo_writer"));
                freeBoard.setBoPass(rs.getString("bo_pass"));
                freeBoard.setBoContent(rs.getString("bo_content"));
                freeBoard.setBoHit(rs.getInt("bo_hit"));
                freeBoard.setBoRegDate(rs.getString("bo_reg_date"));
                freeBoard.setBoModDate(rs.getString("bo_mod_date"));
                freeBoard.setBoDelYn(rs.getString("bo_del_yn"));

                return freeBoard;
            }
            return null;    // int boNo도 잘 왔고, 쿼리도 문제없는데, DB에 boNO에 해당하는 글이 없을때..

        } catch (SQLException e) {
            throw new DaoException("free의 getBoard 실행중 에러", e);
        } finally {
            if (conn != null) {try {conn.close();} catch (SQLException e) {}}
            if (rs != null) {try {rs.close();} catch (SQLException e) {}}
            if (ps != null) {try {ps.close();} catch (SQLException e) {}}
        }
    }

    @Override
    public int increaseHit(int boNo) {
        return 0;
    }

    @Override
    public int updateBoard(FreeBoardVO freeBoard) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE free_board SET               ");
            query.append(" bo_title = ?                ,       ");
            query.append(" bo_category = ?             ,       ");
            query.append(" bo_content = ?              ,       ");
            query.append(" bo_mod_date = sysdate               ");
            query.append(" WHERE bo_no = ?                     ");

            ps = conn.prepareStatement(query.toString());
            int index = 1;
            ps.setString(index++, freeBoard.getBoTitle());
            ps.setString(index++, freeBoard.getBoCategory());
            ps.setString(index++, freeBoard.getBoContent());
            ps.setInt(index++, freeBoard.getBoNo());

            int row = ps.executeUpdate();
            return row;


        }catch (SQLException e){
            throw new DaoException("free update 도중 에러", e);
        }finally {
            if (conn != null) {try {conn.close();} catch (SQLException e) {}}
            if (rs != null) {try {rs.close();} catch (SQLException e) {}}
            if (ps != null) {try {ps.close();} catch (SQLException e) {}}
        }
    }

    @Override
    public int deleteBoard(FreeBoardVO freeBoard) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE free_board SET               ");
            query.append(" bo_del_yn = 'Y'                     ");
            query.append(" WHERE bo_no = ?                     ");

            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, freeBoard.getBoNo());
            int row = ps.executeUpdate();
            return row;

        }catch (SQLException e){
            throw new DaoException("free delete 도중 에러", e);
        }finally {
            if (conn != null) {try {conn.close();} catch (SQLException e) {}}
            if (rs != null) {try {rs.close();} catch (SQLException e) {}}
            if (ps != null) {try {ps.close();} catch (SQLException e) {}}
        }
    }

    @Override
    public int insertBoard(FreeBoardVO freeBoard) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer query = new StringBuffer();
            query.append("  INSERT INTO free_board (                                              ");
            query.append("     bo_no,           bo_title	,       bo_category		,             ");
            query.append("     bo_writer,       bo_pass		,       bo_content		,             ");
            query.append("     bo_hit,                                                            ");
            query.append("     bo_reg_date,                                                       ");
            query.append("     bo_mod_date,                                                       ");
            query.append("     bo_del_yn                                                          ");
            query.append(" ) VALUES (                                                             ");
            query.append("   seq_free_board.nextval         , ?          , ?         ,            ");
            query.append("   ?                              , ?          , ?         ,            ");
            query.append("   0                              ,                                     ");
            query.append("   sysdate                        ,                                     ");
            query.append("   null                           ,                                     ");
            query.append("   'N'                                                                  ");
            query.append(" )                                                                      ");
            query.append("                                                                        ");

            ps = conn.prepareStatement(query.toString());
            int index = 1;
            ps.setString(index++, freeBoard.getBoTitle());
            ps.setString(index++, freeBoard.getBoCategory());
            ps.setString(index++, freeBoard.getBoWriter());
            ps.setString(index++, freeBoard.getBoPass());
            ps.setString(index++, freeBoard.getBoContent());

            int row = ps.executeUpdate();
            return row;

        } catch (SQLException e) {
            throw new DaoException("free insert 도중 에러", e);
        } finally {
            if (conn != null) {try {conn.close();} catch (SQLException e) {}}
            if (ps != null) {try {ps.close();} catch (SQLException e) {}}
        }
    }
}
