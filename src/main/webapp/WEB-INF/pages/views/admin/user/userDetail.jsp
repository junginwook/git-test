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

<script type="text/javascript" src="${contextPath}/resources/js/admin/user.js"></script>

<h3 class="contents-title">내 정보</h3>

<div class="sub-content">

  <form id="userUpdateForm">
    <table class="board-write box-pd">
      <colgroup>
        <col width="150px" />
        <col width="830px" />
      </colgroup>
      <tbody>
      <tr>
        <th>아이디</th>
        <td>
          ${sessionScope.adminSession.id}
          <input type="hidden" name="id" value="${sessionScope.adminSession.id}" />
        </td>
      </tr>
      <tr>
        <th>이름</th>
        <td>
          ${sessionScope.adminSession.name}
            <input type="hidden" name="name" value="${sessionScope.adminSession.name}" />
        </td>
      </tr>
      <tr>
        <th>부서</th>
        <td>
          ${sessionScope.adminSession.team}
            <input type="hidden" name="team" value="${sessionScope.adminSession.team}" />
        </td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="oldPassword" class="oldPassword" /></td>
      </tr>
      <tr>
        <th>새로운 비밀번호</th>
        <td><input type="password" name="newPassword" class="newPassword" /></td>
      </tr>
      <tr>
        <th>새로운 비밀번호 확인</th>
        <td><input type="password" class="checkPassword" /></td>
      </tr>
      </tbody>
    </table>
    <input type="hidden" name="userKey" value="${sessionScope.adminSession.userKey}" />
  </form>
  <div class="btn-area">
    <%--<a href="${contextPath}/admin/require/requireList" class=" floatL btn">목록</a>--%>
    <div class="floatR">
      <a class="floatR btn" onclick="UserUtils.modifyUser(${requireEntity.requireKey})">저장</a>
    </div>
  </div>

</div>