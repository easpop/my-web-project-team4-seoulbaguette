<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="user_login_check.jspf"%>
<%

int period = 10;
int discount = ((int)Math.round((Math.random()*5))*10)+10;

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
table.coupon_list {
	width: 75%;
	display: block;
}
</style>

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
						<td><br />
							<form name="f" method="post">
								<input type="hidden" name="period" value="<%=period%>">
								<input type="hidden" name="discount" value="<%=discount%>">
								<table align=center width=100% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption
										style="text-align: left; font-weight: bold; padding-bottom: 7px">
										<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp; 랜덤 쿠폰
										발급

									</caption>
								</table>
								<br> <br> <br>

								<!-- coupon item start -->

								<table class="coupon_list" align=center border="0"
									cellpadding="0" cellspacing="1" bgcolor="FFFFE4"
									style="padding: 0px; border: 4px double #000000;">
									<tr>
										<td width=20% height=70 align=left class=t1></td>
										<td width=42% height=70 align=center class=t1></td>
										<td width=38% height=70 align=left class=t1
											style="font-size: 10pt; font-weight: bold">RANDOM COUPON

										
									</tr>
									<tr>

										<td style="font-size: 45pt" width=25% height=70 align=center
											class=t1>&nbsp;&nbsp;&nbsp;<%=discount%>%
										</td>
										<td height=70 align=center class=t1></td>
										<td height=70 align=center class=t1></td>

									</tr>
									<tr>

										<td height=70 align=center class=t1></td>
										<td height=70 align=center class=t1></td>
										<td height=70 align="left" class=t1
											style="font-size: 10pt; font-weight: bold">유효기간 : <%=period%>일
										</td>
									</tr>
								</table>
								<br> <br> <br>
								<!-- coupon item end -->
								<table border="0" cellpadding="0" cellspacing="1" width="590">
									<tr>

										<td><input type="button" value="발급"
											onclick="couponCreate()"></td>
									</tr>
								</table>
							</form> <br /> <br /> <br /></td>
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