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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/style/css.css">
    <style>
        .crop-text-3 {
            -webkit-line-clamp: 3;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
        }
    </style>

    <script>
        $(document).ready(() => {
            $("#btn-comment").on("click", () => {
                location.href = "/myLog/Comment.co?userId=${userId}";
            });

            $(".a-modal").on("click", function () {
                var data = $(this).data('id');
                var idx = $(this).data('idx');
                $("#post-mode").val(data);
                $("#input-idx").val(idx);
            });
        });
    </script>
</head>
<body>
<c:import url="/layout/modal.jsp"></c:import>
<c:import url="/layout/header.jsp"></c:import>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-2">
            <div class="card shadow-sm">
                <div class="card-body pb-2">
                    <h4 class="card-title">방명록</h4>
                    <c:forEach items="${commentList}" var="item" varStatus="loop">
                        <hr class="my-1 mx-0">
                        <p class="text-truncate mb-2">${item.comment}</p>
                    </c:forEach>

                    <button type="button" class="btn btn-primary w-100" id="btn-comment">방명록보기
                    </button>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <h1>${userName}님의 블로그</h1>
            <hr>
            <c:choose>
                <c:when test="${empty postList}">
                    <h4 class=" my-4">작성된 게시글이 없습니다.</h4>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${postList}" var="item" varStatus="loop">
                        <div class="my-3">
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                    <c:when test="${item.postOpen == 1}">
                                        <h3><a href="/myLog/Post.do?postNum=${item.idx}"
                                               class="text-decoration-none text-black">${item.postTitle}</a></h3>

                                    </c:when>
                                    <c:otherwise>
                                        <h3>
                                            <a class="text-decoration-none text-black a-modal"
                                               data-id="secret"
                                               data-idx="${item.idx}"
                                               data-bs-toggle="modal"
                                               data-bs-target="#modal-pass">
                                                <i class="bi bi-lock"></i>${item.postTitle}</a>
                                        </h3>
                                    </c:otherwise>
                                </c:choose>

                                <span>${item.postVisits}</span>
                            </div>
                            <h6 class="text-body-secondary crop-text-3" style="height: 60px">
                                <c:choose>
                                    <c:when test="${item.postOpen == 1}">
                                        ${item.postContent}
                                    </c:when>
                                    <c:otherwise>
                                        비밀글 입니다.
                                    </c:otherwise>
                                </c:choose>
                            </h6>
                            <span>${item.postDate}</span>
                            <hr>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="col-sm-2"></div>

    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
