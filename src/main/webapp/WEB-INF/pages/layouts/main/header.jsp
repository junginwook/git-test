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

        $('#property').click(function(){
            $('#popup-property').bPopup({
                easing: 'easeOutBack',
                speed: 500,
                transition: 'slideDown'
            });
        });

//		$('.submit').on('click', function() {
//			if (!$("input[name='subject']").val()){
//				alert("제목을 입력하세요");
//				return false;
//			}
//			if (!$("input[name='name']").val()){
//				alert("이름을 입력하세요");
//				return false;
//			}
//			if (!$("input[name='tel']").val()){
//				alert("연락처를 입력하세요");
//				return false;
//			}
//			if (!$("input[name='email']").val()){
//				alert("이메일을 입력하세요");
//				return false;
//			}
//			if (!$('.content').val()){
//				alert("의뢰내용을 입력하세요");
//				return false;
//			}
//			$.blockUI();
//			$.ajax({
//				url: contextPath +'/setApplican',
//				type: 'post',
//				dataType: 'json',
//				data: $('.applicanForm').serialize(),
//				success: function(r) {
//					$.unblockUI();
//					if (!CommonUtils.isEmpty(r.message)) {
//						alert(r.message);
//						if(r.code=="Success") {
//							popupClose();
//						}
//					}
//				},
//				error: CommonUtils.responseError
//			});
//		});

        $('.submit').on('click', function() {
            var formObj = $(this).closest('form');
            if (!formObj.find("input[name='subject']").val()){
                alert("제목을 입력하세요");
                return false;
            }
            if (!formObj.find("input[name='name']").val()){
                alert("이름을 입력하세요");
                return false;
            }
            if (!formObj.find("input[name='tel']").val()){
                alert("연락처를 입력하세요");
                return false;
            }
            if (!formObj.find("input[name='email']").val()){
                alert("이메일을 입력하세요");
                return false;
            }
            if (!formObj.find('.content').val()){
                alert("의뢰내용을 입력하세요");
                return false;
            }
            $.blockUI();
            $.ajax({
                url: contextPath +'/setApplican',
                type: 'post',
                dataType: 'json',
                data: formObj.serialize(),
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
        $('#popup-property').bPopup().close();
	}
</script>
<div class="area">
	<h1 class="logo"><a href="#demo1" id="demo1Btn"><img src="${contextPath}/resources/img/logo.png" alt="스마트플랫"/></a></h1>
	<div class="nav">
		<ul class="clear_fix">
			<li><a href="#demo2" id="demo2Btn">스마트플랫<span class="inline-block">소개</span></a></li>
			<li><a href="#demo3" id="demo3Btn">스마트<span class="inline-block">플랫?</span></a></li>
            <li class="relative">
                <img src="${contextPath}/resources/img/intro-slide/lamp.gif" alt="전구" class="img-animate"/>
                <a href="#demo6" id="demo6Btn">다양한<span class="inline-block marL">분야와</span><span class="inline-block marL">디자인</span></a></li>
			<li><a href="#demo4" id="demo4Btn">디스플레이<span class="inline-block">구성도</span></a></li>
			<li><a href="#demo5" id="demo5Btn">특화된 <span class="inline-block">기능</span></a></li>
		</ul>
	</div>
    <span class="icon-inquiry button" id="inquiry"><img src="${contextPath}/resources/img/inquiry.png" alt="친절한 견적 및 문의"/></span>
    <span class="icon-property button" id="property"><img src="${contextPath}/resources/img/property-icon.png" alt="부동산 사무실을 위한 디지털전자게시판 출시! 자세히"/></span>
    <span class="icon-free-design button"><img src="${contextPath}/resources/img/free-design.png" alt="디지털 메뉴판을 무료로 디자인 해드립니다!!!"/></span>
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

<div id="popup-property">
    <div class="top-area">
        <img src="${contextPath}/resources/img/property-topcont.jpg" alt="경쟁력이 팍팍! 공인중계사 사무실에 특화된 디지털 전자 게시판 스마트플랫 스마트플랫이 잠자는 TV를 멋진 디지털게시판으로 만들어드립니다. "/>
        <a href="javascript:popupClose()" class="property-close"><img src="${contextPath}/resources/img/property-close.png" alt="닫기"/></a>
    </div>
    <div class="bottom-area clear_fix">
        <div class="inquiry txt">
            <h1>상담 및<br/>문의하기</h1>
            <h2>TV의 놀라운 변신!!</h2>
            <p>
                장비구입이 부담스럽다구요?<br/>
                <span class="colorR">HDMI단자가 있는 TV만 있으면 OK!</span><br/>
                현재 <b>사용하는 TV에 스마트플랫만</b> 장착하셔도<br/>
                멋진 디지털 전자 게시판이 됩니다.
            </p>
        </div>
        <div class="inquiry form">
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
                <div class="btn-area clear_fix">
                    <input type="button" value="전송" class="btn-black submit"/>
                    <a href="javascript:popupClose();" class="btn-gray">취소</a>
                </div>
            </form>
        </div>
    </div>
</div>