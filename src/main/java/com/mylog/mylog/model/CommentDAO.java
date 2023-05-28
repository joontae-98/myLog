package com.mylog.mylog.model;

import java.util.ArrayList;
import java.util.List;

public class CommentDAO extends JDBConnect {

    public List<CommentDTO> selectCommentList(String id) {
        List<CommentDTO> commentList = new ArrayList<>();

        String sql = "SELECT idx, comment, user_id, comment_id ";
        sql += "FROM comment ";
        sql += "WHERE comment_id = ? ";
        sql += "ORDER BY comment_date DESC; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                CommentDTO comment = new CommentDTO();
                comment.setIdx(rs.getInt("idx"));
                comment.setComment(rs.getString("comment"));
                comment.setCommentId(rs.getString("comment_id"));
                comment.setUserId(rs.getString("user_id"));

                commentList.add(comment);
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectCommentList 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return commentList;
    }


    public int insertComment(CommentDTO comment) {
        int result = 0;
        String sql = "INSERT INTO comment(comment, user_id, comment_date, comment_id) ";
        sql += "VALUES(? , ?, NOW(), ?); ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, comment.getComment());
            pstm.setString(2, comment.getUserId());
            pstm.setString(3, comment.getCommentId());
            result = pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 insertComment 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public int deleteComment(int idx) {
        int result = 0;
        String sql = "DELETE FROM comment WHERE idx = ?;";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idx);
            result = pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 deleteComment 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}
