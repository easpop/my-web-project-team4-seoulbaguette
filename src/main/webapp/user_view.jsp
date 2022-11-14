<%@page import="com.itwill.bakery.vo.User"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="user_login_check.jspf"%> 
<%

UserService userService = new UserService();
User user = userService.selectUser(sUserId);
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
<script src="js/review.js"></script>
<script src="js/coupon.js"></script>
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
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>

									<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									내정보 관리 > 내정보 보기
								</caption>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 height=30 align=center bgcolor="E2E2E2" height="22">
											아이디</td>
										<td width=490 height=30 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getUser_id()%>
										</td>
									</tr>
									<tr>
										<td width=100  height=30 align=center bgcolor="E2E2E2" height="22">이름</td>
										<td width=490  height=30 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getUser_name()%>
										</td>
									</tr>
									<tr>
										<td width=100 height=30  align=center bgcolor="E2E2E2" height="22">이메일
											주소</td>
										<td width=490 height=30  bgcolor="ffffff" style="padding-left: 10">
											<%=user.getUser_email()%>
										</td>
									</tr>
									<tr>
										<td width=100 height=30  align=center bgcolor="E2E2E2" height="22">핸드폰
											번호</td>
										<td width=490  height=30 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getUser_phone()%>
										</td>
									</tr>
									<tr>
										<td width=100  height=30 align=center bgcolor="E2E2E2" height="22">포인트
										</td>
										<td width=490 height=30  bgcolor="ffffff" style="padding-left: 10">
											<%=user.getUser_point()%>
										</td>
									</tr>
									<tr>
										<td width=100  height=30 align=center bgcolor="E2E2E2" height="22">주소록
										</td>
										<td width=490 height=30  bgcolor="ffffff" style="padding-left: 10">
											<input type="button" style="font: inherit;" value="주소록 상세보기" onClick="userAddress()">&nbsp;
										</td>
									</tr>
									<tr>
										<td width=100  height=30 align=center bgcolor=E2E2E2 height="22">리뷰
										</td>
										<td width=490 height=30  bgcolor="ffffff" style="padding-left: 10">
											<input type="button" style="font: inherit;" value="내가 작성한 리뷰" onClick="memberReview()">
										</td>
									</tr>
									<tr>
										<td width=100  height=30 align=center bgcolor=E2E2E2 height="22">쿠폰
										</td>
										<td width=490 height=30  bgcolor="ffffff" style="padding-left: 10">
											<input type="button" style="font: inherit;" value="내가 보유한 쿠폰" onClick="couponUserList()">
										</td>
									</tr>
									<tr>
										<td width=100  height=30 align=center bgcolor=E2E2E2 height="22">주문 내역
										</td>
										<td width=490 height=30  bgcolor="ffffff" style="padding-left: 10">
											<input type="button" style="font: inherit;" value="내가 주문한 내역" onClick="userOrderList()">
										</td>
									</tr>

								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=right>
									<input type="button" style="font: inherit;" value="내정보수정" onClick="userModify()">&nbsp; 
									<input type="button" style="font: inherit;" value="탈퇴" onClick="userPasswordCheck()">&nbsp; 
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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>