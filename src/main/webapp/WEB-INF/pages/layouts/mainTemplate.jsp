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
    <meta http-equiv="keywords" content="웹, 모바일웹, 웹사이트개발, DID솔루션 개발, 스마트플랫"/>
    <meta name="description" content="(주)디지그루브는 노력하고 연구하는 DID 전문가 그룹"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/combinedCSS.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${ contextPath }/resources/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/scrolld.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/deferDemo.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.bpopup.min.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script type="text/javascript" src=”http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js”></script>
    <![endif]-->
    <title>SMARTFLAT</title>
</head>
<body>
    <div class="wrap">
        <div id="fixedNavBar" class="header"><tiles:insertAttribute name="header" /></div>
        <div id="fullSectionWrap">
            <tiles:insertAttribute name="body" />
            <tiles:insertAttribute name="footer" />
        </div>
    </div>
</body>
</html>
