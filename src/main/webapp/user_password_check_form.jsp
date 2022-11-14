<%@page import="com.itwill.bakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%

String msg2 = (String) request.getAttribute("msg2");
if (msg2 == null)
	msg2 = "";
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
			<jsp:include page="include_common_top_main.jsp" />
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
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원탈퇴 -
											비밀번호 확인</b></td>
								</tr>
							</table> <!-- Form  -->
							<form name="f" method="post">

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="user_password" value="">&nbsp;&nbsp;<font
											color="red"><%=msg2%></font></td>
									</tr>


								</table>
							</form> <br>
							<table border=0 cellpadding=0 cellspacing=1>
								<tr>
									<td align=center><input type="button" value="확인"
										onclick="userPasswordCheckAction()"> &nbsp; <input
										type="button" value="취소" onClick="userModify_cancel()"></td>
								</tr>
							</table>

</table>

							</div> <!-- include_content.jsp end--> <!-- content end -->
							</div> <!--wrapper end-->
							<div id="footer">
								<!-- include_common_bottom.jsp start-->
								<jsp:include page="include_common_bottom.jsp" />
								<!-- include_common_bottom.jsp end-->
							</div>
							</div> <!--container end-->
</body>
</html>