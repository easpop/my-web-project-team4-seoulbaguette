<%@page import="com.itwill.bakery.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String p_noStr="9";
if(p_noStr==null||p_noStr.equals("")){
response.sendRedirect("product_list.jsp");
return;
}
boolean isLogin = false;
if(session.getAttribute("sUserId")!=null){
isLogin=true;
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
<script src="js/product.js">


</script>
<script src="js/test.js"></script>
</head>
<body>
<form name="product_detail_form">
<input type="hidden" name="p_no" value="<%=product.getP_no()%>">
<input type="hidden" name="cart_qty" value="1"> <input
type="hidden" name="buyType" value="direct">
</form>

<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
	<tr>
		<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>서울바게트 -
				제품상세페이지</b></td>
	</tr>
</table>
<!--
						<form name="f" method="post">
						-->
<table style="margin-left: 10px" border=0 width=80% height=376
	align=center>
	<tr valign=bottom>
		<td width=30% align=center class=t1><font size=2 color=#0000FF><b>수량</b></font></td>
		<td width=40% align=center class=t1><font size=2 color=#0000FF><b>상품명</b></font></td>
		<td width=30% align=center class=t1><font size=2 color=#0000FF><b>상품설명</b></font></td>
	</tr>
	<tr width=100%>
		<td colspan=3 height=5><hr color=#556b2f></td>
	</tr>
	<tr width=100%>
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
				</select> 개<br>
				<br> <input type=submit value="장바구니[이동]" /><br>
				<br> <input type=button onclick="add_cart_popup_window();"
					value="장바구니[계속쇼핑]" /> <input type="hidden" name=p_no
					value="<%=product.getP_no()%>">

			</form>
		</td>
		<td width=40% height=200 align=center><img border=0
			src='image/<%=product.getP_image()%>' width=120 height=200></td>
		<td width=30% height=200 class=t1>
			<ol type="disc">
				<li><b>상품명 : <%=product.getP_name()%>&nbsp;&nbsp;&nbsp;
				</b></li>
				<li><font color=#FF0000>판매가 : <%=product.getP_price()%>&nbsp;&nbsp;&nbsp;
				</font></li>
				<li><font color=#0000FF><%=product.getP_desc()%></font></li>
			</ol>
		</td>
	</tr>
	<tr>
		<td colSpan=3 height=21><hr color=#556b2f></td>
	</tr>
</table>
<!--
						</form>
						-->

<table border="0" cellpadding="0" cellspacing="1">
	<tr>
		<td align=center><input type="button" value="주문하기[주문폼]"
			onClick="order_test()"> &nbsp; <input type="button"
			value="상품리스트" onClick="productList();"></td>
	</tr>
</table>
</td>
</tr>
</table>

<form name="f" method="post">
	<table align=center width=80% border="0" cellpadding="0"
		cellspacing="1" bgcolor="BBBBBB">
		<tr>
			<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>작성자</font></td>
			<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>제목</font></td>
			<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>작성날짜</font></td>
			<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>별점</font></td>

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
				}else {
					out.print(review.getUser_id());
				}
				%>
			</td>
			<td width=145 height=26 align=center bgcolor="ffffff" class=t1><a
				href="review_view.jsp?r_no=<%=review.getR_no()%>" class=m1><%=review.getR_title()%></a></td>
			<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=review.getR_date().substring(0,11) %></td>
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



</body>
</html>