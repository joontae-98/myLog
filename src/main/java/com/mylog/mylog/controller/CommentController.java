package com.mylog.mylog.controller;

import com.mylog.mylog.model.CommentDAO;
import com.mylog.mylog.model.CommentDTO;
import com.mylog.mylog.model.UserDTO;
import com.mylog.mylog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("*.co")
public class CommentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);
        switch (commandStr) {
            case "/Comment.co":
                commentFunc(req, resp);
                break;
            case "/Delete.co":
                deleteFunc(req, resp);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        CommentDTO commentDTO = new CommentDTO();
        String comment = req.getParameter("comment");
        String userId = req.getParameter("userId");
        HttpSession session = req.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        commentDTO.setCommentId(userId);
        commentDTO.setUserId(user.getUserId());
        commentDTO.setComment(comment);

        CommentDAO dao = new CommentDAO();
        int result = dao.insertComment(commentDTO);
        dao.close();

        if (result == 1) {
            resp.sendRedirect("/myLog/Comment.co?userId=" + userId);
        } else {
            JSFunc.alertBack("코멘트 작성 중 오류가 발생하였습니다.", resp);
        }
    }

    private void deleteFunc(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void commentFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CommentDTO> commentList = new ArrayList<>();
        String userId = req.getParameter("userId");

        CommentDAO dao = new CommentDAO();
        commentList = dao.selectCommentList(userId);
        dao.close();

        req.setAttribute("userId", userId);
        req.setAttribute("commentList", commentList);

        req.getRequestDispatcher("/view/comment.jsp").forward(req, resp);
    }
}
