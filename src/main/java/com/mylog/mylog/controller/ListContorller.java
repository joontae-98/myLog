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

@WebServlet("/myLog/List.do")
public class ListContorller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int totalPost;
        List<PostDTO> postList;

        int pageSize = 10;
        int blockPage = 5;

        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
            pageNum = Integer.parseInt(pageTemp);

        int startNum = (pageNum - 1) * pageSize;


        PostDAO dao = new PostDAO();
        postList = dao.selectPostList(startNum, pageSize);
        totalPost = dao.countAllPost();
        dao.close();

        req.setAttribute("pageNum", pageNum);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("blockPage", blockPage);
        req.setAttribute("postList", postList);
        req.setAttribute("totalPost", totalPost);

        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }
}
