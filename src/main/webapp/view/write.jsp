<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오전 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style/css.css">
    <script>
        $(document).ready(() => {
            $("#btn-list").on("click", () => {
                location.href = "/myLog/Main.do";
            });
        });
    </script>
</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<main class="container my-5">
    <form action="/myLog/Write.as" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-sm">
                <div class="form-floating">
                    <input type="text" class="form-control" name="postTitle" id="post-title" placeholder="제목을 입력하세요."
                           required value="${post.postTitle}">
                    <label for="post-title">제목</label>
                </div>
            </div>
            <div class="col-sm d-flex justify-content-end">
                <div class="form-check form-switch">
                    <c:choose>
                        <c:when test="${post.postOpen == 0}">
                            <input class="form-check-input" type="checkbox" role="switch" id="post-open"
                                   name="postOpen">
                        </c:when>
                        <c:otherwise>
                            <input class="form-check-input" type="checkbox" role="switch" id="post-open" name="postOpen"
                                   checked>
                        </c:otherwise>
                    </c:choose>
                    <label class="form-check-label" for="post-open">공개설정</label>
                </div>
            </div>
        </div>

        <hr>
        <div>
            <textarea class="form-control" name="postContent" id="post-content" rows="15"
                      placeholder="내용을 입력하세요." required>${post.postContent}</textarea>
        </div>
        <div class="my-3">
            <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">
        </div>

        <hr>

        <div class="row">
            <div class="col">
                <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
            </div>
            <div class="col-6"></div>
            <div class="col-4">
                <input type="password" class="form-control" name="postPass" id="post-pass" placeholder="비밀번호를 입력하세요."
                       value="${post.postPass}"
                       required>
            </div>
            <div class="col">
                <button type="submit" class="btn btn-primary w-100">완료</button>
            </div>

        </div>
    </form>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
