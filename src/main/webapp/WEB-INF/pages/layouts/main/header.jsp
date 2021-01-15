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
    //비대면 서비스 바우처 페이지로 이동하기전에 클라이언트의 
    //환경이 모바일인지 웹인지 파악한 후에 다른 url을 뿌려준다  
    function checkClient(){
    	var filter = "win16|win32|win64|mac|macintel";

			 if ( navigator.platform )
			 { 
			 
				 if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 )
				 { 
					 //mobile
					 window.open('/mboucher');
					  //console.log("모바일");
				 } 
				else
				 { 
				 	//pc 
				 	window.open('/boucher');
				 	console.log("웹");
				  }
			 	
			 }
    
    }
    
</script>
<div class="area">
    <h1 class="logo">
        <c:if test="${currentPage == 'main'}">
            <a href="#demo1" id="demo1Btn"><img src="${contextPath}/resources/img/top_logo.png" alt="스마트플랫"/></a>
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
                <li><a href="#demo6" id="demo2Btn" onclick="checkClient()">비대면 <span class="inline-block">서비스</span> <span class="inline-block">바우처</span></a></li>
                
            </ul>
        </c:if>
    </div>
</div>

<script>
    function banner_hide(id) {
        $("#"+id).css('display','none');
    }
    function banner_hidden(id) {
        $("#"+id).css('visibility','hidden');
    }
</script>
<span class="icon-rental-banner" id="rental_banner">
    <a target="_blank" href="https://blog.naver.com/digigroove/221526343277">
        <img class="banner" src="${contextPath}/resources/img/rental_banner.png"/>
    </a>
    <img class="rental_banner_close" onclick="banner_hide('rental_banner')"; src="${contextPath}/resources/img/close_black.png"/>
</span>
<span class="icon-rental-business" id="rental_business_banner">
    <img class="banner" src="${contextPath}/resources/img/rental_business_banner.png"/>
    <img class="rental_banner_business_close" onclick="banner_hide('rental_business_banner')"; src="${contextPath}/resources/img/close_blue.png"/>
</span>
<span class="icon-inquiry button" id="inquiry">
    <img src="${contextPath}/resources/img/inquiry.png" alt="친절한 견적 및 문의"/>
</span>
<span class="vari button" style="text-align: center">
    <a target="_blank" href="http://blog.naver.com/PostThumbnailList.nhn?blogId=digigroove&amp;categoryNo=39&amp;skinType=&amp;skinId=&amp;from=menu">
        <img src="${contextPath}/resources/img/events/vari2.png" alt="다양한디자인바로가기" />
    </a>

</span>
<!-- Talk Talk Banner Script start -->
<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
<span id="talk_banner_area">
    <img style="position: absolute; top: 5px; right: 5px; z-index: 1;" onclick="banner_hidden('talk_banner_area')" src="${contextPath}/resources/img/close_black.png"/>
    <div class="talk_banner_div" data-id="19506" style="text-align:center;"></div>
</span>
<!-- Talk Talk Banner Script end -->

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
