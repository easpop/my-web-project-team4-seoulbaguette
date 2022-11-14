/**
 * 
 */

function qnaCreate() {
		location.href = "qna_write_form.jsp";
}

function qnaCreateMsg() {
	if(f.qna_title.value == ""){
		alert("제목을 입력하십시오.");
		f.qna_title.focus();
		return false;
	}
	if(f.user_id.value == ""){
		alert("작성자를 입력하십시오.");
		f.user_id.focus();
		return false;
	}
	if(f.qna_content.value == ""){
		alert("내용을 입력하십시오.");
		f.qna_content.focus();
		return false;
	}
	
	f.action="qna_write_action.jsp";
	f.method='POST';
	f.submit();
}
function qnaModifyMsg() {
	if(f.qna_title.value == ""){
		alert("제목을 입력하십시오.");
		f.qna_title.focus();
		return false;
	}
	if(f.user_id.value == ""){
		alert("작성자를 입력하십시오.");
		f.user_id.focus();
		return false;
	}
	if(f.qna_content.value == ""){
		alert("내용을 입력하십시오.");
		f.qna_content.focus();
		return false;
	}
	f.action="qna_modify_action.jsp";
	f.method='POST';
	f.submit();
}

function qnaReplyMsg(){
	if(f.qna_title.value == ""){
		alert("제목을 입력하십시오.");
		f.qna_title.focus();
		return false;
	}
	if(f.user_id.value == ""){
		alert("작성자를 입력하십시오.");
		f.user_id.focus();
		return false;
	}
	if(f.qna_content.value == ""){
		alert("내용을 입력하십시오.");
		f.qna_content.focus();
		return false;
	}
	f.action="qna_reply_write_action.jsp";
	f.method='POST';
	f.submit();
}

function qnaReplyCreate() {
	f.action="qna_reply_write_form.jsp";
	f.method='POST';
	f.submit();
}

function qnaUpdate(){
	f.action="qna_modify_form.jsp";
	f.submit();
}

function qnaRemove(){
	if(confirm("정말 삭제하시겠습니까?")){
		f.action="qna_remove_action.jsp";
		f.submit();
	}
}

function qnaList() {
	f.action="qna_list.jsp";
	f.submit();
}
