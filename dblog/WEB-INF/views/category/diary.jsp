<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../head.jsp"></jsp:include>
		<div id="colorlib-main">
			<section class="ftco-section-2">
				<div class="photograhy">
					<div class="row no-gutters">
						<c:forEach items = "${list}" var="contentDTO">
						<div class="col-md-3">
							<a href="<c:url value='content?content_id=${contentDTO.content_id}&page=${page}&pageSize=${pageSize}'/>" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: linear-gradient(rgba(0, 0, 0, 0.527), rgba(0, 0, 0, 0.5)), url(images/diary.jpg);">
								<div class="" style="color:white;">
									<h3 style="color:white;">${contentDTO.title}</h3>
										<span>
											${contentDTO.cre_date}
										</span>
								</div>
							</a>
						</div>
						</c:forEach>
						<c:if test="${empty list}">
							<p> 아직 글이 없습니다.</p>
						</c:if>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<%--페이징--%>
						<div class="block-27" align="center">
							<ul>
								<c:if test="${ph.showPrev}">
									<li><a href="<c:url value='diary?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a></li>
								</c:if>
								<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
									<a href="<c:url value='diary?page=${i}&pageSize=${ph.pageSize}'/>">
										<li class="active"><span>${i}</span></li>
									</a>
								</c:forEach>
								<c:if test="${ph.showNext}">
									<li><a href="<c:url value='diary?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a></li>
								</c:if>
							</ul>
						</div>
						<%--페이징--%>
					</div>
				</div>
			</section>
			<jsp:include page="../footer.jsp"></jsp:include>
