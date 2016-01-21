/**
 * Created by changjo on 15. 11. 26.
 */
var UserUtils = (function(){

    var self;
    var init = function(){
        self = this;
    };

    var modifyUser = function(){
        var oldPassword = $(".oldPassword").val();
        var newPassword = $(".newPassword").val();
        var checkPassword = $(".checkPassword").val();

        if(oldPassword == ""){
            alert("비밀번호를 입력하세요.");
        }else{
            if(newPassword == ""){
                alert("새로운 비밀번호를 입력하세요.");
            }else{
                if(checkPassword == ""){
                    alert("비밀번호 확인을 입력하세요.");
                }else{
                    if(newPassword != checkPassword){
                        alert("비밀번호 확인란이 불일치합니다.");
                    }else{
                        var conf = confirm("비밀번호를 변경하시겠습니까?");
                        if(conf){
                            $("#userUpdateForm").ajaxSubmit({
                                type : "POST",
                                dataType : "json",
                                url : contextPath + "/adminRest/userRest/modifyUser",
                                success : function(data){
                                    alert(data.message);
                                    if(data.code=="Success"){
                                        location.href = contextPath + "/admin/user/userDetail";
                                    }
                                },
                                error : function(data){
                                    alert(data.message);
                                }
                            });
                        }
                    }
                }
            }
        }



    };

    return{
        init : init
        , modifyUser : modifyUser
    }

})();