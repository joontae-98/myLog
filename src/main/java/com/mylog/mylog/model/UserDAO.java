package com.mylog.mylog.model;

public class UserDAO extends JDBConnect {

    public int searchId(String id) {
        int result = 0;
        String sql = "SELECT COUNT(*) AS cnt FROM user ";
        sql += "WHERE user_id = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            while (rs.next()) {
                result = rs.getInt("cnt");
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 searchId 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public int insertUser(UserDTO user) {
        int result = 0;
        String sql = "INSERT INTO user(user_id, user_pass, user_name, user_date) ";
        sql += "VALUES(?, ?, ?, NOW()); ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, user.getUserId());
            pstm.setString(2, user.getUserPass());
            pstm.setString(3, user.getUserName());
            result = pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("데이터 베이스 insertUser 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public boolean equalsPassword(String id, String pass) {
        boolean result = false;
        String sql = "SELECT COUNT(*) AS cnt ";
        sql += "FROM user ";
        sql += "WHERE user_id = ? ";
        sql += "AND user_pass = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
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

    public UserDTO selectUser(String id, String pass) {
        UserDTO user = new UserDTO();
        String sql = "SELECT * FROM user ";
        sql += "WHERE user_id = ? ";
        sql += "AND user_pass = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, pass);
            rs = pstm.executeQuery();
            while (rs.next()) {
                user.setUserId(rs.getString("user_id"));
                user.setUserPass(rs.getString("user_pass"));
                user.setUserDate(rs.getString("user_date"));
                user.setUserName(rs.getString("user_name"));
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 selectUser 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }

    public String getUserName(String userId) {
        String userName = "";
        String sql = "SELECT user_name FROM user WHERE user_id = ?; ";

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, userId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                userName = rs.getString("user_name");
            }
        } catch (Exception e) {
            System.out.println("데이터 베이스 getUserName 에러 발생");
            System.out.println("Error : " + e.getMessage());
            e.printStackTrace();
        }
        return userName;
    }
}
