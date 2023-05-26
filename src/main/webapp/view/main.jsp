<%--
  Created by IntelliJ IDEA.
  User: joontae
  Date: 2023-05-24
  Time: 오후 11:59
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

    <link rel="stylesheet" href="/style/css.css">

</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<main class="container my-5">
    <div class="row">
        <div class="col-sm-10 mx-auto">
            <h1>최신글</h1>
            <hr class="mb-0">
            <div class="row row-cols-3">
                <c:choose>
                    <c:when test="${empty postList}">
                        <h4 class=" my-4">작성된 게시글이 없습니다.</h4>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${postList}" var="item" varStatus="loop">
                            <div class="col my-3">
                                <div class="card shadow">
                                    <div class="card-body pb-2 px-0">
                                        <div class="px-3">
                                            <h3 class="card-title">
                                                <a href="/myLog/Post.do?postNum=${item.idx}"
                                                   class="text-decoration-none text-black">${item.postTitle}</a>
                                            </h3>
                                            <h6 class="card-subtitle mb-2 text-body-secondary text-truncate"
                                                style="height: 60px">
                                                    ${item.postContent}</h6>
                                            <p class="m-0 text-secondary">${item.postDate}</p>
                                        </div>

                                        <hr class="my-1 mx-0">
                                        <div class="d-flex justify-content-between px-3">
                                            <p class="m-0">${item.userName}</p>
                                            <p class="m-0">${item.postVisits}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>


            </div>
        </div>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
