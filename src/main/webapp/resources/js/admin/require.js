/**
 * Created by changjo on 15. 11. 25.
 */
"use strict";
var RequireUtils = (function(){

    var self;
    var init = function(){
        self = this;
    };

    var modifyRequire = function(requireKey){
        $("#requireUpdateForm").ajaxSubmit({
            type : "POST",
            dataType : "json",
            url : contextPath + "/adminRest/requireRest/modifyRequire",
            success : function(data){
                alert(data.message);
                if(data.code=="Success"){
                    location.href = contextPath + "/admin/require/requireDetail?requireKey=" + requireKey;
                }
            },
            error : function(data){
                alert(data.message);
            }
        });
    };

    var registReple = function(requireKey){
        var repleContent = $(".reple-content").val();
        var reple = "";
        if(repleContent == ""){
            alert("내용을 입력 해 주세요.");
        }else{
            reple = repleContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
            $(".reple").val(reple);
            $("#repleRegistForm").ajaxSubmit({
                type : "POST",
                dataType : "json",
                url : contextPath + "/adminRest/repleRest/registReple",
                success : function(data){
                    alert(data.message);
                    if(data.code=="Success"){
                        location.href = contextPath + "/admin/require/requireDetail?requireKey=" + requireKey;
                    }
                },
                error : function(data){
                    alert(data.message);
                }
            });
        }
    };

    var registRequireForm = function(){
        location.href = contextPath + "/admin/require/requireRegistForm";
    };

    var registRequire = function(){
        //여기 할차례
    };

    return{
        init : init
        , modifyRequire : modifyRequire
        , registReple : registReple
        , registRequire : registRequire
    }

})();