package com.mylog.mylog.model;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends JDBConnect {

    public List<BoardDTO> selectBoardList() {
        List<BoardDTO> boardList = new ArrayList<>();

        String sql = "SELECT * FROM board ORDER BY idx DESC; ";
        try {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setIdx(rs.getInt("idx"));
                board.setUserId(rs.getString("user_id"));
                board.setPostTitle(rs.getString("post_title"));
                board.setPostPass(rs.getString("post_pass"));
                board.setPostContent(rs.getString("post_content"));
                board.setPostOfile(rs.getString("post_ofile"));
                board.setPostSfile(rs.getString("post_sfile"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostOpen(rs.getInt("post_open"));
                board.setPostVisits(rs.getInt("post_visits"));
                // 필터링 과정 추가 ex) user_idx, post_open, post_date
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

        String sql = "SELECT * FROM board ORDER BY idx DESC ";
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
                board.setPostTitle(rs.getString("post_title"));
                board.setPostPass(rs.getString("post_pass"));
                board.setPostContent(rs.getString("post_content"));
                board.setPostOfile(rs.getString("post_ofile"));
                board.setPostSfile(rs.getString("post_sfile"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostOpen(rs.getInt("post_open"));
                board.setPostVisits(rs.getInt("post_visits"));
                // 필터링 과정 추가 ex) user_idx
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
