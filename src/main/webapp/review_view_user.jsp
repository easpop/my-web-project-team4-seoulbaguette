<%@page import="com.itwill.bakery.vo.Review"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="user_login_check.jspf"%>
<%
String r_no = request.getParameter("r_no");

if (r_no == null || r_no.equals("")) {
	response.sendRedirect("review_list_user.jsp");
	return;
}

ReviewService reviewService = new ReviewService();
Review review = reviewService.selectReview(Integer.parseInt(r_no));
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
<script src="js/review.js"></script>
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
								<input type="hidden" name="r_no" value="<%=review.getR_no()%>">
								<table align="center" width="80%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="#FFFFFF">
									<caption
										style="text-align: left; font-weight: bold; padding-bottom: 7px">
										<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;리뷰 > 상세보기<br><br>
									</caption>
									<tr>
										<td width="81px" height="83px" align=center bgcolor="#FFFFFF"
											class=t1 style="border: 1px solid #aaa;"><img
											src="image/<%=review.getProduct().getP_image()%>" width="80px" height="80px">
										</td>
										<td width=602 height=80 align=left bgcolor="ffffff" class=t1
											style="padding-left: 20px; font-size: 10pt; font-weight: bold">
											<%=review.getProduct().getP_name()%></td>

									</tr>
								</table>
								<br>

								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<!-- order item start -->
									<tr>
										<td width=30 height=50 align=left bgcolor="ffffff" class=t1
											colspan="5" style="font-size: 10pt; font-weight: bold">
											&nbsp;&nbsp;&nbsp;<%=review.getR_title()%>
										</td>


									</tr>
									<tr>
										<td width=100 height=40 align=center bgcolor="ffffff" class=t1>
											<%
											for (int s = 0; s < review.getR_stargrade(); s++) {

												out.print("★");
											}
											%>
										</td>
										<td width=260 height=40 align=center bgcolor="ffffff" class=t1>
											<%=review.getUser_id() %></td>
										<td width=109 height=40 align=center bgcolor="ffffff" class=t1
											colspan="3"><%=review.getR_date().substring(0, 16)%></td>
									</tr>
									<tr>
										<td width=30 height=80 align=left bgcolor="ffffff" class=t1
											colspan="5">&nbsp;&nbsp;&nbsp;<%=review.getR_content()%>
										</td>


									</tr>
									<!-- order item end -->
								</table>

							</form> <br /> <br /> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center><input type="button" value="뒤로가기" onclick="memberReview()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="삭제" onclick="reviewRemove()">
										<input type="button" value="수정" onclick="reviewModify()">
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->

	</div>
	<!--container end-->
</body>
</html>