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
        sql += "ORDER BY p.post_date DESC; ";
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

    public List<PostDTO> selectPostList(String userId, int startNum, int pageSize) {
        List<PostDTO> postList = new ArrayList<>();

        String sql = "SELECT p.idx, p.post_title, p.post_pass, p.post_content, ";
        sql += "p.post_ofile, p.post_sfile, p.post_date, p.post_open, p.post_visits, p.user_id, u.user_name ";
        sql += "FROM post p ";
        sql += "LEFT JOIN user u on p.user_id = u.user_id ";
        sql += "WHERE p.user_id = ? ";
        sql += "ORDER BY p.post_date DESC ";
        sql += "LIMIT ?, ?; ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, userId);
            pstm.setInt(2, startNum);
            pstm.setInt(3, pageSize);
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

    public List<PostDTO> selectPostList(String userId) {
        List<PostDTO> postList = new ArrayList<>();

        String sql = "SELECT p.idx, p.post_title, p.post_pass, p.post_content, ";
        sql += "p.post_ofile, p.post_sfile, p.post_date, p.post_open, p.post_visits, p.user_id, u.user_name ";
        sql += "FROM post p ";
        sql += "LEFT JOIN user u on p.user_id = u.user_id ";
        sql += "WHERE p.user_id = ? ";
        sql += "ORDER BY p.post_date DESC; ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, userId);
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
            System.out.println("데이터 베이스 countAllPost 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public PostDTO selectPost(int postNum) {
        PostDTO post = new PostDTO();
        String sql = "SELECT p.idx, p.post_title, p.post_pass, p.post_content, ";
        sql += "p.post_ofile, p.post_sfile, p.post_date, p.post_open, p.post_visits, p.user_id, u.user_name ";
        sql += "FROM post p ";
        sql += "LEFT JOIN user u on p.user_id = u.user_id ";
        sql += "WHERE p.idx = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, postNum);
            rs = pstm.executeQuery();

            while (rs.next()) {
                post.setIdx(rs.getInt("idx"));
                post.setPostTitle(rs.getString("post_title"));
                post.setPostContent(rs.getString("post_content"));
                post.setPostPass(rs.getString("post_pass"));
                post.setPostOfile(rs.getString("post_ofile"));
                post.setPostSfile(rs.getString("post_sfile"));
                post.setPostDate(rs.getString("post_date"));
                post.setPostOpen(rs.getInt("post_open"));
                post.setUserId(rs.getString("user_id"));
                post.setUserName(rs.getString("user_name"));
                post.setPostVisits(rs.getInt("post_visits"));
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectPost 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return post;
    }

    public int insertPost(PostDTO post) {
        int result = 0;
        String sql = "INSERT INTO post(user_id, post_title, post_pass, post_content, post_date, post_open, post_ofile, post_sfile ) ";
        sql += "VALUES(?, ?, ?, ?, NOW(), ?, ?, ?); ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, post.getUserId());
            pstm.setString(2, post.getPostTitle());
            pstm.setString(3, post.getPostPass());
            pstm.setString(4, post.getPostContent());
            pstm.setInt(5, post.getPostOpen());
            pstm.setString(6, post.getPostOfile());
            pstm.setString(7, post.getPostSfile());

            result = pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 insertPost 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public boolean equalsPassword(int idx, String pass) {
        boolean result = false;
        String sql = "SELECT COUNT(*) AS cnt ";
        sql += "FROM post ";
        sql += "WHERE idx = ? ";
        sql += "AND post_pass = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idx);
            pstm.setString(2, pass);
            rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getInt("cnt") == 1) {
                    result = true;
                }
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 equalsPassword 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public int deletePost(int postIdx) {
        int result = 0;
        String sql = "DELETE FROM post WHERE idx = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, postIdx);
            result = pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 deletePost 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public int updatePost(PostDTO post) {
        int result = 0;
        String sql = "UPDATE post SET post_title = ?, post_pass = ?, ";
        sql += "post_content = ?, post_date = NOW(), post_open = ? , post_ofile = ?, post_sfile = ? ";
        sql += "WHERE idx = ?; ";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, post.getPostTitle());
            pstm.setString(2, post.getPostPass());
            pstm.setString(3, post.getPostContent());
            pstm.setInt(4, post.getPostOpen());
            pstm.setString(5, post.getPostOfile());
            pstm.setString(6, post.getPostSfile());
            pstm.setInt(7, post.getIdx());


            result = pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 updatePost 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public void updatePostVisits(int postNum) {

        String sql = "UPDATE post SET post_visits = post_visits + 1 WHERE idx = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, postNum);
            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 updatePostVisits 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
    }
}
