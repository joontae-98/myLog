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
}
