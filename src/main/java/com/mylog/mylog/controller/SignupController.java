package com.mylog.mylog.controller;

import com.mylog.mylog.model.UserDAO;
import com.mylog.mylog.model.UserDTO;
import com.mylog.mylog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/myLog/Signup.do")
public class SignupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        UserDTO user = new UserDTO();
        String id = req.getParameter("userId");
        String pass = req.getParameter("userPass");
        String pwCheck = req.getParameter("userPwCh");
        String name = req.getParameter("userName");


        UserDAO dao = new UserDAO();
        int exist = dao.searchId(id);

        if (exist != 0) {
            JSFunc.alertBack("존재하는 id입니다.", resp);
            dao.close();
            return;
        }

        if (!pass.equals(pwCheck)) {
            JSFunc.alertBack("비밀번호가 일치하지 않습니다.", resp);
            dao.close();
            return;
        }
        user.setUserId(id);
        user.setUserPass(pass);
        user.setUserName(name);

        int result = dao.insertUser(user);
        dao.close();

        if (result == 1) {
            JSFunc.alertLocation(resp, "회원가입되었습니다.", "/myLog/Main.do");
        } else {
            JSFunc.alertBack("회원가입 중 오류가 발생하였습니다.", resp);
        }


    }
}
