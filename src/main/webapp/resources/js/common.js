'use strict';
var console = window.console || {log:function(){}};
var HttpUtils = (function() {

	/** Ajax File Upload */
	function ajaxFileUpload(formObj) {
		// HTML5 Browsers
		console.log(formObj.attr('action'));

		if (window.FormData !== undefined && !CommonUtils.detectIE()) {
			$.blockUI();
			$.ajax({
				type        : 'POST',
				url         : formObj.attr('action'),
				data        : new FormData(formObj[0]),
				mimeType    : 'multipart/form-data',
				cache       : false,
				processData : false,
				contentType : false,
				success     : responseSuccess,
				error       : responseError
			});
		}
		// IE Browser
		else {
			$.blockUI();
			var iframeId = 'unique' + (new Date().getTime());
			var iframe = $('<iframe src="javascript:false;" name="' + iframeId + '" />');
			iframe.hide();
			formObj.attr('target', iframeId);
			iframe.appendTo('body');
			iframe.load(function() {
				var doc = getDoc(iframe[0]);
				var docRoot = doc.body ? doc.body : doc.documentElement;
				responseSuccess(docRoot.innerText);
			});
			formObj.submit();
		}
	}

	/** Ajax Submit Data */
	function ajaxSubmitData(dataObj, options) {
		$.blockUI();
		$.ajax({
			data    : JSON.stringify(dataObj),
			url     : contextPath + options.url,
			type    : 'POST' || options.type,
			success : responseSuccess || options.success,
			error   : responseError   || options.error
		});
		$.unblockUI();
	}

	function responseSuccess(r) {
		$.unblockUI();
		if (typeof r == 'string')            r = JSON.parse(r);
		//if (!CommonUtils.isEmpty(r.message)) alert(r.message);
		if (!CommonUtils.isEmpty(r.url))     location.href = contextPath + r.url;
	}

	function responseError() {
		$.unblockUI();
		alert('처리가 실패하였습니다.');
	}

	function getDoc(frame) {
		var doc = null;
		// IE8 cascading access check
		try {
			if (frame.contentWindow) doc = frame.contentWindow.document;
		} catch(err) {}
		// successful getting content
		if (doc) return doc;
		try { // simply checking may throw in ie8 under ssl or mismatched protocol
			doc = frame.contentDocument ? frame.contentDocument : frame.document;
		} catch(err) {
			// last attempt
			doc = frame.document;
		}
		return doc;
	}

	return {
		ajaxFileUpload : ajaxFileUpload
		, ajaxSubmitData : ajaxSubmitData
		, responseSuccess : responseSuccess
		, responseError : responseError
	}
})();

/**
 * 공통 유틸
 */
var CommonUtils = (function() {

	/** \n >> <br/> */
	function nToBr(string) {
		return string.replace(/[\n|\r]/g, '<br/>');
	}

	/** <br/> >> \n */
	function brToN(string) {
		return string.replace(/<br\s*\/?>/mg, '\n');
	}

	function isEmpty(str) {
		return str == null || str == undefined || str == '' || str == 'undefined';
	}

	/** IE Browser Check */
	function detectIE() {
		var ua = window.navigator.userAgent;
		// IE 10 or older => return version number
		var msie = ua.indexOf('MSIE ');
		if (msie > 0) return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
		// IE 11 => return version number
		if (ua.indexOf('Trident/') > 0) {
			var rv = ua.indexOf('rv:');
			return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
		}
		// IE 12 => return version number
		var edge = ua.indexOf('Edge/');
		if (edge > 0) return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
		// other browser
		return false;
	}

	/** 이미지 src 변경 관리자 */
	function changeImageSrc(imgObj) {
		var imgObj = $(imgObj);
		var imgSrc = $(imgObj).attr('data-src');
		if (imgSrc.length > 0) {$('.thumbnail .thumb-img img').attr('src', imgSrc);}
	}

	/** 이미지 src 변경 사용자 */
	function changeUserImageSrc(imgObj) {
		var imgObj = $(imgObj);
		var imgSrc = $(imgObj).attr('data-src');
		if (imgSrc.length > 0) {$('.userImgBox .goods-view').attr('src', imgSrc);}
	}

	/** 셀렉박스 자동 선택 처리 */
	function autoSelect() {
		$('select').each(function() {
			var selThis = $(this);
			//값이 있을 경우
			if (selThis.data('value') != null && selThis.data('value') != undefined) {
				selThis.closest('select').val(selThis.data('value')).trigger('change');
			}
			else {
				selThis.closest('option:eq(0)').trigger('change');
			}
		});
	}

	function checkBoxClick(){
		$('.checkbox').not('.all').click(function(){
			var chkLen = 0;
			var isCheck = $(this).is(":checked");
			if(isCheck == false) {
				$('input[name="searchValueAll"]:checkbox').prop("checked", false);
			}
			$('.checkbox').not('.all').each(function() {
				// 체크한 체크박스의 갯수
				if($(this).is(":checked") == true) chkLen++;
			});
			// 체크한 갯수가 총 갯수-1(전체제외)와 같은 경우
			if(chkLen == $('.checkbox').size() - 1) {
				$('input[name="searchValueAll"]:checkbox').prop("checked", true);
			}
		});

		// 전체체크박스 체크한 경우
		$('.checkbox.all').click(function(){
			// 전체체크박스 체크여부
			var isAll = $(this).is(":checked");
			$('.checkbox').each(function(index) {
				if(isAll && !$(this).is(":checked")) {
					$('input[name="searchValueArray"]').eq(index-1).prop("checked", true);
				} else if(!isAll && $(this).is(":checked")) {
					$('input[name="searchValueArray"]').eq(index-1).prop("checked", false);
				} else if(index == 0){
					// 전체 체크박스 체크상태 변경
					if(!$(this).is(":checked")){
						$('input[name="searchValueAll"]').prop("checked", false);
					}
					else $('input[name="searchValueAll"]').prop("checked", true);
				}
			});
		});
	}

	function radioClick() {
		/*라디오*/
		$('.radio').click(function(){
			var selVal = $(this).data('val');

			//input에 값 추가
			$(this).closest('div.radio-button').find('input.radio_value').val(selVal);

			$(this).closest('div.radio-button').find('span.radio').removeClass('on');
			$(this).addClass('on');
		});
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

	/** 필수 값 체크 (단일) */
	function requiredCheckOne(obj) {
		var isRequiredCheck = true;
		if (!obj.is(':hidden') && isEmpty(obj.val())) {
			alert('[' + obj.data('check-name') + '] 란을 입력해 주세요.');
			obj.focus();
			isRequiredCheck = false;
		}
		return isRequiredCheck;
	}

	/** 필수 길이 체크 (단일) */
	function lengthCheckOne(obj) {
		var isLengthCheck = true;
		if (obj.val().length > 0 &&  obj.val().length < obj.attr('data-minLength')) {
			alert('[' + obj.attr('data-check-name') + '] 란을 올바르게 입력해 주세요.');
			obj.focus();
			isLengthCheck = false;
		}
		return isLengthCheck;
	}

	/** 유효성 검사 */
	function validationCheck() {
		numberCheck();
		englishCheck();
	}

	/** 숫자, - 외의 입력 자동제거 */
	function numberCheck() {
		$('.numChk').on('keyup', function(e) {
			var _this = $(this);
			if (isNormalKeyCheck(e) && !_this.prop('readonly')) _this.val(_this.val().replace(/[^0-9-]/gi, ''));
		});
	}

	/** 영문, 숫자만 입력 가능 */
	function englishCheck() {
		$('.engChk').on('keyup focusout', function() {
			var _this = $(this);
			if (_this.val().match(/[^a-zA-Z0-9]/) != null) {
				alert('영문 및 숫자만 사용 가능합니다.');
				_this.val('');
			}
		});
	}

	/** KeyCode */
	var KEYCODE = {
		DELETE : [
			'46'  // Delete
			, '8' // Backspace
		]
		, DIRECTION : [
			'37'   // 좌
			, '38' // 상
			, '39' // 우
			, '40' // 하
		]
		, CONTROL : [
			'16'   // Shift
			, '17' // Ctrl
			, '18' // Alt
			, '65' // a
			, '67' // c
			, '86' // v
		]
	};

	/** 전화번호 코드 */
	var TEL_PREFIX = [
		// Area Code
		'02' , '031' , '032' , '033' , '041' , '042'
		, '043' , '051' , '052' , '053' , '054'
		, '055' , '061' , '062' , '063' , '064'
		// Phone Code
		, '010' , '011' , '016' , '017' , '018' , '019'
		// ETC Code
		, '070'
	];

	// KeyCode Check
	function isNormalKeyCheck(event) {
		var keyCode = event.keyCode.toString();
		var isNotDelete = $.inArray(keyCode, KEYCODE.DELETE) < 0;
		var isNotDirection = $.inArray(keyCode, KEYCODE.DIRECTION) < 0;
		var isControlKey = event.ctrlKey || event.altKey || event.shiftKey;
		var isCopyNPasteKey = $.inArray(keyCode, KEYCODE.CONTROL) >= 0;
		return isNotDelete && isNotDirection && !(isControlKey && isCopyNPasteKey);
	}

	/** 전화번호 자동 - 붙이기 */
	function autoDash() {

		var DASH = '-';
		var telPreLength = 3;      // 전화번호 앞자리 길이
		var isExistTelPre = false; // 전화번호 코드 존재여부

		$('.autoDash').on('keyup', function(e) {
			var _this = $(this);
			if (isNormalKeyCheck(e) && !_this.prop('readonly')) {
				var inputValue = _this.val();
				if (!inputValue) return;
				var inputLength = inputValue.length;
				var numValue = inputValue.replace(/[^0-9]/gi, '');
				var numLength = numValue.length;
				var preValue, midValue, endValue;
				/* PRE 입력중 (TEL CODE CHECK) */
				if (inputLength < 4) {
					isExistTelPre = $.inArray(inputValue, TEL_PREFIX) >= 0;
					if (isExistTelPre) {
						_this.val(inputValue + DASH);
						telPreLength = inputLength;
					}
				/* 입력중 */
				} else if (isExistTelPre && inputLength == (telPreLength + 5)) {
					_this.val(inputValue + DASH);
				/* 입력후(TEL CODE : X) */
				} else if (!isExistTelPre && inputLength >= 4) {
					// ex) 1588-1234, 1677-1234567 ..
					preValue = numValue.substring(0, 4);
					endValue = numValue.substring(4, numLength);
					_this.val(preValue + DASH + endValue);
				/* 입력후(TEL CODE : O) */
				} else if (isExistTelPre && inputLength >= 11) {
					var midP = numLength - 4;
					preValue = numValue.substring(0, telPreLength);
					midValue = numValue.substring(telPreLength, midP);
					endValue = numValue.substring(midP, numLength);
					_this.val(preValue + DASH + midValue + DASH + endValue);
				}
			}
		});
	}

	/** 엑셀 다운로드 */
	function excelDownload(paramObject) {
		$('.excelBtn').on('click', function() {
			var url = $(this).data('url');
			var paramString = '?';
			for (var paramKey in paramObject) {
				var paramValue = paramObject[paramKey];
				if (paramObject.hasOwnProperty(paramKey) && !isEmpty(paramValue)) {
					paramString += '&' + paramKey + '=' + paramValue;
				}
			}
			SearchUtils.resetDateForSearch();
			location.href = contextPath + url + paramString;
		});
	}

	/** 취소 버튼 */
	function cancelBtn() {
		$('.cancelBtn').on('click', function(){
			if (!confirm('취소 하시겠습니까?')) return false;
			history.back();
		});
	}

	/**  input Enter Submit */
	function inputEnterSubmit() {
		$('form#searchForm').find('input:text').each(function () {
			$(this).on('keydown', function (evt) {
				if (evt.keyCode == 13) {
					$('form#searchForm').submit();
				}
			});
		});
	}

	/* HTML tag 제거 */
	var stripHTMLtag = function (string) {
		var objStrip = new RegExp();
		objStrip = /[<][^>]*[>]/gi;
		return string.replace(objStrip, "");
	};

	return {
		nToBr : nToBr
		, brToN : brToN
		, isEmpty : isEmpty
		, detectIE : detectIE
		, changeImageSrc : changeImageSrc
		, changeUserImageSrc : changeUserImageSrc
		, autoSelect : autoSelect
		, checkBoxClick : checkBoxClick
		, radioClick : radioClick
		, requiredCheckAll : requiredCheckAll
		, requiredCheckOne : requiredCheckOne
		, validationCheck : validationCheck
		, numberCheck : numberCheck
		, autoDash : autoDash
		, lengthCheckOne : lengthCheckOne
		, excelDownload : excelDownload
		, cancelBtn : cancelBtn
		, inputEnterSubmit : inputEnterSubmit
		, stripHTMLtag : stripHTMLtag
	}
})();

/**
 * 팝업 유틸
 */
var PopupUtils = (function() {

	/** 팝업 열기 */
	function windowPopup(url, width, height, scroll, x, y) {
		openPopup(url, width, height, scroll, x, y);
	}

	/** 팝업 옵션 세팅 */
	function openPopup(url, width, height, scroll, x, y) {
		window.open(contextPath + url, '',
			'left=' + (x || 300) + ', top=' + (y || 300)
			+ ', width=' + width + ', height=' + height
			+ ', scrollbars=' + (scroll || 0)
			+ ', location=no, menubar=no, toolbar=no, status=no, directories=no');
		return false;
	}
	return {
		windowPopup : windowPopup
	}
})();

/**
 * 카테고리 리스트 유틸
 */
var GetCodeListUtils = (function() {

	// 셀렉트 박스 선택 효과
	function categorySelectEvent() {
		var categoryParentKey = $('#categoryParentKey').val();
		if(!CommonUtils.isEmpty(categoryParentKey)) {
			$('.category').trigger('change');
		}
	}

	function getCategoryUserDownList() { // 사용자 > 카테고리 불러오기
		$('ul.category > li').off('click').on('click', function(){
			var categoryKey = $(this).data('category-key');
			if($(this).closest('div').hasClass('select-box')){ // 사용자 > 메인
				$(this).closest('div').find('.selVal').val(categoryKey);
				$(this).closest('div').find('span').text($(this).text());
				if($(this).closest('div').hasClass('upCategory')) {
					categoryDownList(categoryKey,'userMain');
				}
			}else{
				$(this).closest('.group-list').find('.selVal').val(categoryKey);
				$(this).addClass('on');
				$(this).parent('.category').find('li').not($(this)).removeClass('on');
				if($(this).parent('.category').hasClass('upCategory')) {
					categoryDownList(categoryKey,'user');
				}
			}
		});
	}
	function getCategoryDownList() { // 기본 selectbox
		$('.category').change(function(){
			var categoryKey = $(this).find('option:selected').data('category-key');
			categoryDownList(categoryKey, 'default');
		});
	}
	// 제품분류의 하위카테고리 불러오기()
	function categoryDownList(categoryKey, type) {
		var categoryList = '';
		if(type == 'default') categoryList = '<option value="">2차분류</option>';
		else if(type == 'user')categoryList = '<li class="point on" data-category-key="">전체선택</li>';

		if(categoryKey == null || "undefined" == typeof categoryKey ){
			$('#categoryDown').html(categoryList);
			$('#categoryDown').parent('div').find('.selVal').val("");
			$('.categoryDownSpan').text('2차분류');
		    return false;
		}
		$.ajax ({
			data : {parentKey:categoryKey},
			type : 'POST',
			dataType : 'json',
			url : contextPath + '/rest/productCategory/getProductCategorySelectList',
			success : function(result) {
				if (result.code == 'FAIL') {
					return false;
				}
				try {
					var categoryListLength = result.productCategoryList.length;
					for(var i = 0 ; i < categoryListLength ; i++){
						var categoryData = result.productCategoryList[i];
						if(type == 'default') categoryList +=  '<option value="' + categoryData.categoryKey +'">' + categoryData.categoryName + '</option>';
						else categoryList += '<li class="point" data-category-key="' + categoryData.categoryKey +'">' + categoryData.categoryName + '</li>';
					}
					$('#categoryDown').html(categoryList);
					getCategoryUserDownList();

					if(type == 'default'){
						if (!CommonUtils.isEmpty($('#categoryDown').data('value'))) {
							$('#categoryDown').val($('#categoryDown').data('value')).trigger('click');
						}
					}else{
						var selVal = $('#categoryDown').parent('div').find('.selVal').val();
						if (!CommonUtils.isEmpty(selVal)) {
							if($('#categoryDown').find('li[data-category-key='+selVal+']').length > 0){
								$('#categoryDown').find('li[data-category-key='+selVal+']').trigger('click');
							}else{
								$('#categoryDown').parent('div').find('.selVal').val("");
							}
						}
					}
				} catch(err) {
				}
			},
			error: HttpUtils.responseError
		});
	}

	return {
		categorySelectEvent : categorySelectEvent
		, getCategoryUserDownList: getCategoryUserDownList
		, getCategoryDownList : getCategoryDownList
		, categoryDownList : categoryDownList
	}
})();

/**
 * 검색 유틸
 */
var SearchUtils = (function() {

	function searchBoxInit() {
		/** 검색 */
		$('.searchBtn').on('click', function(){
			SearchUtils.resetDateForSearch();
			var startDateObj = $('.startDate');
			var endDateObj = $('.endDate');
			if (startDateObj.val() > endDateObj.val()) {
				alert('기간 선택이 올바르지 않습니다.');
				startDateObj.val('');
				endDateObj.val('');
				return false;
			}
			$("input[name=buyIntentionYn]").val(''); // (관리자)판매제품 구매의사 존재
			$("#searchForm").submit();
			return false;
		});
		/** 초기화 */
		$('.resetBtn').on('click', function(){
			$('input').not($('.searchBtn')).val('');
			$('select').find('option:eq(0)').prop('selected', true);
			$('.group-list').find('li').removeClass('on');
			$('.group-list').find('li:eq(0)').addClass('on');
			$("input[type=checkbox]").prop("checked",false);
			$("input[name=searchValueArray]").prop("checked",true);
			$("input[name=searchValueAll]").prop("checked",true);
			$("input[name=searchValueAll]").val("all");
			if($('.category').hasClass('upCategory')) {
				GetCodeListUtils.categoryDownList(null,'user');
			}else{
				GetCodeListUtils.categoryDownList(null,'default');
			}
		});
	}

	/** 기간 검색 시, 기간 타입 없을 경우 입력된 날짜 제거 */
	function resetDateForSearch() {
		var dateTypeObj = $('.dateType');
		var startDateObj = $('.startDate');
		var endDateObj = $('.endDate');
		if (CommonUtils.isEmpty(dateTypeObj.val())) {
			startDateObj.val('');
			endDateObj.val('');
		} else {
			if (CommonUtils.isEmpty(startDateObj.val()) && CommonUtils.isEmpty(endDateObj.val())) {
				dateTypeObj.find('option').eq(0).prop('selected', true);
			}
		}
	}

	return {
		searchBoxInit : searchBoxInit
		, resetDateForSearch : resetDateForSearch
	}
})();

/**
 * 복제 유틸
 */
var CloneUtils = (function() {

	var cloneIndex = $('.cloneArea').length;
	var deleteCloneKeys = [];

	/** Clone INIT */
	function cloneInit() {
		cloneObject();
		removeObject();
	}

	/** Clone Object */
	function cloneObject() {
		$('.addBtn').off('click').on('click', function() {
			var cloneArea = $(this).closest('.cloneArea');
			var thisClone = cloneArea.clone(true, true);
			// Default Value Setting
			thisClone.find('input').val('');
			thisClone.find('span[data-val=Y]').addClass('on');
			thisClone.find('span[data-val=N]').removeClass('on');
			thisClone.find('input.radio_value').val('Y');
			thisClone.find('.delBtn').removeAttr('data-key');
			thisClone.find('input').removeAttr('disabled');
			thisClone.find('input.key').val(0);
			// Array's name [index] change
			var nameIndex = ++cloneIndex;
			thisClone.find('input').each(function() {
				$(this).attr('name', $(this).attr('name').replace(/\[[0-9]\]/, '[' + nameIndex + ']'));
			});
			$('.cloneArea').last().after(thisClone);
		});
	}

	/** Remove Object */
	function removeObject() {
		$('.delBtn').off('click').on('click', function() {
			var cloneArea = $(this).closest('.cloneArea');
			var thisKey = $(this).data('key');
			var deleteBtn = $('.delBtn');
			if (!CommonUtils.isEmpty(thisKey)) deleteCloneKeys.push(thisKey);
			if (deleteBtn.length <= 1) {
				cloneArea.find('input').val('');
				cloneArea.find('input.key').val(0);
				cloneArea.find('input').removeAttr('disabled');
				cloneArea.find(deleteBtn).data('key', 0);
			}
			else cloneArea.remove();
		});
	}

	/** Getting keys for delete */
	function getDeleteCloneKeys() {
		return deleteCloneKeys.toString();
	}

	return {
		cloneInit : cloneInit
		, getDeleteCloneKeys : getDeleteCloneKeys
	}
})();

/**
 * 파일 유틸
 */
var FileUtils = (function() {

	var deleteFileKeys = [];
	var defaultOptions = {
		type     : 'file'
		, class  : 'file'
		, name   : 'fileList'
		, accept : null
	};

	// 파일 태그
	function getFileTag(options) {
		options = $.extend(defaultOptions, options || {});
		var fileTag = document.createElement('input');
		fileTag.setAttribute('type', options.type);
		fileTag.setAttribute('name', options.name);
		fileTag.setAttribute('class', options.class);
		var accept = options.accept;
		if (!CommonUtils.isEmpty(accept)) fileTag.setAttribute('accept', accept);

		return fileTag;
	}

	// 태그 생성
	function createFileTag(fileArea, options) {
		fileArea.prepend(getFileTag(options));
		fileArea.find('input').not('.file').remove();
		fileArea.attr('data-key', 0);
	}

	/** File INIT */
	function defaultFileInit() {
		cloneFileArea();
		removeFileArea();
	}

	/** Clone File */
	function cloneFileArea() {
		$('.addFileBtn').off('click').on('click', function() {
			var fileArea = $(this).closest('.fileArea');
			var fileClone = fileArea.clone(true, true);
			var fileKey = fileArea.data('key');
			if (!CommonUtils.isEmpty(fileKey)) {
				fileClone.data('key', 0);
				fileClone.find('.fileName').after(getFileTag);
				fileClone.find('.fileName').remove();
			}
			$('.fileArea').last().after(fileClone);
			cloneFileArea();
		});
	}

	/** Remove File */
	function removeFileArea(isRemoveArea, options) {
		$('.delFileBtn').off('click').on('click', function() {
			if (typeof isRemoveArea === 'undefined') isRemoveArea = true;
			var fileArea = $(this).closest('.fileArea');
			var fileKey = fileArea.attr('data-key');
			var isOneFile = $('.delFileBtn').length <= 1;
			if (isOneFile || !isRemoveArea) {
				if (!CommonUtils.isEmpty(fileKey) && fileKey > 0) {
					deleteFileKeys.push(fileKey);
					createFileTag(fileArea, options);
				} else {
					fileArea.find('.file').val('');
					fileArea.attr('data-key', 0);
				}
			} else { fileArea.remove(); }
			if ($(this).hasClass('isBreak')){
				$(this).parent('div.fileArea').parent('td').find('.isBreak').val(0);
			}
		});
	}

	/** Getting file keys for delete (Array to String) */
	function getDeleteFileKeys() {
		return deleteFileKeys.toString();
	}
	/** Getting file keys for delete (Array) */
	function getDeleteFileKeysArray() {
		return deleteFileKeys;
	}

	return {
		defaultFileInit : defaultFileInit
		, removeFileArea : removeFileArea
		, getDeleteFileKeys : getDeleteFileKeys
		, getDeleteFileKeysArray : getDeleteFileKeysArray
	}
})();

/**
 * SNS 유틸
 */
var SnsUtils = (function() {
    var sendUrl = '';
    var snsUrl = '';
    sendUrl = location.href;
    function snsClick(){
        $(".sns").on('click', function(){
            if($(this).hasClass("facebook")){
                snsUrl="http://www.facebook.com/sharer/sharer.php?u="+sendUrl;
            }else if($(this).hasClass("twitter")){
                snsUrl="https://twitter.com/intent/tweet?text=IR international&url="+sendUrl;
            }else{
                snsUrl="mailto:css761@naver.com?body="+sendUrl;
            }
            sendSns(snsUrl);
        })
    }
    function sendSns(snsUrl){
        window.open(snsUrl, '_blank');
    }
    return {
        snsClick : snsClick
    }
})();