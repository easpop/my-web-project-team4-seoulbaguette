/**
 * 
 */

function noticeCreate() {
		location.href = "notice_write_form.jsp";
}

function noticeCreateMsg() {
	if(f.notice_title.value == ""){
		alert("제목을 입력하십시오.");
		f.notice_title.focus();
		return false;
	}
	if(f.notice_content.value == ""){
		alert("내용을 입력하십시오.");
		f.notice_content.focus();
		return false;
	}
	
	f.action="notice_write_action.jsp";
	f.method='POST';
	f.submit();
}
function noticeModifyMsg() {
	if(f.notice_title.value == ""){
		alert("제목을 입력하십시오.");
		f.notice_title.focus();
		return false;
	}
	if(f.notice_content.value == ""){
		alert("내용을 입력하십시오.");
		f.notice_content.focus();
		return false;
	}
	f.action="notice_modify_action.jsp";
	f.method='POST';
	f.submit();
}

function noticeUpdate(){
	f.action="notice_modify_form.jsp";
	f.submit();
}

function noticeRemove(){
	if(confirm("정말 삭제하시겠습니까?")){
		f.action="notice_remove_action.jsp";
		f.submit();
	}
}

function noticeList() {
	f.action="notice_list.jsp";
	f.submit();
}
