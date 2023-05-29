<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style/css.css">
    <script>
        $(document).ready(() => {
            $("#btn-list").on("click", () => {
                history.back();
            });
        });

    </script>
</head>
<body>

<c:import url="/layout/modal.jsp"></c:import>
<c:import url="/layout/header.jsp"></c:import>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-10 mx-auto">
            <h1>
                <c:if test="${post.postOpen != 1}">
                    <i class="bi bi-lock"></i>
                </c:if>
                ${post.postTitle}</h1>
            <div class="d-flex justify-content-between">
                <div>
                    <a href="/myLog/Blog.do?userId=${post.userId}">${post.userName}</a>
                    <span>${post.postDate}</span>
                </div>
                <span class="text-secondary">${post.postVisits}</span>
            </div>
            <hr class="mt-2">
            <div>
                <h5>${post.postContent}</h5>
            </div>
            <c:if test="${not empty post.postOfile}">
                <div>
                    <span class="fw-bold">첨부파일 : </span>
                    <a href="">${post.postOfile}</a>
                </div>
            </c:if>
            <hr>
            <div class="my-3 row">
                <div class="col-sm">
                    <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
                </div>
                <div class="col-sm d-flex justify-content-end">
                    <c:if test="${post.userId == sessionScope.user.userId}">
                        <button type="button" class="btn btn-success fw-bold me-2 btn-modal" data-id="edit"
                                data-idx="${post.idx}"
                                data-bs-toggle="modal"
                                data-bs-target="#modal-pass">수정
                        </button>
                        <button type="button" class="btn btn-danger fw-bold btn-modal" data-id="delete"
                                data-idx="${post.idx}"
                                data-bs-toggle="modal"
                                data-bs-target="#modal-pass">삭제
                        </button>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
