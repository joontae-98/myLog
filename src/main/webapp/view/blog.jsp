<%--
  Created by IntelliJ IDEA.
  User: joontae
  Date: 2023-05-24
  Time: 오전 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <style>
        .crop-text-3 {
            -webkit-line-clamp: 3;
            overflow : hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
        }
    </style>

</head>
<body>
<c:import url="/layout/header.jsp"></c:import>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-2">
            <div class="card shadow-sm">
                <div class="card-body pb-2">
                    <h4 class="card-title">방명록</h4>
                    <hr class="my-1 mx-0">
                    <p class="text-truncate mb-2">첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록</p>
                    <button type="button" class="btn btn-primary w-100">방명록보기</button>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <h1>User님의 블로그</h1>
            <hr>
            <div class="my-3">
                <div class="d-flex justify-content-between">
                    <h3>post title</h3>
                    <span>postVisits</span>
                </div>
                <h6 class="text-body-secondary crop-text-3" style="height: 60px">
                    post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content
                </h6>
                <span>postVisits</span>
                <hr>
            </div>
            <div class="my-3">
                <div class="d-flex justify-content-between">
                    <h3>post title</h3>
                    <span>postVisits</span>
                </div>
                <h6 class="text-body-secondary crop-text-3" style="height: 60px">
                    post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content
                </h6>
                <span>postVisits</span>
                <hr>
            </div>
            <div class="my-3">
                <div class="d-flex justify-content-between">
                    <h3>post title</h3>
                    <span>postVisits</span>
                </div>
                <h6 class="text-body-secondary crop-text-3" style="height: 60px">
                    post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content
                </h6>
                <span>postVisits</span>
                <hr>
            </div>
            <div class="my-3">
                <div class="d-flex justify-content-between">
                    <h3>post title</h3>
                    <span>postVisits</span>
                </div>
                <h6 class="text-body-secondary crop-text-3" style="height: 60px">
                    post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content post content post content post content post content post content post content post content post
                    content post content post content post content post content post content post content post content
                    post content
                </h6>
                <span>postVisits</span>
                <hr>
            </div>
        </div>
        <div class="col-sm-2"></div>

    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
