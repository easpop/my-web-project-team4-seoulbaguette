

function addressModify(form){
	document.getElementById(form).action = "address_modify_form.jsp";
	document.getElementById(form).method = "POST";
	document.getElementById(form).submit();
}

function addressModifyAction(){
	if (document.f.address.value == "") {
			alert("주소를 입력하십시요.");
			f.address.focus();
			return false;
		}
	document.f.action = "address_modify_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function addressRemove(form){
	alert("삭제하시겠습니까?");
	document.getElementById(form).action = "address_remove_action.jsp";
	document.getElementById(form).method = "POST";
	document.getElementById(form).submit();
}

function addressBack(){
	
	document.getElementById("addreturn").action = "user_view.jsp";
	document.getElementById("addreturn").method = "POST";
	document.getElementById("addreturn").submit();
}

function addressCancel(){
	document.f.action = "address_list.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function addressInsert(){
	if (document.f.address.value == "") {
			alert("주소를 입력하십시요.");
			f.address.focus();
			return false;
		}
	document.f.action="address_insert_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function addressAdd(){
	document.getElementById("addreturn").action="address_insert_form.jsp";
	document.getElementById("addreturn").method = "POST";
	document.getElementById("addreturn").submit();
}

/*function addressAdd(check){
	if(check>=3){
		alert('주소록은 3개까지 저장 가능합니다.');
		document.getElementById("addcheck").disabled=true;
	}else{
	document.getElementById("addreturn").action = "address_insert_form.jsp";
	document.getElementById("addreturn").method = "POST";
	document.getElementById("addreturn").submit();
	}
}*/

function addressCheck(check){
	if(check>=3){
		//alert('주소록은 3개까지 저장 가능합니다.');
		document.getElementById("addcheck").disabled=true;
	}else{
		document.getElementById("addcheck").disabled=false;
	}
	
}

function addressOrderCheck(){
	
}






