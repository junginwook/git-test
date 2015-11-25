/**
 * Created by changjo on 15. 11. 24.
 */
/**
 * Created by parkchangjo on 2015. 7. 3..
 * Login Script File
 */
'use strict';
var AdminLoginUtil = (function(){

    /**
     * admin login
     */
    function loginSubmit() {
        $('#loginForm').ajaxForm({
            beforeSerialize: function() {
                var id = $('.id');
                var password = $('.password');
                id.focus();
                if (!CommonUtils.requiredCheckOne(id))        return false;
                if (!CommonUtils.requiredCheckOne(password))  return false;
                //if (!UserUtils.passwordLengthCheck(password)) return false;
                var keepIdYn = $('#keepIdYn');
                if (keepIdYn.prop('checked') == true) {
                    keepIdYn.val('on');
                } else keepIdYn.val('off');
                $.blockUI();
            },
            dateType: 'json',
            type: 'post',
            success: HttpUtils.responseSuccess,
            error: HttpUtils.responseError
        });
    }

    /**
     * logout
     * @returns {boolean}
     */
    function logoutSubmit() {
        $('.logout').on('click', function() {
            var isAdmin = $(this).data('admin');
            if (!confirm('로그아웃 하시겠습니까?')) return false;
            $.blockUI();
            $.ajax({
                data: {isAdmin: isAdmin},
                dataType: 'json',
                type: 'post',
                url: contextPath +'/loginRest/logoutSubmit',
                success: HttpUtils.responseSuccess,
                error: HttpUtils.responseError
            });
        });
        return false;
    }

    return{
        loginSubmit : loginSubmit
        , logoutSubmit : logoutSubmit
    }

})();