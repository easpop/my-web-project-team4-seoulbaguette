<%@page import="com.itwill.bakery.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User fuser = (User) request.getAttribute("fuser");
if (fuser == null) {
	fuser = new User("","","","","",0,null);
}
String msg = (String) request.getAttribute("msg");
if (msg == null)
	msg = "";

/* String id=(String) request.getAttribute("id");
if(id==null)
	id=""; */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>


<script src="js/user.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
	<div id="content">
		<table width=0 border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td>
					<!--contents--> <br />
					<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
						<caption style="text-align: left; font-weight: bold; padding-bottom: 7px">
							<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
							사용자관리 > 회원가입
						</caption>
					</table> <!-- write Form  -->
					<form name="f" method="post">
						<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">
									아이디</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input onclick="openIdCheck();" type="text" style="width: 150px" name="u_id"  value="" readonly="readonly">&nbsp;&nbsp;
											<input type="button" style="font: inherit;"  value="아이디중복검사" onclick="openIdCheck();">
											<font color="red"><%=msg%></font>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input type="password" style="width: 150px" name="user_password" value="<%=fuser.getUser_password()%>"></td>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호
									확인</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input type="password" style="width: 150px" name="user_password2" value="<%=fuser.getUser_password()%>"></td>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input type="text" style="width: 150px" name="user_name" value="<%=fuser.getUser_name()%>"></td>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">이메일
									주소</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input type="text" style="width: 150px" name="user_email" value="<%=fuser.getUser_email()%>"></td>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">핸드폰
									번호</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input type="text" style="width: 150px" name="user_phone" value="<%=fuser.getUser_email()%>"></td>
							</tr>
							<tr>
								<td width=100 align=center bgcolor="E6ECDE" height="22">포인트</td>
								<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
								<input disabled="disabled" type="text" style="width: 150px" name="user_point" value="1000">
								<input type="hidden" name="point" value="1000">
							</td>
							</tr>
						</table>
					</form> <br />

					<table border=0 cellpadding=0 cellspacing=1>
						<tr>
							<td align=center>
							<input type="button" style="font: inherit;" value="회원 가입" onclick="userCreate()"> &nbsp; 
							<input type="button" style="font: inherit;" value="취소" onClick="userCreate_cancel()"></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>
<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->

	

</body>
</html>