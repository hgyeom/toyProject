<%--
  Created by IntelliJ IDEA.
  User: rrune
  Date: 2023-01-17
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../head.jsp"></jsp:include>
    <div id="colorlib-main">
<%--        <div class="hero-wrap js-fullheight" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">--%>
<%--            <div class="overlay"></div>--%>
<%--            <div class="js-fullheight d-flex justify-content-center align-items-center">--%>
<%--                <div class="col-md-8 text text-center">--%>
<%--                    <div class="desc">--%>
<%--                        <h1 class="mb-4">Blog Details</h1>--%>
<%--                        <p><a href="index" class="btn-custom mr-2">Home <span class="ion-ios-arrow-forward"></span></a> <a href="index" class="btn-custom mr-2">Blog <span class="ion-ios-arrow-forward"></span></a> <a href="index" class="btn-custom">Single <span class="ion-ios-arrow-forward"></span></a></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <section class="ftco-section">
            <div class="container">
                <form action="" id="contentForm">
                <div class="row">
                    <div class="col-lg-8 ftco-animate">
                        <h2 class="mb-3 font-weight-bold">${contentDTO.title}</h2>
                        <input type="hidden" name="content_id" value="${contentDTO.content_id}">
                        <input type="hidden" name="category_name" value="${contentDTO.category_name.toLowerCase()}">
                        <p style="white-space: pre-wrap;">${contentDTO.content}</p>
                        <div class="tag-widget post-tag-container mb-5 mt-5">
                            <div class="tagcloud">
                                <a href="${contentDTO.category_name}" class="tag-cloud-link">${contentDTO.category_name}</a>
                            </div>
                        </div>

                        <div class="about-author d-flex p-4 bg-light">
                            <div class="bio mr-5">
                                <img src="images/profile.jpg" alt="Image placeholder" class="img-fluid mb-4">
                            </div>
                            <div class="desc" style="height: 80px;">
                                <h3>${contentDTO.user_name}</h3>
                                <p>${contentDTO.cre_date}</p>
                                <c:if test="${contentDTO.user_name eq sessionScope.user_name }">
                                    <button type="button" id="modifyBtn" class="btn">수정</button>
                                    <button type="button" id="removeBtn" class="btn">삭제</button>
                                </c:if>
                                <button type="button" id="listBtn" class="btn">목록</button>
                            </div>
                        </div>
                    </div> <!-- .col-md-8 -->
                    <div class="col-lg-4 sidebar ftco-animate">
                        <div class="sidebar-box">
                        </div>
                        <div class="sidebar-box ftco-animate">
                            <h3 class="sidebar-heading">Categories</h3>
                            <ul class="categories">
                                <li><a href="diary">Diary <span>${countDiary}</span></a></li>
                                <li><a href="travel">Travel <span>${countTravel}</span></a></li>
                                <li><a href="study">Study <span>${countStudy}</span></a></li>
                            </ul>
                        </div>
                    </div><!-- END COL -->
                </div>
                </form>
            </div>
            <script>
                $(document).ready(function (){ //main
                    $('#listBtn').on("click", function (){
                        location.href = "<c:url value='${contentDTO.category_name}'/>?page=${page}&pageSize=${pageSize}";
                    });
                    $('#removeBtn').on("click", function (){
                        if(!confirm("삭제하시겠습니까?"))
                        {
                            return;
                        }
                        else{
                            let form = $('#contentForm');
                            form.attr("action","<c:url value='remove'/>?page=${page}&pageSize=${pageSize}");
                            form.attr("method","post");
                            form.submit();
                        }
                    });
                    $('#modifyBtn').on("click", function (){
                        let form = $('#contentForm');
                        form.attr("action","<c:url value='modify?content_id=${contentDTO.content_id}&page=${page}&pageSize=${pageSize}'/>");
                        form.attr("method","get");
                        form.submit();
                    });
                });
            </script>
        </section>
        <jsp:include page="../footer.jsp"></jsp:include>
