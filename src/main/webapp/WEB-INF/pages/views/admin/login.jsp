<%--
  Created by IntelliJ IDEA.
  User: changjo
  Date: 15. 11. 24
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/resources/js/admin/admin.js"></script>
<script type="text/javascript">
  $(function(){
    AdminLoginUtil.loginSubmit();
  });
</script>
<div class="login-bg">
  <div class="login-box">
    <div class="backWrap">
      <h1 class="logo">
        <img src="${contextPath}/resources/img/logo.png" alt="smartflat"/>
      </h1>
      <form id="loginForm" action="${contextPath}/loginRest/loginSubmit">
        <input type="hidden" name="userType" value="3" />
        <input type="hidden" name="isLogin" value="1" />
        <div class="login-form">
          <div class="marB5">
            <input type="text" name="id" class="id required" value="${keepIdValue}" placeholder="아이디" data-check-name="아이디" />
          </div>
          <div>
            <input type="password" name="password" class="password required" placeholder="비밀번호" data-check-name="비밀번호" />
          </div>
          <div class="btn-area">
            <%--<a href="main.jsp" class="login">로그인</a>--%>
            <input type="submit" class="flat-btn btn-darkblue max-width" value="로그인" />
          </div>
          <div class="joinBtnArea">
            <a href="${contextPath}/user/userJoin" class="flat-btn btn-red">회원가입</a>
            <%--<input type="button" class="flat-btn btn-red max-width" value="회원가입" />--%>
          </div>
          <div class="bold">
            <input type="checkbox" id="keepIdYn" name="keepIdYn" <c:if test="${keepIdValue != null}">checked</c:if> />아이디 기억하기
          </div>
        </div>
      </form>
    </div>
  </div>
</div>