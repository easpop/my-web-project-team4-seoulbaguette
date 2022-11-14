<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.bakery.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String p_noStr = request.getParameter("p_no");
if (p_noStr == null || p_noStr.equals("")) {
	response.sendRedirect("product_list.jsp");
	return;
}
boolean isLogin = false;
String sUserId=(String)session.getAttribute("s_u_id");
if (session.getAttribute("s_u_id") != null) {
	isLogin = true;
}

ReviewService reviewService = new ReviewService();
List<Review> reviewList = reviewService.selectReviewByP(Integer.parseInt(p_noStr));
ProductService productService = new ProductService();
Product product = productService.selectByNo(Integer.parseInt(p_noStr));
if (product == null) {
	out.println("<script>");
	out.println("alert('매진된상품입니다.');");
	out.println("location.href='product_list.jsp';");
	out.println("</script>");
	return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "[http://www.w3.org/TR/html4/loose.dtd](http://www.w3.org/TR/html4/loose.dtd)">
<html>
<head>

<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>

<script src="js/product.js">
	
</script>
<script src="js/admin.js"></script>
<script src="js/test.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0 >
	<form name="product_detail_form">
		<input type="hidden" name="p_no" value="<%=product.getP_no()%>">
		<input type="hidden" name="s_u_id" value="<%=sUserId%>"> <input
			type="hidden" name="cart_qty" value="1"> <input type="hidden"
			name="buyType" value="direct">
	</form>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_product.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->

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
									PRODUCT > 상세페이지
								</caption>
							</table> <!--
						<form name="f" method="post">
						-->
							<br> <br>
							<table style="margin-left: 10px" border=0 width=80% height=376
								align=center>
								<tr valign=bottom>
									<td width=40% align=center class=t1><font size=3
										color=#0000FF><b>상품</b></font></td>
									<td width=30% align=center class=t1><font size=3
										color=#0000FF><b>상품설명</b></font></td>
									<td width=30% align=center class=t1><font size=3
										color=#0000FF><b>수량</b></font></td>
								</tr>
								<tr width=100%>
									<td colspan=3 height=5><hr color=#556b2f></td>
								</tr>
								<tr width=100%>
									<td width=40% height=200 align=center><img border=0
										src='./image/<%=product.getP_image()%>' width=220 height=220></td>
									<td width=30% height=200 class=t1>
										<ul type="disc">
											<li><b><font size=2>상품명 : <%=product.getP_name()%></font>&nbsp;&nbsp;&nbsp;<br>
											</b></li>
											<li><font size=2 color=#FF0000>판매가 : <%=new DecimalFormat("#,##0").format(product.getP_price())%>
													원&nbsp;&nbsp;&nbsp;<br>
											</font></li>
											<li><font size=2 color=#0000FF><%=product.getP_desc()%></font></li>
										</ul> 

									</td>
									<td width=30% height=200 align=center class=t1>
										<form name="add_cart_form" method="post"
											action="cart_add_action.jsp" action="order_create_form.jsp">
											수량 :

											<!--
										 <input type=text name="cart_qty" value=1 size=4 class=TXTFLD>
										-->
											<select name="cart_qty">
												<option value="1">1
												<option value="2">2
												<option value="3">3
												<option value="4">4
												<option value="5">5
												<option value="6">6
												<option value="7">7
												<option value="8">8
												<option value="9">9
												<option value="10">10
											</select> 개<br> <br> <br>


											<%
											if (sUserId == null) {
											%>
											<input type=button style="font: inherit;" value="장바구니" onclick="log_in_popup_window();" /> 
											<input type="hidden" name=p_no value="<%=product.getP_no()%>"> 
											<input type="button" style="font: inherit;" value="바로주문" onClick="log_in_popup_window();"> <br> <br>
											<input type="button" style="font: inherit;" value="상품 리스트" onClick="productList();">

											<%
											} else if (sUserId.equals("admin")) {
											%>
											<input type=button style="font: inherit;" value="상품수정" onclick="productModifyForm();" /> 
											<input type="hidden" name=p_no value="<%=product.getP_no()%>"> 
											<input type="button" style="font: inherit;" value="상품삭제" onClick="productDelete();"> <br> <br> 
											<input type="button" style="font: inherit;" value="상품 리스트" onClick="productCancel();">

											<%
											} else {
											%>
											<input type=button style="font: inherit;" value="장바구니" onclick="add_cart_popup_window();" /> 
											<input type="hidden" name=p_no value="<%=product.getP_no()%>"> 
											<input type="button" style="font: inherit;" value="바로주문" onClick="order_create_form();"> <br> <br>
											<input type="button" style="font: inherit;" value="상품 리스트" onClick="productList();"><br>

											<%
											}
											%>
											<br>
										</form>
									</td>
								</tr>
								<tr>
									<td colSpan=3 height=21><hr color=#556b2f></td>
								</tr>
							</table> <!--
						</form>
						-->

							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
								</tr>
							</table></td>
					</tr>
				</table>



				<!-- review start -->
				<form name="f" method="post">
					<table align=center width=80% border="0" cellpadding="0"
						cellspacing="1" bgcolor="BBBBBB">

						<tr>
							<td width=145 height=25 bgcolor="E2E2E2" align=center class=t1><font>작성자</font></td>
							<td width=145 height=25 bgcolor="E2E2E2" align=center class=t1><font>제목</font></td>
							<td width=112 height=25 bgcolor="E2E2E2" align=center class=t1><font>작성날짜</font></td>
							<td width=136 height=25 bgcolor="E2E2E2" align=center class=t1><font>별점</font></td>

						</tr>

						<!-- order start -->
						<%
						for (Review review : reviewList) {
						%>

						<tr>
							<td width=145 height=26 align=center bgcolor="ffffff" class=t1>
								<%
								if (review.getUser_id() == null || review.getUser_id().equals("")) {
									out.print("탈퇴한 회원");
								} else {
									out.print(review.getUser_id());
								}
								%>
							</td>
							<td width=145 height=26 align=center bgcolor="ffffff" class=t1><a
								href="review_view_product.jsp?r_no=<%=review.getR_no()%>"
								class=m1><%=review.getR_title()%></a></td>
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
				</form>
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