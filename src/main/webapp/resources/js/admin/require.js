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
        var content = $(".content").val();
        content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
        $(".content").val(content);
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
        if(repleContent == ""){
            alert("내용을 입력 해 주세요.");
        }else{
            oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
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
        oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
        $("#requireRegistForm").ajaxSubmit({
            type : "POST",
            dataType : "json",
            url : contextPath + "/adminRest/requireRest/registRequireByAdmin",
            success : function(data){
                alert(data.message);
                if(data.code=="Success"){
                    location.href = contextPath + "/admin/require/requireDetail?requireKey=" + data.key;
                }
            },
            error : function(data){
                alert(data.message);
            }
        });
    };

    var removeReple = function(repleKey, requireKey){
        var conf = confirm("내 기록을 삭제하시겠습니까?");
        if(conf){
            $.ajax({
                data : {
                    repleKey : repleKey
                },
                type : "POST",
                dataType : "json",
                url : contextPath + "/adminRest/repleRest/removeReple",
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

    var removeRequire = function(requireKey){
        $("#dialog-confirm").dialog({
            resizable : false,
            height : 140,
            modal : true,
            buttons : {
                "삭제" : function(){
                    $.ajax({
                        data : {
                            requireKey : requireKey
                        },
                        type : "POST",
                        dataType : "json",
                        url : contextPath + "/adminRest/requireRest/removeRequire",
                        success : function(data){
                            alert(data.message);
                            if(data.code=="Success"){
                                location.href = contextPath + "/admin/require/requireList";
                            }
                        },
                        error : function(data){
                            alert(data.message);
                        }
                    });
                }, "취소" : function(){
                    $(this).dialog("close");
                }
            }
        });
        //if(conf){
        //    $.ajax({
        //        data : {
        //            requireKey : requireKey
        //        },
        //        type : "POST",
        //        dataType : "json",
        //        url : contextPath + "/adminRest/requireRest/removeRequire",
        //        success : function(data){
        //            alert(data.message);
        //            if(data.code=="Success"){
        //                location.href = contextPath + "/admin/require/requireList";
        //            }
        //        },
        //        error : function(data){
        //            alert(data.message);
        //        }
        //    });
        //}
    };

    return{
        init : init
        , modifyRequire : modifyRequire
        , removeRequire : removeRequire
        , registReple : registReple
        , registRequire : registRequire
        , registRequireForm : registRequireForm
        , removeReple : removeReple
    }

})();