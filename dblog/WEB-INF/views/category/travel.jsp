<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../head.jsp"></jsp:include>
<div id="colorlib-main">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<c:forEach items = "${list}" var="contentDTO">
							<div class="col-md-12">
								<div class="blog-entry ftco-animate">
									<a href="<c:url value='content?content_id=${contentDTO.content_id}&page=${page}&pageSize=${pageSize}'/>" class="img" style="background-image: url(images/image_5.jpg);"></a>
									<div class="text pt-2 mt-3">
										<span class="category mb-1 d-block"><a href="#">${contentDTO.category_name}</a></span>
										<h3 class="mb-4"><a href="<c:url value='content?content_id=${contentDTO.content_id}&page=${page}&pageSize=${pageSize}'/>">${contentDTO.title}</a></h3>
										<p class="mb-4">${fn:substring(contentDTO.content,0,50)}</p>
										<div class="author mb-4 d-flex align-items-center">
											<a href="#" class="img" style="background-image: url(images/profile.jpg);"></a>
											<div class="ml-3 info">
												<span>Written by</span>
												<h3><a href="#">${contentDTO.user_name}</a>, <span>${contentDTO.cre_date}</span></h3>
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
					<div class="row mt-5">
						<div class="col">
							<%--페이징--%>
							<div class="block-27">
								<ul>
									<c:if test="${ph.showPrev}">
										<li><a href="<c:url value='travel?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a></li>
									</c:if>
									<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
									<a href="<c:url value='travel?page=${i}&pageSize=${ph.pageSize}'/>">
										<li class="active"><span>${i}</span></li>
									</a>
									</c:forEach>
									<c:if test="${ph.showNext}">
										<li><a href="<c:url value='travel?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a></li>
									</c:if>
								</ul>
							</div>
							<%--페이징--%>
						</div>
					</div>
				</div><!-- END-->
				<div class="col-lg-4 sidebar ftco-animate">
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
		</div>
	</section>
<jsp:include page="../footer.jsp"></jsp:include>