package com.mylog.mylog.controller;

import com.mylog.mylog.model.PostDAO;
import com.mylog.mylog.model.PostDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/myLog/Post.do")
public class PostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PostDTO post;
        int postNum = Integer.parseInt(req.getParameter("postNum"));
        PostDAO dao = new PostDAO();
        post = dao.selectPost(postNum);
        dao.close();

        req.setAttribute("post", post);

        req.getRequestDispatcher("/view/post.jsp").forward(req, resp);

    }
}
