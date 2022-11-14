<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%

ReviewService reviewService = new ReviewService();
List<Review> reviewList = reviewService.selectReviewById(sUserId);

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
<script src="js/review.js"></script>
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
		<table border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td><br />
					<table style="padding-left: 10px" border=0 cellpadding=0
						cellspacing=0>

								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
								마이페이지 > 내가 쓴 리뷰
								</caption>						
					</table> <!--form-->
					<form name="f" method="post">
						<table align=center width=80% border="0" cellpadding="0"
							cellspacing="1" bgcolor="BBBBBB">
							<tr>
								<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>상품</font></td>
								<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>제목</font></td>
								<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>작성날짜</font></td>
								<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>별점</font></td>

							</tr>

							<!-- order start -->
							<%
							for (Review review : reviewList) {
							%>

							<tr>
								<td width=145 height=26 align=center bgcolor="ffffff" class=t1><a
									href="product_detail.jsp?p_no=<%=review.getProduct().getP_no()%>"
									class=m1><%=review.getProduct().getP_name()%></a></td>
								<td width=145 height=26 align=center bgcolor="ffffff" class=t1><a
									href="review_view_user.jsp?r_no=<%=review.getR_no()%>" class=m1><%=review.getR_title()%></a></td>
								<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=review.getR_date().substring(0, 11)%></td>
								<td width=136 height=26 align=center bgcolor="ffffff" class=t1>
									<%
									for (int i = 0; i < review.getR_stargrade(); i++) {
										out.print("★");
									}
									%>
								</td>
							</tr>

							<%
							}
							%>
							<!-- order end -->




						</table>
					</form> <br />
					<table border="0" cellpadding="0" cellspacing="1" width="590">
						<tr>
							<td align=center>&nbsp;&nbsp; <input type="button"
								value="마이페이지로 돌아가기" onClick="returnMypage()" />
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
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->

	

</body>
</html>