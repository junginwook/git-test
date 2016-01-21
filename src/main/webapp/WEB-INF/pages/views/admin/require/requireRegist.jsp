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

<script type="text/javascript" src="${contextPath}/resources/js/admin/require.js"></script>

<h3 class="contents-title">문의내역 등록</h3>

<div class="sub-content">

  <form id="requireRegistForm">
    <table class="board-write box-pd">
      <colgroup>
        <col width="150px" />
        <col width="830px" />
      </colgroup>
      <tbody>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title" value="" /></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input type="text" name="name" value="" /></td>
      </tr>
      <tr>
        <th>업체명</th>
        <td><input type="text" name="storeName" value="" /></td>
      </tr>
      <tr>
        <th>연락처</th>
        <td><input type="text" name="phone" value="" /></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="text" name="email" value="" /></td>
      </tr>
      <tr>
        <th>문의내용</th>
        <td>
          <textarea id="requireContent" rows="10" cols="120" class="requireContent" name="content"></textarea>
        </td>
      </tr>
      </tbody>
    </table>
  </form>
  <div class="btn-area">
    <a href="${contextPath}/admin/require/requireList" class=" floatL btn">목록</a>

    <div class="floatR">
      <a class="floatL btn" onclick="RequireUtils.registRequire()">저장</a>
    </div>
  </div>

</div>
<script type="text/javascript" src="${contextPath}/resources/js/se/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
  var oEditors = [];
  nhn.husky.EZCreator.createInIFrame({
    oAppRef : oEditors
    , elPlaceHolder : "requireContent"
    , sSkinURI : "${contextPath}/resources/js/se/SmartEditor2Skin.html"
    , fCreator : "createSEditor2"
  });
</script>