<%--
  Created by IntelliJ IDEA.
  User: jsw
  Date: 15. 2. 11
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%--<link rel="shortcut icon" href="${contextPath}/resources/img/common/icon-shortcut.ico" />--%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="imagetoolbar" content="no">
	<style type="text/css">
		.error-contents{position:absolute;top:0;left:0;width:100%;height:100%;text-align:center;background:#f4f4f4}
		.error-contents div{color:#343e47;letter-spacing:-2px;}
		.error-contents .title{font-size:34px;padding:184px 0 50px;margin-top:125px;background:url(${contextPath}/resources/img/common/bg-error.png) no-repeat center top;}
		.error-contents .txt{font-size:18px;line-height:32px;}
		.error-contents .btn{text-decoration:none;display:inline-block;width:200px;color:#fff;font-size:18px;letter-spacing:-1px;padding:18px 0;margin-top:70px;background:#e05f29}
	</style>
	<title>SMARTFLAT</title>
</head>
<body>
<div class="error-contents">
	<div class="title">웹페이지를 표시할 수 없습니다.</div>
	<div class="txt">방문하시려는 페이지의 주소가 잘못 입력되었거나<br/>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br/>
		입력하신 주소가 정확한지 다시 한번 확인해주시기 바랍니다.<br/>감사합니다.</div>
	<a href="${contextPath}/" class="btn">메인으로</a>
</div>
</body>
</html>
