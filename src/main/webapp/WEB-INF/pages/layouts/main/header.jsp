<%--
  Created by IntelliJ IDEA.
  User: yusul
  Date: 15. 1. 30.
  Time: 오전 5:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	$(function() {
		var pheight = $('.portfolio-info').height();
		$('.portfolio').height(pheight+"px");
		$('.info1').height(pheight+"px");

		$("[id*='Btn']").stop(true).on('click', function (e) {
			e.preventDefault();$(this).scrolld();
		});

        $("#btnDisplay").unbind("click").click(function(){
            $('#Popup-display').bPopup({
                easing: 'easeOutBack',
                speed: 500,
                transition: 'slideUp',
                closeClass:'popClose'

            });
        });//디스플레이 다양한구성 자세히 보기

		$('#inquiry').click(function(){
			$('#popup').bPopup({
				easing: 'easeOutBack',
				speed: 500,
				transition: 'slideDown'
			});
		});
		$('.submit').on('click', function() {
			if (!$("input[name='subject']").val()){
				alert("제목을 입력하세요");
				return false;
			}
			if (!$("input[name='name']").val()){
				alert("이름을 입력하세요");
				return false;
			}
			if (!$("input[name='tel']").val()){
				alert("연락처를 입력하세요");
				return false;
			}
			if (!$("input[name='email']").val()){
				alert("이메일을 입력하세요");
				return false;
			}
			if (!$('.content').val()){
				alert("의뢰내용을 입력하세요");
				return false;
			}
			$.blockUI();
			$.ajax({
				url: contextPath +'/setApplican',
				type: 'post',
				dataType: 'json',
				data: $('.applicanForm').serialize(),
				success: function(r) {
					$.unblockUI();
					if (!CommonUtils.isEmpty(r.message)) {
						alert(r.message);
						if(r.code=="Success") {
							popupClose();
						}
					}
				},
				error: CommonUtils.responseError
			});
		});
	});
	function popupClose() {
		$('#popup').bPopup().close();
	}
</script>
<div class="area">
	<h1 class="logo"><a href="#demo1" id="demo1Btn"><img src="${contextPath}/resources/img/logo.png" alt="스마트플랫"/></a></h1>
	<div class="nav">
		<ul>
			<li><a href="#demo2" id="demo2Btn">스마트플랫<span class="inline-block">소개</span></a></li>
			<li><a href="#demo3" id="demo3Btn">스마트플랫?</a></li>
			<li><a href="#demo4" id="demo4Btn">디스플레이<span class="inline-block">구성도</span></a></li>
			<li><a href="#demo5" id="demo5Btn">특화된 기능</a></li>
		</ul>
	</div>
	<span class="icon-inquiry button" id="inquiry"><img src="${contextPath}/resources/img/inquiry.png" alt="친절한 견적 및 문의"/></span>
</div>
<div id="popup">
	<div class="bg-left">
		<div class="bg-right">
			<div class="title-area">
				<div class="title">
					<span>친절한</span><b>견적</b><span class="font38">및</span><b>문의</b>
				</div>
				<div class="info">
					<b class="phone">02-577-0177</b>
					<p class="address">sales@digigroove.co.kr</p>
				</div>
			</div>
		</div>
	</div>
	<div class="box">
		<form class="applicanForm">
			<table>
				<colgroup>
					<col width="18%"/>
					<col width="82%"/>
				</colgroup>
				<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" placeholder="제목"/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" placeholder="이름"/></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" name="tel" placeholder="연락처"/></td>
				</tr>
				<tr>
					<th>이메일<span class="inline-block">주소</span></th>
					<td><input type="email" name="email" placeholder="이메일주소"/></td>
				</tr>
				<tr>
					<th>의뢰<span class="inline-block">내용</span></th>
					<td><textarea name="content" class="content" placeholder="의뢰내용"></textarea></td>
				</tr>
				<%--<tr>--%>
				<%--<th>첨부<span class="inline-block">파일</span></th>--%>
				<%--<td><input type="file"/></td>--%>
				<%--</tr>--%>
				</tbody>
			</table>
			<div class="btn-area">
				<input type="button" value="전송" class="btn-blue submit"/>
				<a href="javascript:popupClose();" class="btn-gray">취소</a>
			</div>
		</form>
	</div>
</div>