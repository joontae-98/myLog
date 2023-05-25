<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오전 11:06
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
</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <h1 class="text-center my-4">로그인</h1>
            <form action="" class="border rounded px-4 py-3" method="post">
                <div class="my-3 form-floating">
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디"
                           required>
                    <label for="user-id">아이디</label>
                </div>
                <div class="my-3 form-floating">
                    <input type="password" class="form-control" id="user-pass" name="userPass"
                           placeholder="비밀번호"
                           required>
                    <label for="user-pass">비밀번호</label>
                </div>
                <div class="my-3 d-grid">
                    <button type="submit" class="btn btn-primary mb-2">로그인</button>
                    <button type="button" class="btn btn-secondary">회원가입</button>
                </div>

            </form>

        </div>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
