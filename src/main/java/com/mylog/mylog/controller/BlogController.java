package com.mylog.mylog.controller;

import com.mylog.mylog.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/myLog/Blog.do")
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<PostDTO> postList = new ArrayList<>();
        List<CommentDTO> commentList = new ArrayList<>();
      String userId = req.getParameter("userId");

        PostDAO dao1 = new PostDAO();
        postList = dao1.selectPostList(userId);
        dao1.close();

        CommentDAO dao2 = new CommentDAO();
        commentList = dao2.selectCommentList(userId);
        dao2.close();
        req.setAttribute("postList", postList);
        req.setAttribute("commentList", commentList);
        req.setAttribute("userId", userId);

        req.getRequestDispatcher("/view/blog.jsp").forward(req, resp);
    }
}
