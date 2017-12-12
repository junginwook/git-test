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
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="date" value="${now}" pattern="yyyy/MM/dd/HH/mm/ss" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${contextPath}/resources/js/admin/datepicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/datepickerDomScript.js"></script>

<script type="text/javascript" src="${contextPath}/resources/js/admin/require.js"></script>
<script type="text/javascript">
    $(function(){

        var w = $(window).width();
        $(".noticeModal").css({
            top : -35,
            left : w/2-150
        });
        var list = ${jsonList};
        var cnt = 0;
        for(var i=0; i<list.length; i++){
            if(list[i].state == 0){
                cnt++;
            }
        }
        if(cnt > 0){
            $(".noticeText").text(cnt);
            $(".noticeModal").animate({
                top : 30
            }).delay(4000).animate({
                top : -35
            });
        }

        var searchKey = '${requireEntityList.searchKey}';
        console.log(searchKey);
        <%--var searchValue = '${requireEntityList.searchValue}';--%>
        var inputText = '<input type="text" class="searchText inp-w160" name="searchValue" value="${requireEntityList.searchValue}"/>';
        var inputSelect = '<select name="searchValue" class="selector">' +
                '<option value="0">접수</option>' +
                '<option value="1">상담중</option>' +
                '<option value="2">상담완료</option>' +
                '<option value="3">계약진행중</option>' +
                '<option value="4">계약(입금)완료</option>' +
                '<option value="5">배송(설치)완료</option>' +
                '<option value="6">A/S접수</option>' +
                '<option value="7">A/S완료</option></select>';
        var submitBtn = '<input type="submit" class="searchBtn icon-search" value="검색"/>';

        if(searchKey == 'state'){
            var inputSelect2 = '<select name="searchValue" class="selector">' +
                    '<option value="0" <c:if test="${requireEntityList.searchValue == '0'}">selected="selected"</c:if>>접수</option>' +
                    '<option value="1" <c:if test="${requireEntityList.searchValue == '1'}">selected="selected"</c:if>>상담중</option>' +
                    '<option value="2" <c:if test="${requireEntityList.searchValue == '2'}">selected="selected"</c:if>>상담완료</option>' +
                    '<option value="3" <c:if test="${requireEntityList.searchValue == '3'}">selected="selected"</c:if>>계약진행중</option>' +
                    '<option value="4" <c:if test="${requireEntityList.searchValue == '4'}">selected="selected"</c:if>>계약(입금)완료</option>' +
                    '<option value="5" <c:if test="${requireEntityList.searchValue == '5'}">selected="selected"</c:if>>배송(설치)완료</option>' +
                    '<option value="6" <c:if test="${requireEntityList.searchValue == '6'}">selected="selected"</c:if>>A/S접수</option>' +
                    '<option value="7" <c:if test="${requireEntityList.searchValue == '7'}">selected="selected"</c:if>>A/S완료</option></select>';
            $(".queryZone").append(inputSelect2+submitBtn);
        }else{
            $(".queryZone").append(inputText+submitBtn);
        }
        $(".search-area").on("change", ".searchSelector", function(){
            console.log($(this).val());
            if($(this).val() == "state"){
                $(".queryZone").empty().append(inputSelect+submitBtn);
            }else{
                $(".queryZone").empty().append(inputText+submitBtn);
                $(".searchText").val("");
            }
        });

        var systemTime = "${date}";
        var systemArr = systemTime.split("/");
        var registDatetime = $(".hiddenDatetime", this).val();
        var timeArr = [];
        var currentHour = 0;
        var currentMin = 0;
        var currentSec = 0;
        var time = 0;
        var index = 0;
        $(".registDatetime").each(function(){
            registDatetime = $(".hiddenDatetime", this).val();
            timeArr = registDatetime.split("/");
            index = $(this).parent().index();

            //년도
            if(systemArr[0] == timeArr[0]){
                //월
                if(systemArr[1] == timeArr[1]){
                    //일
                    if(systemArr[2] == timeArr[2]){
                        currentHour = Number(systemArr[3]) - Number(timeArr[3]);
                        currentMin = Number(systemArr[4]) - Number(timeArr[4]);
                        currentSec = Number(systemArr[5]) - Number(timeArr[5]);
                        time = currentSec + (currentMin*60) + (currentHour*60*60);
                        if(time < 21600){
                            console.log(index);
                            <%--$(".newZone:eq(" + index + ")").prepend("<img src='${contextPath}/resources/img/new.gif' alt='' style='margin-top:-1px;' />");--%>
                            $(".newZone:eq(" + index + ")").css({
                                background : "url('${contextPath}/resources/img/new.gif') no-repeat right center"
                            });
                        }
                    }
                }
            }
        });

        // 엑셀다운로드
        $('#btnExcel').click(function () {
            $('#searchForm').attr('action', contextPath + '/admin/require/excel/requireExcelList');
            $('#searchForm').submit();
            $('#searchForm').attr('action', contextPath + '/admin/require/requireList');
            return false;
        });
    });
</script>

<h3 class="contents-title">문의내역</h3>

<div class="search-area">
    <form name="searchForm" id="searchForm" action="${contextPath}/admin/require/requireList">
        <div class="search-date">
            <input type="text" onclick="DatePickerUtils.datepicker()" id="sd" class="inp-w160 btn-calendar"
                   name="startDate"
                   <c:if test="${not empty requireEntityList.startDate}">value="${requireEntityList.startDate}"</c:if> />
            ~ <input type="text" onclick="DatePickerUtils.datepicker()" id="ed" class="inp-w160 btn-calendar"
                     name="endDate"
                     <c:if test="${not empty requireEntityList.endDate}">value="${requireEntityList.endDate}"</c:if> />
        </div>
        <div class="search-select">
            <select name="searchKey" class="searchSelector sel-w120">
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
            <span class="queryZone">

            </span>
            <%--<input type="text" class="inp-w160" name="searchValue" value="${requireEntityList.searchValue}"/>--%>
            <%--<input type="submit" class="searchBtn icon-search" value="검색"/>--%>
        </div>
    </form>
</div>

<div class="sub-content">

    <table class="board-list">
        <colgroup>
            <col width="60px"/>
            <col width="80px"/>
            <col width="350px"/>
            <col width="100px"/>
            <col width="150px"/>
            <col width="150px"/>
            <%--<col width="150px"/>--%>
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
            <%--<th>이메일</th>--%>
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
                        <td>
                            ${requireEntityList.dataSize - (requireEntityList.pageListSize*(requireEntityList.currentPage-1)) - i.index}
                        </td>
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
                                <span class="font-color-gray">계약(입금)완료</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 5}">
                                <span class="font-color-pink">배송(설치)완료</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 6}">
                                <span class="font-color-purple">A/S접수</span>
                            </c:if>
                            <c:if test="${requireEntity.state == 7}">
                                <span class="font-color-darkgray">A/S완료</span>
                            </c:if>
                        </td>
                        <td class="newZone">
                            <c:url var="requireDetailURL" value="${contextPath}/admin/require/requireDetail">
                                <c:param name="requireKey" value="${requireEntity.requireKey}"/>
                            </c:url>
                            <div class="text-underline overflowZone">[${requireEntity.reple}] <a href="${requireDetailURL}">${requireEntity.title}</a></div>
                        </td>
                        <td>${requireEntity.name}</td>
                        <td>${requireEntity.storeName}</td>
                        <td>${requireEntity.phone}</td>
                        <%--<td>${requireEntity.email}</td>--%>
                        <td class="registDatetime">
                            <fmt:formatDate value="${requireEntity.registDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate var="hiddenDatetime" value="${requireEntity.modifyDatetime}" pattern="yyyy/MM/dd/HH/mm/ss"/>
                            <input type="hidden" class="hiddenDatetime" value="${hiddenDatetime}" />
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <div class="btn-area">
        <%--<a href="${contextPath}/admin/require/requireList" class=" floatL btn">목록</a>--%>
            <a class="floatL btn" id="btnExcel">엑셀다운로드</a>
        <div class="floatR">
            <a class="floatL btn" onclick="RequireUtils.registRequireForm()">등록</a>
        </div>
    </div>

    <div class="paging-area">
        <page:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/require/requireList"
                             pageNavigationEntity="${requireEntityList}"/>
    </div>

    <div class="noticeModal">
        "접수"상태의 문의내역이 <span class="noticeText">0</span>개 있습니다.
    </div>

</div>
