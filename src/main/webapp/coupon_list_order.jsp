<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="user_login_check.jspf"%>
<%
CouponService couponService = new CouponService();
List<Coupon> couponList = couponService.selectCouponById(sUserId);
String msg="";

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
	width: 50%;
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
						<td><br /> <!-- order 에서 넘어올 때 체크  -->
							<form name="f" method="post" action="order_delete_action.jsp"
								onsubmit="return check_delete_order()">
								<input type="hidden" name="o_no" value="131">
								<table align=center width=100% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption
										style="text-align: left; font-weight: bold; padding-bottom: 7px">
										<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
										사용가능한 쿠폰리스트
									</caption>
								</table>
								
								<!-- coupon item start -->
								<%for(Coupon coupon:couponList){%>
								<a href="coupon_view.jsp?c_no=<%=coupon.getC_no()%>">
									<table class="coupon_list" align=center border="0"
										cellpadding="0" cellspacing="1" bgcolor="BBBBBB"
										style="padding: 2px; border: 2px double #000000;">
										<tr>
											<td width=25% height=26 align=center class=t1></td>
											<td width=15% height=26 align=center class=t1></td>
											<td width=35% height=26 align=left class=t1
												style="font-size: 8pt; font-weight: bold">발급일자 :
												<%=coupon.getC_start_date().substring(0,11) %></td>

										</tr>
										<tr>

											<td style="font-size: 30pt" width=25% height=26 align=center
												class=t1><%=coupon.getC_discount() %>%</td>
											<td width=15% height=26 align=center class=t1></td>
											<td width=35% height=26 align=center class=t1></td>

										</tr>
										<tr>

											<td width=25% height=26 align=center class=t1></td>
											<td width=25% height=26 align=center class=t1></td>
											<td width=30% height=26 align="left" class=t1
												style="font-size: 8pt; font-weight: bold">쿠폰기한 :
												<%=coupon.getC_end_date().substring(0,11) %> 까지</td>
										</tr>
									</table>
								</a>
								<%} %>

								<!-- coupon item end -->

							

							</form></td>
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