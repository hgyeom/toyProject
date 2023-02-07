<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="head.jsp"></jsp:include>
    <div id="colorlib-main">
        <div class="hero-wrap js-fullheight" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="js-fullheight d-flex justify-content-center align-items-center">
                <div class="col-md-8 text text-center">
                    <div class="img mb-4" style="background-image: url(images/profile.jpg);"></div>
                    <div class="desc">
                        <h2 class="subheading">한겸</h2>
                        <h1 class="mb-4">Blog for Study</h1>
                        <p class="mb-4">내 블로그. 일기, 공부, 여행을 기록하기 위해 만들었습니다. </p>
                        <p><a href="#" class="btn-custom">More About Me <span class="ion-ios-arrow-forward"></span></a></p>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-2">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2 class="mb-4">POST</h2>
<%--                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country.</p>--%>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${list}" var="contentDTO">
                    <div class="col-md-4">
                        <div class="blog-entry ftco-animate">
                            <%--<a href="<c:url value='content?content_id=${contentDTO.content_id}&page=${page}&pageSize=${pageSize}'/>" class="img img-2" style="background-image: url(images/image_1.jpg);"></a>--%>
                            <div class="text text-2 pt-2 mt-3">
                                <span class="category mb-3 d-block"><a href="${contentDTO.category_name}">${contentDTO.category_name}</a></span>
                                <h3 class="mb-4"><a href="<c:url value='content?content_id=${contentDTO.content_id}&page=${page}&pageSize=${pageSize}'/>">${contentDTO.title}</a></h3>
                                <div class="author mb-4 d-flex align-items-center">
                                    <a href="#" class="img" style="background-image: url(images/profile.jpg);"></a>
                                    <div>
                                        <span>Written by</span>
                                        <h3>${contentDTO.user_name}, <span>${contentDTO.cre_date}</span></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <p> 아직 글이 없습니다.</p>
                    </c:if>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
