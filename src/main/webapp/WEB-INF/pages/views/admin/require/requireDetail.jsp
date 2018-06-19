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
<%--<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>--%>
<script type="text/javascript" src="${contextPath}/resources/js/admin/require.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/requireDomScript.js"></script>

<h3 class="contents-title">문의내역 상세보기</h3>

<div class="sub-content">

  <form id="requireUpdateForm">
    <table class="board-write box-pd">
      <colgroup>
        <col width="150px" />
        <col width="830px" />
      </colgroup>
      <tbody>
      <tr>
        <th>상태</th>
        <td>
          <select name="state">
            <option <c:if test="${requireEntity.state == 0}">selected="selected"</c:if> value="0">접수</option>
            <option <c:if test="${requireEntity.state == 1}">selected="selected"</c:if> value="1">상담중</option>
            <option <c:if test="${requireEntity.state == 2}">selected="selected"</c:if> value="2">상담완료</option>
            <option <c:if test="${requireEntity.state == 3}">selected="selected"</c:if> value="3">계약진행중</option>
            <option <c:if test="${requireEntity.state == 4}">selected="selected"</c:if> value="4">계약(입금)완료</option>
            <option <c:if test="${requireEntity.state == 5}">selected="selected"</c:if> value="5">배송(설치)완료</option>
            <option <c:if test="${requireEntity.state == 6}">selected="selected"</c:if> value="6">A/S접수</option>
            <option <c:if test="${requireEntity.state == 7}">selected="selected"</c:if> value="7">A/S완료</option>
            <option <c:if test="${requireEntity.state == 8}">selected="selected"</c:if> value="8"> 서비스 차단</option>
          </select>
        </td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title" value="${requireEntity.title}" /></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input type="text" name="name" value="${requireEntity.name}" /></td>
      </tr>
      <tr>
        <th>업체명</th>
        <td><input type="text" name="storeName" value="${requireEntity.storeName}" /></td>
      </tr>
      <tr>
        <th>연락처</th>
        <td><input type="text" name="phone" value="${requireEntity.phone}" /></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="text" name="email" value="${requireEntity.email}" /></td>
      </tr>
      <tr>
        <th>등록일</th>
        <td><fmt:formatDate value="${requireEntity.registDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
      <tr>
        <th>문의내용</th>
        <td>
          <textarea id="content" cols="120" rows="10" class="content" name="content">${requireEntity.content}</textarea>
        </td>
      </tr>
      </tbody>
    </table>
    <input type="hidden" name="requireKey" value="${requireEntity.requireKey}" />
  </form>
  <div class="btn-area">
    <a href="${contextPath}/admin/require/requireList" class=" floatL btn">목록</a>

    <div class="floatR">
      <a class="floatL btn" onclick="RequireUtils.removeRequire(${requireEntity.requireKey})">삭제</a>
      <a class="floatR btn" onclick="RequireUtils.modifyRequire(${requireEntity.requireKey})">저장</a>
    </div>
  </div>

</div>

<div id="dialog-confirm" title="문의내역 삭제">
  <p>해당 문의내역이 삭제됩니다. 계속하시겠습니까?</p>
</div>

<h3 class="contents-title marT-50">기록</h3>

<div class="sub-content">

  <table class="board-write">
    <colgroup>
      <col width="175px" />
      <col width="465px" />
      <col width="175px" />
      <col width="465px" />
    </colgroup>
    <tbody>
    <c:choose>
      <c:when test="${fn:length(repleEntityList.repleEntityList) == 0}">
        <tr>
          <td colspan="4" class="font-align-center">등록된 기록이 없습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <c:forEach var="repleEntity" items="${repleEntityList.repleEntityList}" varStatus="i">
          <c:if test="${i.index > 0}">
            <tr>
              <td colspan="4"></td>
            </tr>
          </c:if>
          <tr>
            <th>작성자</th>
            <td>${repleEntity.name}</td>
            <th class="th-border-left">등록일</th>
            <td><fmt:formatDate value="${repleEntity.registDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
          </tr>
          <tr>
            <th>
              내용
            </th>
            <td colspan="3">
              ${repleEntity.reple}
            </td>
          </tr>
          <c:if test="${repleEntity.name == sessionScope.adminSession.name}">
            <tr>
              <td colspan="4">
                <div class="btn-area clearPadding">
                  <div class="floatR">
                    <a class="btn" onclick="RequireUtils.removeReple(${repleEntity.repleKey}, ${requireEntity.requireKey})">내기록삭제</a>
                  </div>
                </div>
              </td>
            </tr>
          </c:if>
        </c:forEach>
      </c:otherwise>
    </c:choose>
    <tr>
      <td colspan="4"></td>
    </tr>
    <tr>
      <td colspan="4">
        <form id="repleRegistForm">
          <div class="repleZone">
            <textarea id="repleContent" cols="153" rows="5" class="repleContent floatL" name="reple" ></textarea>
            <input type="hidden" name="requireKey" value="${requireEntity.requireKey}" />
            <input type="hidden" name="name" value="${sessionScope.adminSession.name}" />
          </div>
          <div class="repleBtnZone">
            <div class="btn-area">
              <div class="floatR">
                <a class="btn" onclick="RequireUtils.registReple(${requireEntity.requireKey})">기록남기기</a>
              </div>
            </div>
          </div>
        </form>
      </td>
    </tr>
    </tbody>
  </table>

</div>
<script type="text/javascript" src="${contextPath}/resources/js/se/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
  var oEditors = [];
  nhn.husky.EZCreator.createInIFrame({
    oAppRef : oEditors
    , elPlaceHolder : "repleContent"
    , sSkinURI : "${contextPath}/resources/js/se/SmartEditor2Skin.html"
    , fCreator : "createSEditor2"
  });
</script>
