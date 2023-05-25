<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오전 9:12
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

    <script>
        $(Document).ready(() => {
           // $("#btnEdit").removeClass("d-none").show();
        });
    </script>
</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-10 mx-auto">
            <h1>방명록</h1>
            <hr>
            <form action="" method="post">
                <div class="row my-3 ">
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="comment" name="comment" placeholder="방명록을 작성해 주세요.">
                    </div>
                    <div class="col-sm d-grid">
                        <button type="submit" class="btn btn-primary">작성하기</button>
                    </div>
                </div>
            </form>

            <div class="my-2">
                <div class="row">
                    <div class="col-sm-10">
                        <p class="mb-2">첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록
                            첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째
                            방명록
                            첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째
                            방명록
                            첫번째 방명록 첫번째 방명록 첫번째 방명록 첫번째 방명록</p>
                    </div>
                    <div class="col-sm">
                        <a href="" class="btn btn-outline-secondary d-none  " id="btnEdit">수정</a>
                    </div>
                    <div class="col-sm ">
                        <a href="" class="btn btn-outline-danger d-none" id="btnDelete">삭제</a>
                    </div>
                </div>

                <hr class="my-1 mx-0">
            </div>
        </div>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
