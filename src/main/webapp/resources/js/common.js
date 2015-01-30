/**
 * Created by yusul on 15. 1. 30..
 */

/**
 * 공통 유틸
 */
var CommonUtils = (function() {

    function stripHTMLTag (string) {
        return string.replace(/[<][^>]*[>]/gi, '');
    }

    function nToBr(string) {
        return string.replace(/[\n|\r]/g, '<br/>');
    }

    function isEmpty(str) {
        if (str == null || str == undefined || str == '' || str == 'undefined') {
            return true;
        }
        return false;
    }

    /** 필수 값 체크 (전체) */
    function requiredCheckAll() {
        var isRequiredCheck = true;
        $('.required').each(function() {
            if (!$(this).is(':hidden') && isEmpty($(this).val())) {
                alert('[' + $(this).data('check-name') + '] 란을 입력해 주세요.');
                $(this).focus();
                isRequiredCheck = false;
                return false;
            }
        });
        return isRequiredCheck;
    }

    /** 메일주소 체크 */
    function mailCheck() {
        var isMailCheck = true;
        $('.mailChk').each(function() {
            var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
            if (regex.test($(this).val()) === false) {
                alert('잘못된 이메일 형식 입니다.');
                $(this).focus();
                isMailCheck = false;
            }
        });
        return isMailCheck;
    }



    return {
        stripHTMLTag : stripHTMLTag
        , nToBr : nToBr
        , isEmpty : isEmpty
        , requiredCheckAll : requiredCheckAll
        , mailCheck : mailCheck
    }
})();
