/**
 * 
 */

function review_writeCheck(form, check) {
	if (check == 0) {
		actionAdr = "review_write_form.jsp";
	} else if (check == 1) {
		actionAdr = "review_view_user.jsp";
	}
	document.getElementsByName(form)[0].method = 'POST';
	document.getElementsByName(form)[0].action = actionAdr;
	document.getElementsByName(form)[0].submit();

}

function reviewModify() {
	document.f.action = "review_update_form.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function reviewRemove() {
	if (confirm("정말 삭제하시겠습니까?")) {
		document.f.action = "review_delete_action.jsp";
		document.f.method = 'POST';
		document.f.submit();
	}
}

function reviewOrderReturn(){
	document.f.action = "order_detail.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function reviewformCheck_write() {
	if (document.f.r_title.value == "") {
		alert("제목을 입력하십시오.");
		document.f.r_title.focus();
		return false;
	}
	if (document.f.r_content.value == "") {
		alert("내용을 입력하십시오.");
		document.f.r_content.focus();
		return false;
	}
	if (document.f.r_stargrade.value <1 || document.f.r_stargrade.value>5) {
		alert("별점은 1점부터 5점까지의 범위 내에서 줄 수 있습니다!");
		document.f.r_stargrade.focus();
		return false;
	}
	

	document.f.action = "review_write_action.jsp";
	document.f.method = 'POST';
	document.f.submit();
}

function reviewformCheck_update() {
	if (document.f.r_title.value == "") {
		alert("제목을 입력하십시오.");
		document.f.r_title.focus();
		return false;
	}
	if (document.f.r_content.value == "") {
		alert("내용을 입력하십시오.");
		document.f.r_content.focus();
		return false;
	}
	if (document.f.r_stargrade.value <1 || document.f.r_stargrade.value>5) {
		alert("별점은 1점부터 5점까지의 범위 내에서 줄 수 있습니다!");
		document.f.r_stargrade.focus();
		return false;
	}
	

	document.f.action = "review_update_action.jsp";
	document.f.method = 'POST';
	document.f.submit();
}

function reviewCancelUpdate(){
	document.f.action = "review_view.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function reviewReturn(){
	document.f.action = "review_list_user.jsp";
	document.f.method = "POST";
	document.f.submit();
	
}

function returnMypage(){
	document.f.action = "user_view.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function reviewView(){
	document.f.action = "review_view_user.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function memberReview(){
	document.f.action = "review_list_user.jsp";
	document.f.method = "POST";
	document.f.submit();
}

function productReview(){
	document.f.action = "product_detail.jsp";
	document.f.method = "POST";
	document.f.submit();
}




