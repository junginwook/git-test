<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style type="text/css">
@font-face {
	font-family: "NanumGothic";
	src: url(/fonts/NanumBarunGothicR.ttf) format('truetype');
}
</style>

<script type="text/javascript">
    $(function() {


        $('.submit').on('click', function() {

            var formObj = $(this).closest('form');
            
            if (!formObj.find("input[name='email']").val()){
                alert("이메일을 입력하세요");
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
                        location.reload();
                    }
                     
                },
                error : function(data){
                $.unblockUI();
                    alert(data.message);
                       location.reload();                  
                  
                }
            });
        });


    });
    
    checkClient();
    
    // https://smartflat.co.kr/boucher 주소로 들어왔을 때 
    //모바일일 경우 https://smartflat.co.kr/mboucher로 리다이렉트 시켜준다 
    function checkClient(){
    	var filter = "win16|win32|win64|mac|macintel";

			 if ( navigator.platform )
			 { 
			 
				 if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 )
				 { 
					 //mobile
					  window.location.href = '/mboucher';
					  //console.log("리다이렉트 모바일");
				 } 
				else
				 { 
				 	//pc 
				 	console.log("리다이렉트 웹");
				  }
			 	
			 }
    
    }
  
</script>

<body>
	<div class="wrap">
<!-- 	섹션 0 -->
	
	<div class="container1">
	
	<div class="fullSection">
		       <img src="${contextPath}/resources/img/boucher/0.jpg">    
	</div>
	
	
<!-- 			섹션 1 -->
		   
<div class="fullSection">
    <div class="banner">
    <a href="#" onclick="window.open('https://pf.kakao.com/_FMmRxl/chat', 'talktalk', 'scrollbars=1, resizable=1, width=486, height=745')"><img src="${contextPath}/resources/img/boucher/livebanner.png" ></a>
    </div>
	<div id="carouselExampleIndicators"  style="width: 1920px;" class="carousel slide" data-ride="carousel">
	   
	  <ol class="carousel-indicators">
	  
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${contextPath}/resources/img/boucher/1.jpg" class="d-block "  alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="${contextPath}/resources/img/boucher/2.jpg" class="d-block "  alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="${contextPath}/resources/img/boucher/3.jpg" class="d-block "  alt="...">
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
</div>
		   
<!-- 		    섹션 2 -->
			<div class="fullSection" style="margin-top: 20px">
				<img src="${contextPath}/resources/img/boucher/11.jpg" usemap="#map01">
				<map name="map01" id="map01">
				     <area shape="rect" coords="838,27,1076,81" href="#mform" id="mformBtn">
				
				</map>
			</div>
			

<!-- 				섹션 3 -->
			<div class="fullSection header">바로 사용할 수 있는 수백 종의 디자인</div>

			<div class="fullSection content">
				<ul>
					<li class="title_1">“미리 준비된 템플릿을 수정만 해서 바로 사용”</li>
					<li class="content_1">스마트플랫 제작 툴로 미리 만들어진 다양한 종류의 템플릿을 사용하여 글씨,</li>
					<li class="content_1">배경화면, 슬라이드 이미지, 동영상 등을 수정, 등록하여 즉시 재생하십시오.</li>
					<li class="content_1">템플릿을 다운로드하는 순간 바로 전문 디자이너이십니다.</li>
				</ul>
			</div>
<!-- 				섹션 4 -->
			<div class="fullSection">
				<img src="${contextPath}/resources/img/boucher/003.jpg">
			</div>
<!-- 			섹션 5 -->
			<div class="fullSection main">
				<span>“스마트플랫은 이미 수천 개의 업체에서 사용 중인<br>대한민국 1등 디지털 사이니지 솔루션입니다” </span>
			</div>
<!-- 		    섹션 6 -->
			<div class="fullSection">
				<img src="${contextPath}/resources/img/boucher/004.jpg">
			</div>
			
<!-- 			섹션 7 -->
			<div class="fullSection final">
				<div class="final_box" style="width:1920px;">
				  
				   <div class="fbox" id="mform">
					<div class="f1">비대면 바우처 지원</div>
					<div class="f2">스마트플랫 구입 문의</div>
				   </div>	
					<form id=applicanForm class="applicanForm">
						<div class="w_f3">
						
						<input type="hidden" name="title" value="비대면 서비스 바우처" class="fas" ></input>
						
						<div class="f3">
							<input type="text" class="fas"  name="email" placeholder="&#xf0e0 &nbsp이메일"></input>
						</div>
						<div class="f4">
							<input type="text" class="fas"  name="storeName"  placeholder="&#xf1ad &nbsp회사/업체명"></input>
						</div>
						<div class="f5">
							<input type="text" class="fas" name="name" placeholder="&#xf007 &nbsp이름"></input>
						</div>
						<div class="f6">
							<input type="text" class="fas" name="phone" placeholder="&#xf098 &nbsp전화번호"  onkeyup="this.value=this.value.replace(/[^0-9|-]/g,'')"></input>
						</div>
						<div class="f7">
							 <div><input class="submit" type="submit" value="문의사항 전송"></div>
						</div>
						
					
						<div class="f8">
						     <img src="${contextPath}/resources/img/boucher/footer.jpg" width="1920px" height="auto">
						</div>
				      
	
					  </div>
			</form>
				</div>
			   </div>
			   
			   
					
			
			
			    
			      
		
</div>
			</div>
			
		
			
</body>

</html>