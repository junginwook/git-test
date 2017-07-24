<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv='Content-Type' content='application/vnd.ms-excel; charset=utf-8'/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<table cellpadding="0" cellspacing="0" border="1">
    <colgroup>
        <col width="13%" />
        <col width="*" />
        <col width="13%" />
        <col width="13%" />
        <col width="13%" />
        <col width="13%" />
        <col width="13%" />
        <col width="13%" />
    </colgroup>
    <thead>
    <tr>
        <th>번호</th>
        <th>상태</th>
        <th>제목</th>
        <th>이름</th>
        <th>업체명</th>
        <th>연락처</th>
        <th>이메일</th>
        <th>등록일</th>
        <th>문의내역</th>
    </tr>
    </thead>
    <tfoot>
    <c:if test="${requireEntityList.requirePageEntityList.size() eq 0}">
        <tr><td colspan="9">문의내역이 없습니다.</td></tr>
    </c:if>
    <c:forEach var="requireEntity" items="${requireEntityList.requirePageEntityList}" varStatus="i">
        <tr align="center">
            <td style="text-align: center; vertical-align: middle;">${requireEntityList.dataSize - (requireEntityList.pageListSize*(requireEntityList.currentPage-1)) - i.index}</td>
            <td style="text-align: center; vertical-align: middle;">
                <c:if test="${requireEntity.state == 0}">
                    접수
                </c:if>
                <c:if test="${requireEntity.state == 1}">
                    상담중
                </c:if>
                <c:if test="${requireEntity.state == 2}">
                    상담완료
                </c:if>
                <c:if test="${requireEntity.state == 3}">
                    계약진행중
                </c:if>
                <c:if test="${requireEntity.state == 4}">
                    계약완료
                </c:if>
            </td>
            <td style="text-align: center; vertical-align: middle;">[${requireEntity.reple}] ${requireEntity.title}</td>
            <td style="text-align: center; vertical-align: middle;">${requireEntity.name}</td>
            <td style="text-align: center; vertical-align: middle;">${requireEntity.storeName}</td>
            <td style="text-align: center; vertical-align: middle;">${requireEntity.phone}</td>
            <td style="text-align: center; vertical-align: middle;">${requireEntity.email}</td>
            <td style="text-align: center; vertical-align: middle;"><fmt:formatDate value="${requireEntity.registDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td style="text-align: center; vertical-align: middle;">${requireEntity.content}</td>
        </tr>
    </c:forEach>
    </tfoot>
</table>