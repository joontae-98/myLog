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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <script>
        $(document).ready(() => {
            $("#btn-list").on("click", () => {
                history.back();
            });


            $(".btn-modal").on("click", function () {
                var data = $(this).data('id');
                $("#post-mode").val(data);

            });

        });

    </script>
</head>
<body>

<div class="modal fade" id="modal-pass">
    <div class="modal-dialog modal-dialog-centered">
        <form class="modal-content" action="/myLog/Pass.do" method="post">
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 입력</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <label for="post-pass" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="post-pass" name="postPass"
                       placeholder="비밀번호를 입력하세요"
                       required>
            </div>
            <div>
                <input type="hidden" name="postIdx" value="${post.idx}">
                <input type="hidden" name="postMode" id="post-mode">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary">확인</button>
            </div>
        </form>
    </div>
</div>
</div>

<c:import url="/layout/header.jsp"></c:import>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-10 mx-auto">
            <h1>${post.postTitle}</h1>
            <div class="d-flex justify-content-between">
                <div>
                    <span>${post.userName}</span>
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
                                data-bs-toggle="modal"
                                data-bs-target="#modal-pass">수정
                        </button>
                        <button type="button" class="btn btn-danger fw-bold btn-modal" data-id="delete"
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
