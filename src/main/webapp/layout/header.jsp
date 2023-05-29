<%--
  Created by IntelliJ IDEA.
  User: joontae98
  Date: 2023/05/22
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="sticky-top">
    <nav class="navbar navbar-expand-sm navbar-light bg-main">
        <div class="container-fluid">
            <a href="/myLog/Main.do" class="navbar-brand ">myLog</a>
            <div class="justify-content-end">

                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a href="/myLog/Write.as" class="btn btn-primary">글 작성
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/myLog/Logout.do" class="nav-link text-danger">로그아웃</a>
                            </li>
                            <li class="nav-item">
                                <a href="/myLog/Blog.do?userId=${sessionScope.user.userId}"
                                   class="nav-link">${sessionScope.user.userName}</a>
                            </li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="/myLog/Signup.do"> <span class="fw-bold">회원가입</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/myLog/Login.do">로그인</a>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </nav>
    <hr class="m-0">
</header>
