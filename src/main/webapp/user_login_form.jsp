<%@page import="com.itwill.bakery.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
String loginId = (String)request.getAttribute("loginId");
if(loginId == null) loginId = "";
String msg1 = (String)request.getAttribute("msg1");
if(msg1 == null) msg1 = "";
String msg2 = (String)request.getAttribute("msg2");
if(msg2 == null) msg2 = "";
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
<script type="text/javascript" src=js/user.js></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form method="post" action="user_login_action.jsp"></form>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp"/>
			<!-- include_common_top.jsp end-->
	
		</div>
		<!-- header end -->
		
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
	
			<div id="content">

				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									LOGIN
								</caption>
							</table> <!-- login Form  -->
							<br><br><br>
							<form name="f" >
								<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor= "E2E2E2"  height="40">사용자
											아이디</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150px; height:15px; font-size: 18px;"  name="userId" value="<%=loginId%>">&nbsp;&nbsp;<font color="red"><%=msg1%></font></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E2E2E2"  height="40">비밀번호</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="password"
											style="width: 150px; height:15px; font-size: 18px" name="password" value="">&nbsp;&nbsp;<font color="red"><%=msg2%></font></td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" style="font: inherit;" value="로그인"	onClick="login();"> &nbsp; 
									<input type="button" style="font: inherit;" value="회원가입" onClick="userCreateForm()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
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