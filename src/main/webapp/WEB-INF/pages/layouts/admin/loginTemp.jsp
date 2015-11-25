<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
  response.setHeader("Cache-Control", "no-cache, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
  response.setHeader("returnURI", request.getRequestURI());
  response.setContentType("text/html; charset=UTF-8");
%>
<html>
<head>
  <script type="text/javascript">
    var contextPath = '${contextPath}';
  </script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="no">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="format-detection" content="telephone=no">
  <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/img/favicon.ico" />
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/admin/admin.css"/>
  <script src="${contextPath}/resources/js/jquery-1.10.1.js"></script>
  <script src="${contextPath}/resources/js/common.js"></script>
  <script src="${contextPath}/resources/js/jquery.blockUI.js"></script>
  <script src="${contextPath}/resources/js/jquery.form.js"></script>
  <script src="${contextPath}/resources/js/jquery.placeholder.js"></script>
  <title>관리자페이지</title>
</head>
<body>

<div id="login-area">
  <tiles:insertAttribute name="body" />
</div>
</body>
</html>