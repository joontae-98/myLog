<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-05-24
  Time: 오전 9:12
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
    <link rel="stylesheet" href="/style/css.css">
    <script>
        $(document).ready(() => {
            $("#btn-blog").on("click", () => {
                location.href = "/myLog/Blog.do?userId=${userId}";
            });
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
            <form action="/myLog/Comment.co" method="post">
                <div class="row my-3 ">
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="comment" name="comment" placeholder="방명록을 작성해 주세요.">
                    </div>
                    <div class="col-sm d-grid">
                        <c:choose>
                            <c:when test="${empty sessionScope.user.userId}">
                                <button type="submit" class="btn btn-primary" disabled>작성하기</button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit" class="btn btn-primary">작성하기</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <input type="hidden" value="${userId}" name="userId">
                    </div>
                </div>
            </form>

            <div class="my-2">
                <c:choose>
                    <c:when test="${empty commentList}">

                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${commentList}" var="item" varStatus="loop">
                            <div class="row">
                                <div class="col-sm-11">
                                    <p class="mb-2">${item.comment}</p>
                                </div>
                                    <%--                                코멘트 수정 코드 --%>
                                    <%--                                <div class="col-sm">--%>
                                    <%--                                    <c:if test="${sessionScope.user.userId == item.userId}">--%>
                                    <%--                                        <button type="button" class="btn btn-secondary btn-edit">수정</button>--%>
                                    <%--                                    </c:if>--%>
                                    <%--                                </div>--%>
                                <div class="col-sm ">
                                    <c:if test="${sessionScope.user.userId == item.userId || sessionScope.user.userId == item.commentId}">
                                        <a href="/myLog/Delete.co?idx=${item.idx}&userId=${userId}"
                                           class="btn btn-danger p-1 w-100"
                                           id="btn-delete">삭제</a>
                                    </c:if>
                                </div>
                                <hr class="my-1 mx-0">
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </div>
            <div>
                <button type="button" class="btn btn-secondary" id="btn-blog">목록</button>
            </div>
        </div>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
