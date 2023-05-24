<%--
  Created by IntelliJ IDEA.
  User: joontae98
  Date: 2023/05/22
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int totalBoard = (int) request.getAttribute("totalBoard");

    int pageSize = (int) request.getAttribute("pageSize");
    int blockPage = (int) request.getAttribute("blockPage");
    int totalPage = (int) Math.ceil((double) totalBoard / pageSize);
    int pageNum = (int) request.getAttribute("pageNum");
%>
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
<main class="container my-4" style="padding-top: 80px">
    <div class="row">
        <div class="col-sm-10 mx-auto">
            <table class="table table-hover text-center ">
                <colgroup>
                    <col style="width: 60%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 7%;">
                    <col style="width: 8%;">

                </colgroup>
                <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>공개여부</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty totalBoard}">
                        <tr>
                            <td colspan="6">등록된 게시물이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${boardList}" var="item" varStatus="loop">
                            <tr>
                                <td>${item.postTitle}</td>
                                <td>${item.userName}</td>
                                <td>${item.postDate}</td>
                                <td>${item.postVisits}</td>
                                <td>${item.postOpen}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>


                </tbody>
            </table>
            <div class="d-flex justify-content-center">
                <%
                    int pagePrev = (((pageNum - 1) / blockPage) * blockPage) + 1;
                    if (pagePrev != 1) {

                %>
                <a href="/myLog/List.do?pageNum=1">[첫 페이지]</a>
                &nbsp;
                <a href="/myLog/List.do?pageNum=<%=(pagePrev - 1)%>">
                    [이전 블록]
                </a>
                <%
                    }

                    int blockCount = 1;
                    while (blockCount <= blockPage && pagePrev <= totalPage) {
                        if (pagePrev == pageNum) {
                %>
                &nbsp;<%=pagePrev%>&nbsp;
                <%
                } else {
                %>
                &nbsp;<a href="/myLog/List.do?pageNum=<%=pagePrev%>"><%=pagePrev%>
            </a>&nbsp;
                <%
                        }
                        pagePrev++;
                        blockCount++;
                    }
                    if (pagePrev <= totalPage) {
                %>
                <a href="/myLog/List.do?pageNum=<%=pagePrev%>">[다음 블록]</a>
                &nbsp;
                <a href="/myLog/List.do?pageNum=<%=totalPage%>">[마지막 페이지]</a>

                <%
                    }
                %>
            </div>
        </div>
    </div>
</main>

<%@ include file="/layout/footer.jsp" %>
</body>
</html>
