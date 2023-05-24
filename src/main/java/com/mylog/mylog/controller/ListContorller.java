package com.mylog.mylog.controller;

import com.mylog.mylog.model.BoardDAO;
import com.mylog.mylog.model.BoardDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/myLog/List.do")
public class ListContorller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int totalBoard;
        List<BoardDTO> boardList;

        int pageSize = 10;
        int blockPage = 5;

        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
            pageNum = Integer.parseInt(pageTemp);

        int startNum = (pageNum - 1) * pageSize;


        BoardDAO dao = new BoardDAO();
        boardList = dao.selectBoardList(startNum, pageSize);
        totalBoard = dao.countAllBoard();
        dao.close();

        req.setAttribute("pageNum", pageNum);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("blockPage", blockPage);
        req.setAttribute("boardList", boardList);
        req.setAttribute("totalBoard", totalBoard);

        req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
    }
}
