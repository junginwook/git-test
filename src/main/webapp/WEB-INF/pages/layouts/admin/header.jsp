<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/resources/js/admin/admin.js"></script>
<script type="text/javascript">
    $(function(){
        AdminLoginUtil.logoutSubmit();
    });
</script>
<span>
    <span class="bold"><a href="${contextPath}/admin/user/userDetail">${sessionScope.adminSession.name}</a></span> 님! 환영합니다.
</span>
<a href="#" class="btn logout"><span>로그아웃</span></a>