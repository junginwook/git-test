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
  
</script>
<body>
		<div class="Mwrap">
<!-- 	섹션 0 -->
	
	<div class="Mocontainer">
	
	<div class="MfullSection">
		       <img src="${contextPath}/resources/img/boucher/top_image0.jpg" width="100%">    
	</div>
	
	
<!-- 			섹션 1 -->
		   
<div class="MfullSection">
    
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	   
	  <ol class="carousel-indicators">
	  
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${contextPath}/resources/img/boucher/m1.jpg" class="d-block " alt="..." width="100%">
	    </div>
	    <div class="carousel-item">
	      <img src="${contextPath}/resources/img/boucher/m2.jpg" class="d-block "  alt="..." width="100%">
	    </div>
	    <div class="carousel-item">
	      <img src="${contextPath}/resources/img/boucher/m3.jpg" class="d-block "  alt="..." width="100%">
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
		 
		 <!--           섹션 2 -->
		   
<div class="MfullSection" style="margin-top:15px; text-align: center; width: 100%"  >
                  <button onClick=location.href='#mform'>문의하기</button>
                  
            </div>
         
         <div class="MfullSection" style="margin-top: 20px">
            <img src="${contextPath}/resources/img/boucher/mobile1.jpg" width="100%"  alt="...">
         </div>
         
         <div class="MfullSection" style="margin-top: 20px">
            <img src="${contextPath}/resources/img/boucher/mobile2.jpg" width="100%"  alt="...">
         </div>
			
			
			
			
			
<!-- 				섹션 3 -->
           <div class="MfullSection Mheader" width="100%">바로 사용할 수 있는 수백 종의 디자인</div>

			<div class="MfullSection Mcontent" width="100%">
				<ul class="Mul">
					<li class="Mtitle_1">“미리 준비된 템플릿을 수정만 해서 바로 사용”</li>
					<li class="Mcontent_1">스마트플랫 제작 툴로 미리 만들어진 다양한 종류의 템플릿을 사용하여 글씨,</li>
					<li class="Mcontent_1">배경화면, 슬라이드 이미지, 동영상 등을 수정, 등록하여 즉시 재생하십시오.</li>
					<li class="Mcontent_1">템플릿을 다운로드하는 순간 바로 전문 디자이너이십니다.</li>
				</ul>
			</div>

<!-- 			 <--섹션 4 -->
			<div class="MfullSection">
				<img src="${contextPath}/resources/img/boucher/mo3.jpg" width="100%">
			</div>
<!-- 		<--	섹션 5 -->
             <div class="MfullSection Mmain" width="100%">
				<span>“스마트플랫은 이미 수천 개의 업체에서 <br>사용 중인대한민국 1등 디지털 사이니지 <br>솔루션입니다” </span>
			</div>
			
<!-- 		    섹션 6 -->
			<div class="MfullSection" >
				<img src="${contextPath}/resources/img/boucher/mo4.jpg" width="100%">
			</div>
			
</div><!-- container -->
<!-- 			섹션 7 -->
			<div class="MfullSection Mfinal">
				<div class="Mfinal_box">
				   <div class="Mfbox" id="mform">
					<div class="Mf1">비대면 바우처 지원</div>
					<div class="Mf2">스마트플랫 구입 문의</div>
				   </div>	
					<form id=applicanForm class="applicanForm">
					<div class="w_f3">
					
					<input type="hidden" name="title" value="비대면 서비스 바우처" class="fas" ></input>
					
					<div class="Mf3">
						<input type="text"  name="email" class="fas" placeholder="&#xf0e0 &nbsp이메일"></input>
					</div>
					<div class="Mf4">
						<input type="text" name="storeName" class="fas" placeholder="&#xf1ad &nbsp회사/업체명"></input>
					</div>
					<div class="Mf5">
						<input type="text" name="name" class="fas" placeholder="&#xf007 &nbsp이름"></input>
					</div>
					<div class="Mf6">
						<input type="text"  name="phone"  class="fas" placeholder="&#xf098 &nbsp전화번호"  onkeyup="this.value=this.value.replace(/[^0-9|-]/g,'')"></input>
					</div>
					<div class="Mf7" >
						 <div><input class="fas submit"   type="submit"  value="문의사항 전송"></div>
					</div>
					
					</div>
					</form>
					

				</div>
			   </div>
				   <div class="MfullSection">
					     <img src="${contextPath}/resources/img/boucher/footer.jpg" width="100%">
				</div>
			      
			
		
			</div>
			
		
</body>

</html>