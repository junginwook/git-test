/**
 * Created by changjo on 15. 11. 26.
 */
$(function(){
    var contentVal = $(".content").val();
    contentVal = CommonUtils.stripHTMLtag(CommonUtils.pToN(CommonUtils.brToN(contentVal)));
    $(".content").val(contentVal);
});