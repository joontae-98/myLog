package com.mylog.mylog.model;

import java.sql.*;

public class JDBConnect {

    protected Connection conn;
    protected PreparedStatement pstm;
    protected Statement stmt;
    protected ResultSet rs;


    public JDBConnect() {
        this("jdbc:mysql://localhost:3306/mylog?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC", "full505", "full505", "com.mysql.cj.jdbc.Driver");
    }

    public JDBConnect(String url, String id, String pw, String driver) {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);
            System.out.println("************************* DB is open *************************");
        } catch (Exception e) {
            System.out.println("데이터 베이스 connect 에러");
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (pstm != null) pstm.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();

            System.out.println("************************* DB is close *************************");
        } catch (Exception e) {
            System.out.println("데이터 베이스 close 에러");
            e.printStackTrace();
        }
    }
}
