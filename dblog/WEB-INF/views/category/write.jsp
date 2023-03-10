<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../head.jsp"></jsp:include>
		<div id="colorlib-main">
			<section class="ftco-section contact-section">
	      <div class="container">
	        <div class="row d-flex mb-5 contact-info">
	          <div class="col-md-12 mb-4">
	            <h2 class="h4 font-weight-bold">WRITING</h2>
	          </div>
	          <div class="w-100"></div>
	        </div>
	        <div class="row block-9">
	          <div class="col-md-6 order-md-last pr-md-5">
	            <form action="" id="writeForm">
					<div class="form-group">
						<p>CATEGORY</p>
						<input type="hidden" id="category_name" name="category_name" value="">
						<input type="radio" id="Diary" name="selectCategory" value="1">Diary &nbsp;
						<input type="radio" id="Travel" name="selectCategory" value="2">Travel &nbsp;
						<input type="radio" id="Study" name="selectCategory" value="3">Study
					</div>
					<div class="form-group">
					<input type="text" id="title" name="title" class="form-control" placeholder="Title" value="">
					</div>
					<div class="form-group">
					<textarea name="content" id="content" cols="30" rows="9" class="form-control" placeholder="Content"></textarea>
					</div>
					<div class="form-group">
						<input type="button" id="writeBtn" value="작성" class="btn btn-primary py-3 px-5">
						<input type="button" id="cancelBtn" value="취소" class="btn btn-primary py-3 px-5">
					</div>
	            </form>
	          </div>
	        </div>
	      </div>
		<script>
			$(document).ready(function () { //main

				$('input[name=selectCategory]').on('click', function () {
					var selectCategory = $("input[name='selectCategory']:checked").val();
					if (selectCategory == 1) {
						$("input[name='category_name']").val("Diary");
					} else if (selectCategory == 2) {
						$("input[name='category_name']").val("Travel");
					} else if (selectCategory == 3) {
						$("input[name='category_name']").val("Study");
					}
				});

				$('#writeBtn').on("click", function (){
					let form = document.getElementById("writeForm");
					if(form.category_name.value=="" || null)
					{
						alert("카테고리를 선택해 주세요");
						return false;
					}
					if(form.title.value=="") {
						alert("제목을 입력해 주세요.");
						form.title.focus();
						return false;
					}
					if(form.content.value=="") {
						alert("내용을 입력해 주세요.");
						form.content.focus();
						return false;
					}
					if(!confirm("등록하시겠습니까?"))
					{
						return;
					}
					else{
						let form = $('#writeForm');
						form.attr("action","<c:url value='writePro'/>");
						form.attr("method","post");
						form.submit();
					}
				});
				$('#cancelBtn').on("click", function (){
					location.href = "index";
				});
			});

		</script>
	    </section>
<jsp:include page="../footer.jsp"></jsp:include>
