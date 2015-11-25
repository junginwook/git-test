/**
 * 폼필드에 있는 내용을 JsonArray로 변경해준다. 일반적인 경우에는 $('#formName').formToObjectArray() 라고만 사용하고 html코드를 변경해 주어야 할 필요가 없으나,
 * 자식이 있는 경우에는 자식 VO타입에 맞춰서 아래와 같이 HTML엘리먼트(태그명은 상관없음)로 감싸주어야한다.[자식 VO 식별의 목적]
 * 1. 자식이 일반 VO인 경우 		: <element class="child-depth-1" data-field-name="address"></element>		=> 자식인 경우는 child-depth-1 라고 적고, 자식의 자식은 child-depth-2 라고 적어야 한다.
 * 2. 자식이 List<VO>인 경우	: <element class="child-depth-1 list" data-field-name="address"></element>	=> 자식인 경우는 child-depth-1 라고 적고, 자식의 자식은 child-depth-2 라고 적어야 한다.
 */
$.fn.formToObjectArray = function (depth) {
	depth = depth || 0;
	var useTypes = ['text', 'password', 'hidden', 'radio', 'checkbox', 'file'];
	var self = this;
	var childDepth = depth + 1;
	var childFormSelector = '.child-depth-' + childDepth;
	var inputs = $(self).find('input:not(".unused"), select:not(".unused"), textarea:not(".unused")').filter(function (index) {
		return !$(this).closest(childFormSelector).attr('class');
	});
	var uniqueNames = [];

	// 1-1. 유일한 name을 추출
	inputs.each(function (index) {
		var name = $(this).attr('name'),
			type = $(this).attr('type');
			objType = $(this)[0].type;
		if (!CommonUtils.isEmpty(name)) {
			if (inputs.is('select') && $.inArray(name, uniqueNames) == -1) {			//select 일 경우
				uniqueNames.push(name);
			} else if (objType == 'textarea' && $.inArray(name, uniqueNames) == -1) {			//select 일 경우
				uniqueNames.push(name);
			} 
			else {
				$.inArray(type, useTypes) != -1 && $.inArray(name, uniqueNames) == -1 && uniqueNames.push(name);
			}
		}
	});
	
	// 1-2. 유일한 name을 이용하여 각 홀더에 값을 셋팅
	var holder = {};
	$.each(uniqueNames, function (index) {
		var name = this;
		holder[name] = [];
		
		$(self).find('input[name=' + name + ']:not(".unused"), select[name=' + name + ']:not(".unused"), textarea[name=' + name + ']:not(".unused")').each(function (j) {
			holder[name].push($(this).val());
		});
	});
	
	// 1-3. holder에 있는 name의 길이가 같은지 검증
	var isRowCountEqual = true;
	$.each(uniqueNames, function (index) {
		if (index != 0 && holder[uniqueNames[index - 1]].length != holder[this].length) {
			isRowCountEqual = false;
		}
	});
	if (!isRowCountEqual) {
		alert('필드별로 길이가 다릅니다.'); 
		//return [];	
	}

	// 1-4. VO 형식으로 변경하여 Array에 추가
	var resultRecordArray = [];
	if (uniqueNames.length > 0) {
		for (var i = 0; i < holder[uniqueNames[0]].length; i++ ) {
			var info = {};
			$.each(uniqueNames, function (index) {
				info[this] = holder[this][i];
			});
			resultRecordArray.push(info);
		}
	}
	// 2. 자식 VO가 있는 경우 처리함
	var childForms = $(self).find(childFormSelector);
	if (childForms.length) {
		// 2-1. 자식 VO가 들어있는 폼의 유일한 VO 필드명 추출하기
		var uniqueVoFieldNames = [];
		$(self).find(childFormSelector).each(function (index) {
			var fieldName = $(this).data('field-name');
			$.inArray(fieldName, uniqueVoFieldNames) == -1 && uniqueVoFieldNames.push(fieldName);
		});
		
		// 2-2. input박스가 없고 childFormSelector만 있는 경우에는 resultRecordArray 길이가 0이되므로 resultRecordArray에 빈객체를 넣어준다.
		// => (수정) resultRecordArray에 빈객체를 하나 넣어주는게 아니라  childForms.length / uniqueVoFieldNames.length (자식폼수/자식필드수) 만큼 넣어주어야 한다. 
		if (resultRecordArray.length == 0) {
			for (var i = 0; i < childForms.length / uniqueVoFieldNames.length; i++) {
				var info = {};
				$.each(uniqueVoFieldNames, function (index) {
					info[this] = {};
				});
				resultRecordArray.push(info);
			}
		}
		
		// 2-3. 자식 VO가 있는 경우 자식 VO 추가하기
		childForms.each(function (index) {
			var form = $(this);
			var fieldName = form.data('field-name');
			var info = resultRecordArray[parseInt(index / uniqueVoFieldNames.length)];
			info[fieldName] =  form.hasClass('list') ? form.formToObjectArray(childDepth) : form.formToObject(childDepth);
		});
	}
	
	return resultRecordArray;
};

$.fn.formToObject = function (depth) {
	return $(this).formToObjectArray(depth)[0];
};