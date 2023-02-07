<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.net.URLDecoder"%>
        <jsp:include page="../head.jsp"></jsp:include>
<script>

</script>
  <div id="colorlib-main">
    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h4 font-weight-bold">로그인</h2>
            <input type="hidden" name="toURL" value="${param.toURL}">
          </div>
          <div class="w-100"></div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last pr-md-5">
            <form action="<c:url value="/loginPro"/>" method="post" onsubmit="return formCheck(this);">
              <div id="msg">
                <c:if test="${not empty param.msg}">
                  <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg,"utf-8")}</i>
                </c:if>
              </div>
              <input type="text" name="id" placeholder="아이디" autofocus>
              <br>
              <input type="password" name="pwd" placeholder="비밀번호">

              <br>
              <br>
              <button class="btn btn-primary py-3 px-5">로그인</button>
              <script>
                function formCheck(frm) {
                  let msg ='';
                  if(frm.id.value.length==0) {
                    setMessage('id를 입력해주세요.', frm.id);
                    return false;
                  }
                  if(frm.pwd.value.length==0) {
                    setMessage('password를 입력해주세요.', frm.pwd);
                    return false;
                  }
                  return true;
                }
                function setMessage(msg, element){
                  document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
                  if(element) {
                    element.select();
                  }
                }
              </script>
            </form>
          </div>
        </div>
      </div>
    </section>
<jsp:include page="../footer.jsp"></jsp:include>