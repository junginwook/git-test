/**
 * Created by jm1218 on 15. 3. 9.
 */
(function($){
	//슬라이드 지연시간
	var slideDelayInMillis = 3000;

	//클릭시 이미지 변경.
	var changeImg = function(id){
		$('#demo5').animatescroll({
			scrollSpeed : 500,
			padding:100,
			onScrollEnd : function(){
				var target = $('.'+id);
				$(".portfolio-info").fadeOut();
				target.fadeIn();
				var targetHeight = target.height();
				$('.portfolio').css('height', targetHeight+"px");
				target.height(targetHeight+"px");
			}});

		$("#owl-slider").owlCarousel({
			autoplay:1,
			nav:false,
			items:1,
			dots:false,
			loop:true
		});
	};

	var thumbs = $('li', '.thumb-area');
	$.each(thumbs, function (index, elem) {
		$(elem).on('click', function (e) {
			changeImg('info' + (index + 1));
			e.preventDefault();
		});
	});

	//자랑하기.
	var defaultList = String() +
		'강정선(이화여대 작곡) : 이스트만\n' +
		'고유미(연세대 성악) : 맨하탄 음대\n' +
		'곽소정(부산대 피아노) : 인디애나 음대\n' +
		'김문경(이화여대 피아노) : 뉴욕 메네스\n' +
		'박지은(연세대 성악) : 피바디 음대\n' +
		'이귀엽(연세대 오보에) : 피바디 음대\n' +
		'이영기(플룻) : 신시네티 음대\n' +
		'송현미(계명대 바이올린) : 신시네티 음\n' +
		'최성락(서울대 경영) : 뉴욕대 뮤직비즈니스\n' +
		'하재현(단국대 첼로) : 인디애나 음대\n' +
		'홍승연(이화여대 성악) : 템플음대';

	var setDefaultList = function () {
		$('.txt-input textarea').val(defaultList);
	};
	
	setDefaultList();
	var makeLists = function (texts) {
		var result = '<ul>';
		$.each(texts, function (key, value) {
			result += '<li>' + value + '</li>';
		});
		result += '</ul>';
		return result;
	};
	$('.txt-input button').on('click', function () {
		var texts = $('.txt-input textarea').val().split(/\n/g);
		var container = $('.txt-view ul');
		container.replaceWith(makeLists(texts));
	}).trigger('click');

	//병원 이미지슬라이드
	setInterval(function () {
		var banner = $("#slide-img").find(".slide-banner");
		var first = banner.find("img").first();
		banner.animate({left:"-640"}, 700, function(){
			banner.css("left","-320px").append(first);
		});
	}, slideDelayInMillis);
	
	//병원 시계
	var getTodayInSeconds = function () {
		var now = new Date();
		return now.getHours() * 60 * 60 + now.getMinutes() * 60 + now.getSeconds();
	};
	//reference link ==> http://flipclockjs.com/
	var clock = $('.clockWidget', '.clock').FlipClock({
// ... your options here
	});
	clock.setTime(getTodayInSeconds());
	
	//카페 슬라이드 left
	setInterval(function () {
		var slideLeft = $("#slide").find(".img-list");
		var first= slideLeft.find("li").first();

		slideLeft.animate({left:"-310"}, 600, function(){
			slideLeft.css("left","-155px").append(first);
		});
	}, slideDelayInMillis);

	//카페 슬라이드 top
	setInterval(function () {
		var slideTop = $("#slide2").find(".img-list");
		var first = slideTop.find("li").first();
		slideTop.animate({top:"0"}, 600, function(){
			slideTop.css("top","-192px").append(first);
		});
	}, slideDelayInMillis);

	//날씨 animation
	var weatherList = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind", "fog"];
	var icons = new Skycons({"color":"gray"});

	icons.set(weatherList[0], weatherList[2]);
	icons.play();

})(jQuery);