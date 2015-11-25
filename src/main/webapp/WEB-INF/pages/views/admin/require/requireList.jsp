<%--
  Created by IntelliJ IDEA.
  User: changjo
  Date: 15. 11. 24
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${contextPath}/resources/js/admin/datepicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/datepickerDomScript.js"></script>

<h3 class="contents-title">문의내역</h3>

<div class="search-area">
    <form name="searchForm" action="${contextPath}/admin/require/requireList">
        <div class="search-date">
            <label for=" " class="marR-5">등록일</label>
            <input type="text" onclick="DatePickerUtils.datepicker()" id="sd" class="inp-w160 btn-calendar"
                   name="startDate"
                   <c:if test="${not empty requireEntityList.startDate}">value="${requireEntityList.startDate}"</c:if> />
            ~ <input type="text" onclick="DatePickerUtils.datepicker()" id="ed" class="inp-w160 btn-calendar"
                     name="endDate"
                     <c:if test="${not empty requireEntityList.endDate}">value="${requireEntityList.endDate}"</c:if> />
        </div>
        <div class="search-select">
            <select name="searchKey" class="sel-w120">
                <option value="">전체</option>
                <option value="title" <c:if test="${requireEntityList.searchKey eq 'title'}">selected="selected"</c:if>>
                    제목
                </option>
                <option value="name" <c:if test="${requireEntityList.searchKey eq 'name'}">selected="selected"</c:if>>
                    이름
                </option>
                <option value="storeName"
                        <c:if test="${requireEntityList.searchKey eq 'storeName'}">selected="selected"</c:if>>업체명
                </option>
                <option value="phone" <c:if test="${requireEntityList.searchKey eq 'phone'}">selected="selected"</c:if>>
                    핸드폰번호
                </option>
                <option value="email" <c:if test="${requireEntityList.searchKey eq 'email'}">selected="selected"</c:if>>
                    이메일
                </option>
                <option value="state" <c:if test="${requireEntityList.searchKey eq 'state'}">selected="selected"</c:if>>
                    상태
                </option>
            </select>
            <input type="text" class="inp-w160" name="searchValue" value="${requireEntityList.searchValue}"/>
            <input type="submit" class="icon-search" value="검색"/>
        </div>
    </form>
</div>

<div class="sub-content">

    <table class="board-list">
        <colgroup>
            <col width="60px"/>
            <col width="80px"/>
            <col width="200px"/>
            <col width="100px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="130px"/>
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
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${fn:length(requireEntityList.requirePageEntityList) == 0}">
                <tr>
                    <td colspan="8">등록된 문의내역이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="requireEntity" items="${requireEntityList.requirePageEntityList}" varStatus="i">
                    <tr>
                        <td>${requireEntityList.dataSize - (requireEntityList.pageListSize*(requireEntityList.currentPage-1)) - i.index}</td>
                        <td>
                            <c:if test="${requireEntity.state == 0}">
                                <span class="font-color-red">접수</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 1}">
                                <span class="font-color-blue">상담중</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 2}">
                                <span class="font-color-green">상담완료</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 3}">
                                <span class="font-color-orange">계약진행중</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 4}">
                                <span class="font-color-gray">계약완료</span>
                            </c:if>
                        </td>
                        <td class="text-underline">
                            <c:url var="requireDetailURL" value="${contextPath}/admin/require/requireDetail">
                                <c:param name="requireKey" value="${requireEntity.requireKey}"/>
                            </c:url>
                            <a href="${requireDetailURL}">${requireEntity.title}</a>
                        </td>
                        <td>${requireEntity.name}</td>
                        <td>${requireEntity.storeName}</td>
                        <td>${requireEntity.phone}</td>
                        <td>${requireEntity.email}</td>
                        <td><fmt:formatDate value="${requireEntity.registDatetime}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <div class="btn-area">
        <%--<a href="${contextPath}/admin/require/requireList" class=" floatL btn">목록</a>--%>
        <div class="floatR">
            <a class="floatL btn" onclick="RequireUtils.registRequireForm()">등록</a>
        </div>
    </div>

    <div class="paging-area">
        <page:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/require/requireList"
                             pageNavigationEntity="${requireEntityList}"/>
    </div>

</div>
