
<%--
  Created by IntelliJ IDEA.
  User: rrune
  Date: 2023-01-15
  Time: 오후 7:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!--<title>Elen - Free Bootstrap 4 Template by Colorlib</title>-->
    <title>Gyeom</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
    <div id="colorlib-page">
        <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
        <aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
            <h1 id="colorlib-logo"><a href="index">Gyeom<span>.</span></a></h1>
            <nav id="colorlib-main-menu" role="navigation">
                <ul>
                    <c:set var="locaPath" value="${pageContext.request.requestURI}"/>
                    <c:choose>
                        <c:when test="${locaPath eq '/dblog/WEB-INF/views/../views/index.jsp'}">
                        <li class="colorlib-active"><a href="index">Home</a></li>
                        <li><a href="diary">Diary</a></li>
                        <li><a href="travel">Travel</a></li>
                        <li><a href="study">Study</a></li>
                        </c:when>
                        <c:when test="${locaPath eq '/dblog/WEB-INF/views/category/diary.jsp'}">
                            <li><a href="index">Home</a></li>
                            <li class="colorlib-active"><a href="diary">Diary</a></li>
                            <li><a href="travel">Travel</a></li>
                            <li><a href="study">Study</a></li>
                        </c:when>
                        <c:when test="${locaPath eq '/dblog/WEB-INF/views/category/travel.jsp'}">
                            <li><a href="index">Home</a></li>
                            <li><a href="diary">Diary</a></li>
                            <li class="colorlib-active"><a href="travel">Travel</a></li>
                            <li><a href="study">Study</a></li>
                        </c:when>
                        <c:when test="${locaPath eq '/dblog/WEB-INF/views/category/study.jsp'}">
                            <li><a href="index">Home</a></li>
                            <li><a href="diary">Diary</a></li>
                            <li><a href="travel">Travel</a></li>
                            <li class="colorlib-active"><a href="study">Study</a></li>
                        </c:when>
                        <c:when test="${locaPath eq '/dblog/WEB-INF/views/category/content.jsp'}">
                            <li><a href="index">Home</a></li>
                            <li><a href="diary">Diary</a></li>
                            <li><a href="travel">Travel</a></li>
                            <li><a href="study">Study</a></li>
                        </c:when>
                        <c:otherwise>
                                <li class="colorlib-active"><a href="index">Home</a></li>
                                <li><a href="diary">Diary</a></li>
                                <li><a href="travel">Travel</a></li>
                                <li><a href="study">Study</a></li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </nav>
        <div class="colorlib-footer">
            <c:choose>
                <c:when test="${sessionScope.user_id eq null}">
                    <li><a href="login">Login</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="write">Write</a></li>
                    <li><a href="logout">Logout</a></li>
                </c:otherwise>
            </c:choose>            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write("2023-01-13");</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
        </div>
        </aside> <!-- END COLORLIB-ASIDE -->