$(function() {
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
    });

    $('.popup-wrap').click(function(){
        var height =  Math.max(0, (($(window).height() - ($(window).height()/2) - $(this).outerHeight()) /2) );
        $('.theme-popup').animate({'opacity':0,'top':height+200},200,function(){
            $('.popup-wrap').hide();
        });
    });

});
