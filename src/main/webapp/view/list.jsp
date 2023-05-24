<%--
  Created by IntelliJ IDEA.
  User: joontae98
  Date: 2023/05/22
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>


<%
    Map<String, Object> param = new HashMap<>();
    int totalCount = 23;

    int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    int pageNum = 1;
    String pageTemp = request.getParameter("pageNum");
    if (pageTemp != null && !pageTemp.equals(""))
        pageNum = Integer.parseInt(pageTemp);

    int start = (pageNum - 1) * pageSize + 1;
    int end = pageNum * pageSize;
    param.put("start", start);
    param.put("end", end);
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
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>

                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 10</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>

                <tr>
                    <td>테스트 제목 20</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>
                <tr>
                    <td>테스트 제목 1</td>
                    <td>testuser1</td>
                    <td>2023-05-24</td>
                    <td>4</td>
                    <td>비공개</td>
                </tr>

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
