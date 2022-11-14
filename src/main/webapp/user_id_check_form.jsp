<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isDuplicate=false;	
	String msg="";
	//request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
	if(user_id==null|| user_id.equals("")){
		//최초윈도우를 띄울때
		user_id="";
		msg="";
		isDuplicate=true;
	}else{
		UserService userInfoService = new UserService();
		isDuplicate=userInfoService.isDuplicateId(user_id);
		if(isDuplicate){
			msg="사용 불가능한 아이디입니다.";
		}else{
			msg="사용 가능한 아이디 입니다";
			
			
		}
	}
	
%>	







<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SEOUL BAGUETTE</title>

<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}
#chk {
	text-align: center;
}
#cancelBtn {
	visibility: visible;
}
#useBtn {
	visibility: visible;
}
</style>
<script type="text/javascript">
	// 아이디 중복체크
	function idCheck() {
		var userId=document.getElementById("user_id").value;
		if(userId==null|| userId==''){
			alert('검색할아이디를 입력하시고 중복체크를 하세요.');
			return;
		}
		document.getElementById('checkForm').action='user_id_check_form.jsp';
		document.getElementById('checkForm').method='POST';
		document.getElementById('checkForm').submit();
	}
	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.f.u_id.value = window.document.getElementById('user_id').value;
		
		window.close();
	}
</script>




</head>

<body>
	<div id="wrap">
		<br> <b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="user_id" id="user_id" value="<%=user_id%>"> <input
					type="button" style="font: inherit;" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"><%=msg %></div>

			<br> 
			<input id="cancelBtn" style="font: inherit;" type="button" value="취소" onclick="window.close();"> 
			<%if(!isDuplicate){ %>
			<input id="useBtn" style="font: inherit;" type="button" value="사용하기" onclick="sendCheckValue()">
			<%} %>
		</div>
	</div>

</body>
</html>