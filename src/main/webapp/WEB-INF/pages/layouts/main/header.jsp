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

//        var wWidth = 0;
//        var w = 0;
//        $(window).resize(function(){
//            resizeEvent();
//        });
//        function resizeEvent(){
//            wWidth = $(window).width();
//            if(wWidth < 860){
//                w = (860-wWidth)/2;
//                $(".ytArea").css({
//                    width : 640-w,
//                    height : 360-w
//                });
//                $(".eventVideo").attr("width", 640-w);
//                console.log(640-w);
//            }
//        }
//        resizeEvent();

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

        $("#newTheme").click(function(){
            $(".newThemeModal").bPopup({
                easing : "easeOutBack",
                speed : 500,
                transition : "slideDown",
                positionStyle : "fixed",
                onOpen : function(){
                    setTimeout(function(){
                        $(".newThemeModal").css({position:"absolute"});
                    }, 500);
                }
            });
        });

	$('.submit').on('click', function() {
        var formObj = $(this).closest('form');
        if (!formObj.find("input[name='title']").val()){
            alert("제목을 입력하세요");
            return false;
        }
        if (!formObj.find("input[name='name']").val()){
            alert("이름을 입력하세요");
            return false;
        }
        if (!formObj.find("input[name='phone']").val()){
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
        var content = formObj.find('.content').val();
        content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
        formObj.find("input[name='content']").val(content);

        $.blockUI();
        $("#applicanForm").ajaxSubmit({
            type : "POST",
            dataType : "json",
            url : contextPath + "/adminRest/requireRest/registRequire",
            success : function(data){
                alert(data.message);
                if(data.code=="Success"){
                    $.unblockUI();
                        formObj.find("input[name='title']").val('');
                        formObj.find("input[name='storeName']").val('');
                        formObj.find("input[name='name']").val('');
                        formObj.find("input[name='phone']").val('');
                        formObj.find("input[name='email']").val('');
                        formObj.find('.content').val('');
                        popupClose();
                    location.href = contextPath;
                }
            },
            error : function(data){
                alert(data.message);
            }
        });
    });


    });
	function popupClose() {
        $('#popup').bPopup().close();
        $('#popup-property').bPopup().close();
	}
</script>
<div class="area">

	<h1 class="logo">
        <c:if test="${currentPage == 'main'}">
            <a href="#demo1" id="demo1Btn"><img src="${contextPath}/resources/img/logo.png" alt="스마트플랫"/></a>
        </c:if>
        <c:if test="${currentPage == 'pro'}">
            <a href="http://www.smartflat.co.kr"><img src="${contextPath}/resources/img/logo.png" alt="스마트플랫"/></a>
        </c:if>
    </h1>
	<div class="nav">
        <c:if test="${currentPage == 'main'}">
            <ul class="clear_fix">
                <li><a href="#demo2" id="demo2Btn">스마트플랫<span class="inline-block">소개</span></a></li>
                <li><a href="#demo3" id="demo3Btn">스마트<span class="inline-block">플랫?</span></a></li>
                <li class="relative">
                    <img src="${contextPath}/resources/img/intro-slide/lamp.gif" alt="전구" class="img-animate"/>
                    <a href="#demo6" id="demo6Btn">다양한<span class="inline-block marL">분야와</span><span class="inline-block marL">디자인</span></a></li>
                <li><a href="#demo4" id="demo4Btn">디스플레이<span class="inline-block">구성도</span></a></li>
                <li><a href="#demo5" id="demo5Btn">특화된 <span class="inline-block">기능</span></a></li>
            </ul>
        </c:if>
	</div>
    <span class="icon-inquiry button" id="inquiry"><img src="${contextPath}/resources/img/inquiry.png" alt="친절한 견적 및 문의"/></span>
    <span class="vari button">
        <a target="_blank" href="http://blog.naver.com/PostThumbnailList.nhn?blogId=digigroove&amp;categoryNo=39&amp;skinType=&amp;skinId=&amp;from=menu">
            <img src="${contextPath}/resources/img/events/vari2.png" alt="다양한디자인바로가기" />
        </a>
		<!-- Talk Talk Banner Script start -->
		<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
		<div class="talk_banner_div" data-id="19506" style="text-align:center;"></div>
		<!-- Talk Talk Banner Script end -->
    </span>
</div>

<%--<div class="newThemeModal">--%>
    <%--<img src="${contextPath}/resources/img/events/newThemeBackground.jpg" alt="" />--%>
    <%--<div class="ytArea">--%>
        <%--<iframe class="eventVideo" src="https://www.youtube.com/embed/9WsemmPpQus?&amp;controls=0&amp;showinfo=0&amp;autoplay=1&amp;loop=1&amp;playlist=9WsemmPpQus&wmode=opaque" frameborder="0" allowfullscreen></iframe>--%>
    <%--</div>--%>
<%--</div>--%>

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
		<form id="applicanForm" class="applicanForm">
			<table>
				<colgroup>
					<col width="18%"/>
					<col width="82%"/>
				</colgroup>
				<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" placeholder="제목"/></td>
				</tr>
                <tr>
                    <th>업체명</th>
                    <td><input type="text" name="storeName" placeholder="업체명" /></td>
                </tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" placeholder="이름"/></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" name="phone" placeholder="연락처"/></td>
				</tr>
				<tr>
					<th>이메일<span class="inline-block">주소</span></th>
					<td><input type="email" name="email" placeholder="이메일주소"/></td>
				</tr>
				<tr>
					<th>의뢰<span class="inline-block">내용</span></th>
					<td>
                        <textarea  class="content ui-input-text ui-shadow-inset ui-body-inherit ui-corner-all ui-textinput-autogrow" placeholder="의뢰내용" style="height: 95px;"></textarea>
                        <input type="hidden" name="content" value="" />
                    </td>

				</tr>
				</tbody>
			</table>
			<div class="btn-area">
				<input type="submit" value="전송" class="btn-blue submit"/>
				<a href="javascript:popupClose();" class="btn-gray">취소</a>
			</div>
		</form>
	</div>
</div>
