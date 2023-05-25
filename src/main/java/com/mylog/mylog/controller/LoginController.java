package com.mylog.mylog.controller;

import com.mylog.mylog.model.UserDAO;
import com.mylog.mylog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/myLog/Login.do")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String id = req.getParameter("userId");
        String pass = req.getParameter("userPass");

        UserDAO dao = new UserDAO();
        boolean result = dao.equalsPassword(id, pass);
        dao.close();

        if (result) {
            resp.sendRedirect("/myLog/Main.do");
        } else {
            JSFunc.alertBack("비밀번호가 다릅니다.", resp);
        }
    }
}
