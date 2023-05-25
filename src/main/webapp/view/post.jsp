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
</head>
<body>
<c:import url="/layout/header.jsp"></c:import>
<main class="container my-5">

    <div class="row">
        <div class="col-sm-10 mx-auto">
            <h1>post title</h1>
            <div class="d-flex justify-content-between">
                <div>
                    <span>postName</span>
                    <span>postDate</span>
                </div>
                <span class="text-secondary">postVisits</span>
            </div>
            <hr class="mt-2">
            <div>
                <h5>군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한
                    소비자보호운동을 법률이 정하는 바에 의하여 보장한다.

                    헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 모든 국민은 근로의 의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다.

                    신체장애자 및 질병·노령 기타의 사유로 생활능력이 없는 국민은 법률이 정하는 바에 의하여 국가의 보호를 받는다. 대통령은 국무회의의 의장이 되고, 국무총리는 부의장이 된다.

                    국회의원은 법률이 정하는 직을 겸할 수 없다. 농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여
                    인정된다.

                    대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이
                    출석요구를 받은 때에는 국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다.</h5>
            </div>
            <div>
                <span class="fw-bold">첨부파일 : </span>
                <a href="">1.jpg</a>
            </div>
            <hr>
            <div class="my-3 row">
                <div class="col-sm">
                    <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
                </div>
                <div class="col-sm d-flex justify-content-end">
                    <a href="" class="text-decoration-none text-secondary fw-bold px-2">수정</a>
                    <a href="" class="text-decoration-none text-danger fw-bold px-2">삭제</a>
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="/layout/footer.jsp" %>
</body>
</html>
