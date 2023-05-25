package com.mylog.mylog.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PostDTO {
    private int idx;
    private String userId;
    private String userName;
    private String postTitle;
    private String postPass;
    private String postContent;
    private String postOfile;
    private String postSfile;
    private String postDate;
    private int postOpen; //1 = open, 0 = private
    private int postVisits;

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String  getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostPass() {
        return postPass;
    }

    public void setPostPass(String postPass) {
        this.postPass = postPass;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostOfile() {
        return postOfile;
    }

    public void setPostOfile(String postOfile) {
        this.postOfile = postOfile;
    }

    public String getPostSfile() {
        return postSfile;
    }

    public void setPostSfile(String postSfile) {
        this.postSfile = postSfile;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = format.parse(postDate);
        format = new SimpleDateFormat("yyyy-MM-dd");
        this.postDate = format.format(date);
    }

    public int getPostOpen() {
        return postOpen;
    }

    public void setPostOpen(int postOpen) {
        this.postOpen = postOpen;
    }

    public int getPostVisits() {
        return postVisits;
    }

    public void setPostVisits(int postVisits) {
        this.postVisits = postVisits;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
