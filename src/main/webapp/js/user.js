/**
 * 
 */

function userCreate() {
	if (document.f.u_id.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		f.user_id.focus();
		return false;
	}
	if (document.f.user_password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.user_password.focus();
		return false;
	}
	if (document.f.user_password2.value == "") {
		alert("비밀번호확인을 입력하십시요.");
		f.user_password2.focus();
		return false;
	}
	if (document.f.user_name.value == "") {
		alert("이름을 입력하십시요.");
		f.user_name.focus();
		return false;
	}
	if (document.f.user_email.value == "") {
		alert("이메일 주소를 입력하십시요.");
		f.user_email.focus();
		return false;
	}
	if (document.f.user_phone.value == "") {
		alert("핸드폰 번호를 입력하십시요.");
		f.user_phone.focus();
		return false;
	}
	if (f.user_password.value != f.user_password2.value) {
		alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
		f.user_password.focus();
		f.password.select();
		return false;
	}


	document.f.action = "user_write_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}
function login() {
	if (document.f.userId.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		document.f.userId.focus();
		return;
	}
	if (document.f.password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.password.focus();
		return;
	}

	document.f.action = "user_login_action.jsp";
	document.f.method = 'POST';
	document.f.submit();
}

function userCreate_cancel() {
	document.f.action = "shop_main.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function userModify() {
	document.f.action = "user_update_form.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function userModifyCreate() {
	if (document.f.user_id.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		f.user_id.focus();
		return false;
	}
	if (document.f.user_password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.user_password.focus();
		return false;
	}
	if (document.f.user_password2.value == "") {
		alert("비밀번호확인을 입력하십시요.");
		f.user_password2.focus();
		return false;
	}
	if (document.f.user_name.value == "") {
		alert("이름을 입력하십시요.");
		f.user_name.focus();
		return false;
	}
	if (document.f.user_email.value == "") {
		alert("이메일 주소를 입력하십시요.");
		f.user_email.focus();
		return false;
	}
	if (document.f.user_phone.value == "") {
		alert("핸드폰 번호를 입력하십시요.");
		f.user_phone.focus();
		return false;
	}
	if (f.user_password.value != f.user_password2.value) {
		alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
		f.user_password.focus();
		f.password.select();
		return false;
	}


	document.f.action = "user_update_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function userModify_cancel() {
	document.f.action = "user_view.jsp";
	document.f.method = "POST";
	document.f.submit();
}
function userRemove() {
	document.f.action = "user_remove_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}
function userPasswordCheck() {
	if (window.confirm("정말 탈퇴하시겠습니까?")) {
		document.f.action = "user_password_check_form.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
}

function userPasswordCheckAction() {
	if (document.f.user_password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.user_password.focus();
		return false;
	}
	document.f.action = "user_password_check_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}
function userAddress() {
	document.f.action = "address_list.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function userOrderList() {
	document.f.action = "order_list.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function userCreateForm(){
	document.f.action = "user_write_form.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function openIdCheck(){
	window.open('user_id_check_form.jsp','checkForm','width=500,height=200,resizable = no,scrollbar = no');
}