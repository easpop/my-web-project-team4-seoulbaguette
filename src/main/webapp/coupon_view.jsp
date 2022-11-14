<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String c_no = request.getParameter("c_no");

CouponService couponService = new CouponService();
Coupon coupon = couponService.selectCoupon(new Coupon(Integer.parseInt(c_no), null, null, 0, null, 0));
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
							<form name="f" method="post" action="order_delete_action.jsp"
								onsubmit="return check_delete_order()">
								<input type="hidden" name="o_no" value="131">
								<table align=center width=100% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption
										style="text-align: left; font-weight: bold; padding-bottom: 7px">
										<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;쿠폰1개
										상세보기
									</caption>
								</table>
								<br> <br> <br>

								<!-- coupon item start -->

								<table class="coupon_list" align=center border="0"
									cellpadding="0" cellspacing="1" bgcolor="BBBBBB"
									style="padding: 0px; border: 4px double #000000;">
									<tr>
										<td width=20% height=70 align=left class=t1></td>
										<td width=42% height=70 align=center class=t1></td>
										<td width=38% height=70 align=left class=t1
											style="font-size: 10pt; font-weight: bold">발급일자 :
											<%=coupon.getC_start_date() %></td>

									</tr>
									<tr>

										<td style="font-size: 45pt" width=25% height=70 align=center
											class=t1>&nbsp;&nbsp;&nbsp;<%=coupon.getC_discount() %>%</td>
										<td height=70 align=center class=t1></td>
										<td height=70 align=center class=t1></td>

									</tr>
									<tr>

										<td height=70 align=center class=t1></td>
										<td height=70 align=center class=t1></td>
										<td height=70 align="left" class=t1
											style="font-size: 10pt; font-weight: bold">쿠폰기한 :
											<%=coupon.getC_end_date().substring(0,11) %> 까지</td>
									</tr>
								</table>
								<br> <br> <br>
								<!-- coupon item end -->
								<table border="0" cellpadding="0" cellspacing="1" width="590">
									<tr>
										<td align=center><input type="button" value="취소">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="button" value="쿠폰적용"></td>
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
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>

	</div>
	<!--container end-->
</body>
</html>