package com.mylog.mylog.controller;

import com.mylog.mylog.model.PostDAO;
import com.mylog.mylog.model.PostDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/myLog/Main.do")
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<PostDTO> postList;
        PostDAO dao = new PostDAO();
        postList = dao.selectPostList();
        dao.close();

        req.setAttribute("postList", postList);

        req.getRequestDispatcher("/view/main.jsp").forward(req, resp);
    }
}
