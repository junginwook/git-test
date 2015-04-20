<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding( "UTF-8" );
	response.setHeader( "Cache-Control", "no-cache, must-revalidate" );
	response.setHeader( "Pragma", "no-cache" );
	response.setDateHeader( "Expires", 0 );
	response.setHeader( "returnURI", request.getRequestURI() );
	response.setContentType( "text/html; charset=UTF-8" );
%>
<html>
<head>
	<script type="text/javascript">
		var contextPath = '${contextPath}';
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0"/>
	<meta http-equiv="keywords" content="웹, 모바일웹, 웹사이트개발, DID솔루션 개발, 스마트플랫, 디지텉메뉴판, 디지탈메뉴판, 디지털메뉴보드,
    디지털광고판, 디지털광고보드, 스마트사이니지, 디지털사이니지, 스마트광고판, 비디오월, did, 키오스크, 키오스크, e-브로셔, 스마트메뉴보드, 스마트메뉴판,
    미디어월, 전자메뉴보드, 디지털광고, 디지털광고판, 디지털게시판, 광고용모니터, 광고모니터, did광고, did시스템, did광고시스템, 전자게시판, 상황판,
    전자상황판, 웹전자게시판, 웹전자게시판시스템, did게시판, 인테리어게시판, 벽걸이메뉴판, 벽걸이메뉴보드, 메뉴보드판, 이벤트보드, 카페 메뉴보드
    까페메뉴보드, 카페메뉴판, 커피메뉴보드, 커피숍메뉴보드, 스마트메뉴, 메뉴보드판, 전자메뉴보드, 초크아트, 쵸크아트, 웰컴보드, 모니터메뉴판, 디자인메뉴판,
    디자인메뉴보드"/>
	<meta name="description" content="(주)디지그루브는 노력하고 연구하는 DID 전문가 그룹"/>
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700"/>
	<link rel="shortcut icon" href='${contextPath}/resources/img/favicon.ico' />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/owl.carousel.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/animate.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/combinedCSS.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/flipclock.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery.simpleWeather.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/analog.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery.calendar.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/js-image-slider-01.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/js-image-slider-02.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/js-image-slider-03.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/smartflat/js-image-slider.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.simpleWeather.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.blockUI.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/scrolld.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/animatescroll.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/deferDemo.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/owl.carousel.js"></script>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<script type="text/javascript" src=”http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js”></script>
	<![endif]-->
	<title>똑똑하고 쉬운 디지털사이니지 솔루션 - 스마트플랫</title>
</head>
<body>
<div class="wrap">
	<div id="fixedNavBar" class="header"><tiles:insertAttribute name="header" /></div>
	<div id="fullSectionWrap">
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</div>
<script type="text/javascript">
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-59222653-1', 'auto');
	ga('send', 'pageview');

</script>
</body>
</html>
