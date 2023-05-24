package com.mylog.mylog.model;

public class BoardDTO {
    private int idx;
    private int userIdx;
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

    public int getUserIdx() {
        return userIdx;
    }

    public void setUserIdx(int userIdx) {
        this.userIdx = userIdx;
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

    public void setPostDate(String postDate) {
        this.postDate = postDate;
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
}
