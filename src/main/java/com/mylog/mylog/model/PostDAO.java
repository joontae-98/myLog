package com.mylog.mylog.model;

import java.util.ArrayList;
import java.util.List;

public class PostDAO extends JDBConnect {

    public List<PostDTO> selectPostList() {
        List<PostDTO> postList = new ArrayList<>();

        String sql = "SELECT p.idx, p.post_title, p.post_pass, p.post_content, ";
        sql += "p.post_ofile, p.post_sfile, p.post_date, p.post_open, p.post_visits, p.user_id, u.user_name ";
        sql += "FROM post p ";
        sql += "LEFT JOIN user u on p.user_id = u.user_id ";
        sql += "ORDER BY p.idx DESC; ";
        try {
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                PostDTO post = new PostDTO();
                post.setIdx(rs.getInt("idx"));
                post.setUserId(rs.getString("user_id"));
                post.setUserName(rs.getString("user_name"));
                post.setPostTitle(rs.getString("post_title"));
                post.setPostPass(rs.getString("post_pass"));
                post.setPostContent(rs.getString("post_content"));
                post.setPostOfile(rs.getString("post_ofile"));
                post.setPostSfile(rs.getString("post_sfile"));
                post.setPostDate(rs.getString("post_date"));
                post.setPostOpen(rs.getInt("post_open"));
                post.setPostVisits(rs.getInt("post_visits"));
                postList.add(post);
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectPostList 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return postList;
    }

    public List<PostDTO> selectPostList(int startNum, int pageSize) {
        List<PostDTO> postList = new ArrayList<>();

        String sql = "SELECT p.idx, p.post_title, p.post_pass, p.post_content, ";
        sql += "p.post_ofile, p.post_sfile, p.post_date, p.post_open, p.post_visits, p.user_id, u.user_name ";
        sql += "FROM post p ";
        sql += "LEFT JOIN user u on p.user_id = u.user_id ";
        sql += "ORDER BY p.idx DESC ";
        sql += "LIMIT ?, ?; ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, startNum);
            pstm.setInt(2, pageSize);
            rs = pstm.executeQuery();

            while (rs.next()) {
                PostDTO post = new PostDTO();
                post.setIdx(rs.getInt("idx"));
                post.setUserId(rs.getString("user_id"));
                post.setUserName(rs.getString("user_name"));
                post.setPostTitle(rs.getString("post_title"));
                post.setPostPass(rs.getString("post_pass"));
                post.setPostContent(rs.getString("post_content"));
                post.setPostOfile(rs.getString("post_ofile"));
                post.setPostSfile(rs.getString("post_sfile"));
                post.setPostDate(rs.getString("post_date"));
                post.setPostOpen(rs.getInt("post_open"));
                post.setPostVisits(rs.getInt("post_visits"));
                postList.add(post);
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectPostList 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return postList;
    }

    public int countAllPost() {
        int result = 0;
        String sql = "SELECT COUNT(*) AS cnt FROM post; ";

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
