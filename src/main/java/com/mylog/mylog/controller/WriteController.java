package com.mylog.mylog.controller;

import com.mylog.mylog.model.PostDAO;
import com.mylog.mylog.model.PostDTO;
import com.mylog.mylog.model.UserDTO;
import com.mylog.mylog.util.FileUtils;
import com.mylog.mylog.util.JSFunc;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("*.as")
public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);
        switch (commandStr) {
            case "/Write.as":
                writeFunc(req, resp);
                break;
            case "/Edit.as":
                editFunc(req, resp);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String saveDir = "C:\\upload";
        int maxSize = 10 * 1024 * 1024;

        MultipartRequest mr = FileUtils.uploadFile(req, saveDir, maxSize);

        HttpSession session = req.getSession();
        String mode = (String) session.getAttribute("mode");
        int result;

        PostDTO post = new PostDTO();
        UserDTO user = (UserDTO) session.getAttribute("user");
        post.setUserId(user.getUserId());
        post.setPostTitle(mr.getParameter("postTitle"));
        post.setPostContent(mr.getParameter("postContent"));
        post.setPostPass(mr.getParameter("postPass"));
        String open = mr.getParameter("postOpen");

        if (open != null) {
            post.setPostOpen(1);
        } else {
            post.setPostOpen(0);
        }


        if (mr == null) {
            if (mode != null) {
                JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "/myLog/Edit.as?postIdx=" + (Integer) session.getAttribute("idx"));
                return;
            } else {
                JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "/myLog/Write.as");
                return;
            }

        }

        String fileName = mr.getFilesystemName("file");

        if (fileName != null) {
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String ext = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = now + ext;

            File oldFile = new File(saveDir + File.separator + fileName);
            File newFile = new File(saveDir + File.separator + newFileName);
            oldFile.renameTo(newFile);

            post.setPostOfile(fileName);
            post.setPostSfile(newFileName);
        }


        PostDAO dao = new PostDAO();
        if (mode != null) {
            post.setIdx((Integer) session.getAttribute("idx"));
            result = dao.updatePost(post);
            session.removeAttribute("idx");
            session.removeAttribute("mode");
        } else {
            result = dao.insertPost(post);
        }

        dao.close();

        if (result == 1) {
            resp.sendRedirect("/myLog/Main.do");
        } else {
            JSFunc.alertBack("글 작성 중 오류가 발생하였습니다.", resp);
        }

    }

    private void editFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDTO post;
        int postIdx = Integer.parseInt(req.getParameter("postIdx"));
        PostDAO dao = new PostDAO();
        post = dao.selectPost(postIdx);
        dao.close();

        req.setAttribute("post", post);
        req.getRequestDispatcher("/view/write.jsp").forward(req, resp);
    }

    private void writeFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/view/write.jsp").forward(req, resp);

    }


}
