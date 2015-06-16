$(function() {
    //$("#btnTheme1").click(function(){
    //    var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
    //    var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
    //    var windowWid = $(window).width();
    //
    //    if(width<0){ width = 0;}
    //    if(windowWid<767){
    //        width = 0;
    //    }
    //    $('#PopupTheme1').bPopup({
    //        easing: 'easeOutBack',
    //        speed: 500,
    //        transition: 'slideUp',
    //        closeClass:'popClose',
    //        positionStyle: 'fixed',
    //        follow: [false, false],
    //        position: [width, height]
    //    });
    //}); //다양한디자인팝업1
    //$("#btnTheme2").click(function(){
    //    var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
    //    var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
    //    var windowWid = $(window).width();
    //
    //    if(width<0){ width = 0;}
    //    if(windowWid<767){
    //        width = 0;
    //    }
    //    $('#PopupTheme2').bPopup({
    //        easing: 'easeOutBack',
    //        speed: 500,
    //        transition: 'slideUp',
    //        closeClass:'popClose',
    //        positionStyle: 'fixed',
    //        follow: [false, false],
    //        position: [width, height]
    //    });
    //}); //다양한디자인팝업2
    //$("#btnTheme3").click(function(){
    //    var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
    //    var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
    //    var windowWid = $(window).width();
    //
    //    if(width<0){ width = 0;}
    //    if(windowWid<767){
    //        width = 0;
    //    }
    //    $('#PopupTheme3').bPopup({
    //        easing: 'easeOutBack',
    //        speed: 500,
    //        transition: 'slideUp',
    //        closeClass:'popClose',
    //        positionStyle: 'fixed',
    //        follow: [false, false],
    //        position: [width, height]
    //    });
    //}); //다양한디자인팝업3
    //$("#btnTheme4").click(function(){
    //    var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
    //    var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
    //    var windowWid = $(window).width();
    //
    //    if(width<0){ width = 0;}
    //    if(windowWid<767){
    //        width = 0;
    //    }
    //    $('#PopupTheme4').bPopup({
    //        easing: 'easeOutBack',
    //        speed: 500,
    //        transition: 'slideUp',
    //        closeClass:'popClose',
    //        positionStyle: 'fixed',
    //        follow: [false, false],
    //        position: [width, height]
    //    });
    //}); //다양한디자인팝업4
    //$("#btnTheme5").click(function(){
    //    var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
    //    var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
    //    var windowWid = $(window).width();
    //
    //    if(width<0){ width = 0;}
    //    if(windowWid<767){
    //        width = 0;
    //    }
    //    $('#PopupTheme5').bPopup({
    //        easing: 'easeOutBack',
    //        speed: 500,
    //        transition: 'slideUp',
    //        closeClass:'popClose',
    //        positionStyle: 'fixed',
    //        follow: [false, false],
    //        position: [width, height]
    //    });
    //}); //다양한디자인팝업5
    //$("#btnTheme6").click(function(){
    //    var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
    //    var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
    //    var windowWid = $(window).width();
    //
    //    if(width<0){ width = 0;}
    //    if(windowWid<767){
    //        width = 0;
    //    }
    //    $('#PopupTheme6').bPopup({
    //        easing: 'easeOutBack',
    //        speed: 500,
    //        transition: 'slideUp',
    //        closeClass:'popClose',
    //        positionStyle: 'fixed',
    //        follow: [false, false],
    //        position: [width, height]
    //    });
    //}); //다양한디자인팝업6

    $(".btn-click").click(function(){
        var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
        var width =  $(window).width() - ($(window).width())/2 - ($('.theme-popup .popup-box').outerWidth())/2;
        var windowWid = $(window).width();

        if(width<0){ width = 0;}
        if(windowWid<767){
            width = 0;
        }

        var idNumber = $(this).next();
        idNumber.show();
        idNumber.find('.theme-popup').css({'left':width,'top':height+200});
        idNumber.find('.theme-popup').animate({'opacity':1,'top':height},400,function(){

        });
    }); //다양한디자인팝업7

    $('.popup-wrap').click(function(){
        var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
        $('.theme-popup').animate({'opacity':0,'top':height+200},200,function(){
            $('.popup-wrap').hide();
        });
    });

});
