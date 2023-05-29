package com.mylog.mylog.controller;

import com.mylog.mylog.model.PostDAO;
import com.mylog.mylog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/myLog/Pass.do")
public class PassController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int postIdx = Integer.parseInt(req.getParameter("postIdx"));
        String postMode = req.getParameter("postMode");
        String postPass = req.getParameter("postPass");

        PostDAO dao = new PostDAO();
        boolean result = dao.equalsPassword(postIdx, postPass);
        dao.close();
        if (result) {
            switch (postMode) {
                case "edit":
                    HttpSession session = req.getSession();
                    session.setAttribute("mode", postMode);
                    session.setAttribute("idx", postIdx);
                    resp.sendRedirect("/myLog/Edit.as?postIdx=" + postIdx);
                    break;
                case "delete":
                    dao = new PostDAO();
                    int deleted = dao.deletePost(postIdx);
                    dao.close();

                    if (deleted == 1) {
                        resp.sendRedirect("/myLog/Main.do");
                    } else {
                        resp.sendRedirect("/myLog/Post.do?postNum=" + postIdx);
                    }
                    break;
                case "secret":
                    resp.sendRedirect("/myLog/Post.do?postNum=" + postIdx);
            }
        } else {
            JSFunc.alertBack("비밀번호가 틀렸습니다.", resp);
        }
    }
}
