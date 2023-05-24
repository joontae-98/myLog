package com.mylog.mylog.model;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends JDBConnect {

    public List<BoardDTO> selectBoardList() {
        List<BoardDTO> boardList = new ArrayList<>();

        String sql = "SELECT b.idx, b.post_title, b.post_pass, b.post_content, ";
        sql += "b.post_ofile, b.post_sfile, b.post_date, b.post_open, b.post_visits, b.user_id, u.user_name ";
        sql += "FROM board b ";
        sql += "LEFT JOIN user u on b.user_id = u.user_id ";
        sql += "ORDER BY b.idx DESC; ";
        try {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setIdx(rs.getInt("idx"));
                board.setUserId(rs.getString("user_id"));
                board.setUserName(rs.getString("user_name"));
                board.setPostTitle(rs.getString("post_title"));
                board.setPostPass(rs.getString("post_pass"));
                board.setPostContent(rs.getString("post_content"));
                board.setPostOfile(rs.getString("post_ofile"));
                board.setPostSfile(rs.getString("post_sfile"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostOpen(rs.getInt("post_open"));
                board.setPostVisits(rs.getInt("post_visits"));
                boardList.add(board);
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectBoardList 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return boardList;
    }

    public List<BoardDTO> selectBoardList(int startNum, int pageSize) {
        List<BoardDTO> boardList = new ArrayList<>();

        String sql = "SELECT b.idx, b.post_title, b.post_pass, b.post_content, ";
        sql += "b.post_ofile, b.post_sfile, b.post_date, b.post_open, b.post_visits, b.user_id, u.user_name ";
        sql += "FROM board b ";
        sql += "LEFT JOIN user u on b.user_id = u.user_id ";
        sql += "ORDER BY b.idx DESC ";
        sql += "LIMIT ?, ?; ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, startNum);
            pstm.setInt(2, pageSize);
            rs = pstm.executeQuery();

            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setIdx(rs.getInt("idx"));
                board.setUserId(rs.getString("user_id"));
                board.setUserName(rs.getString("user_name"));
                board.setPostTitle(rs.getString("post_title"));
                board.setPostPass(rs.getString("post_pass"));
                board.setPostContent(rs.getString("post_content"));
                board.setPostOfile(rs.getString("post_ofile"));
                board.setPostSfile(rs.getString("post_sfile"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostOpen(rs.getInt("post_open"));
                board.setPostVisits(rs.getInt("post_visits"));
                boardList.add(board);
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectBoardList 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return boardList;
    }

    public int countAllBoard() {
        int result = 0;
        String sql = "SELECT COUNT(*) AS cnt FROM board; ";

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                result = rs.getInt("cnt");
            }
        } catch (Exception e) {
        }
        return result;
    }
}
