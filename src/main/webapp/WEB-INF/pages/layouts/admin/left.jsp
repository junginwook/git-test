<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
    $(function(){
        var height = $(".contents").height()+250;
        $("body").height(height);
    });
</script>
<div class="logo left">
    <a href="${contextPath}/admin/require/requireList">
        <img src="${contextPath}/resources/img/logo.png" alt="smartflat"/>
    </a>
</div>
<div class="left-bar">
    <ul>
        <li <c:if test="${currentMenu == 'requireList'}">class="on"</c:if>>
            <a href="${contextPath}/admin/require/requireList">문의내역</a>
        </li>
        <%--<li <c:if test="${currentMenu=='userManagement'}">class="on"</c:if>>--%>
            <%--<c:if test="${sessionScope.adminSession.grade == 10}">--%>
                <%--<a href="${contextPath}/admin/userManagement/userList">사용자관리</a>--%>
            <%--</c:if>--%>
            <%--<c:if test="${sessionScope.adminSession.grade == 9}">--%>
                <%--<a href="${contextPath}/admin/userManagement/userDetail?userKey=${sessionScope.adminSession.userKey}">내정보관리</a>--%>
            <%--</c:if>--%>
        <%--</li>--%>
        <%--<c:if test="${sessionScope.adminSession.grade == 9}">--%>
            <%--<li <c:if test="${currentMenu=='franchiseManagement'}">class="on"</c:if>>--%>
                <%--<a href="${contextPath}/admin/franchiseManagement/franchiseList">가맹점관리</a>--%>
            <%--</li>--%>
        <%--</c:if>--%>
        <%--<li <c:if test="${currentMenu=='inquire'}">class="on"</c:if>>--%>
            <%--<a href="${contextPath}/admin/inquire/inquireList">문의내역</a>--%>
        <%--</li>--%>
        <%--<c:if test="${sessionScope.adminSession.grade == 10}">--%>
            <%--<li <c:if test="${currentMenu=='userAppManagement'}">class="on"</c:if>>--%>
                <%--<a href="${contextPath}/admin/userAppManagement/layoutManagement/layoutList">사용자앱옵션관리</a>--%>
                <%--<ul>--%>
                    <%--<li><a href="${contextPath}/admin/userAppManagement/layoutManagement/layoutList">레이아웃관리</a></li>--%>
                    <%--<li><a href="${contextPath}/admin/userAppManagement/backgroundManagement/backgroundList">배경관리</a></li>--%>
                    <%--<li><a href="${contextPath}/admin/userAppManagement/themeManagement/themeList">테마관리</a></li>--%>
                <%--</ul>--%>
            <%--</li>--%>
            <%--<li <c:if test="${currentMenu=='adminUserManagement'}">class="on"</c:if>>--%>
                <%--<a href="${contextPath}/admin/adminUserManagement/adminList">관리자계정관리</a>--%>
            <%--</li>--%>
            <%--<li <c:if test="${currentMenu=='storeManagement'}">class="on"</c:if>>--%>
                <%--<a href="${contextPath}/admin/storeManagement/storeList">매장관리</a>--%>
            <%--</li>--%>
        <%--</c:if>--%>
    </ul>
</div>