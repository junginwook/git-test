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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/img/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/admin/admin.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery-ui.min.css" />
    <script type="text/javascript" src="${contextPath}/resources/js/jquery-1.10.1.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.form.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.placeholder.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery-ui.min.js"></script>
    <title>관리자페이지</title>
</head>
<body>

<div id="wrap-area">
    <div id="left-wrap">
        <tiles:insertAttribute name="left" />
    </div>
    <div id="right-wrap">
        <div class="top-gnb">
            <tiles:insertAttribute name="header" />
        </div>
        <div class="contents">
            <tiles:insertAttribute name="body" />
        </div>
    </div>
</div>
</body>
</html>