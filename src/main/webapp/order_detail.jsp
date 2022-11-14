<%@page import="com.itwill.bakery.service.OrderReviewService"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@page import="com.itwill.bakery.vo.OrderItem"%>
<%@page import="com.itwill.bakery.vo.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  

<%

String o_noStr=request.getParameter("o_no");
OrderService orderService = new OrderService();
Orders orders = orderService.detail(sUserId, Integer.parseInt(o_noStr));
ProductService productService = new ProductService();

OrderReviewService orderReviewService = new OrderReviewService();

int check = 1;
int i = 0;
String bName = "리뷰 보기";

UserService userService=new UserService();
String address=userService.selectAddressno(orders.getAdd_no()).getAddress();
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
<body>
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
						<tr>
							<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>서울바게트 > 주문상세조회</b></td>
						</tr>
					</table> <!--form-->
					<form name="f" method="post" action="order_delete_action.jsp">
						<input type="hidden" name="j_no" value="<%=orders.getO_no()%>"/>
						<table align="center" width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
							<caption style="text-align: left;">주문상세정보</caption>
							<tr>
								<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문번호</font></td>
								<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문일</font></td>
								<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문자</font></td>
								<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1><font>삭제</font></td>
							</tr>


							<tr>
								<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=orders.getO_no()%></td>
								<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=orders.getO_date()%></td>
								<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=orders.getUser_id()%></td>
								<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
									<input type="submit" value="삭제">
								</td>
							</tr>
						</table>
					</form> <br />
					<table align="center" width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
							<caption style="text-align: left;">배송지</caption>
							<tr>
								<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1><font>주소</font></td>
								
							</tr>


							<tr>
								<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=address%></td>
								
									
								</td>
							</tr>
						</table>
						<br>
					<table align=center width=80% border="0" cellpadding="0"
						cellspacing="1" bgcolor="BBBBBB">
						<caption style="text-align: left;">주문제품목록</caption>
						<tr style="border: 0.1px solid">
							<td width=230 height=25 align=center bgcolor="E6ECDE" class=t1>상품명</td>
							<td width=80 height=25 align=center bgcolor="E6ECDE" class=t1>수량</td>
							<td width=80 height=25 align=center bgcolor="E6ECDE" class=t1>금액</td>
							<td width=50 height=25 align=center bgcolor="E6ECDE" class=t1>리뷰
								</td>
						</tr>

						<!-- orer item start -->
						<%
						int tot_price = 0;
						for (OrderItem orderItem : orders.getOrderItemList()) {
							tot_price += orderItem.getOi_qty() * orderItem.getProduct().getP_price();
						%>



						<tr>
							<td width=230 height=26 align=center bgcolor="ffffff" class=t1>
								<a
								href='product_detail.jsp?p_no=<%=orderItem.getProduct().getP_no()%>'>
									<%=orderItem.getProduct().getP_name()%></a>
							</td>

							<td width=80 height=26 align=center bgcolor="ffffff" class=t1>
								<%=orderItem.getOi_qty()%>
							</td>

							<td width=80 height=26 align=center bgcolor="ffffff" class=t1>
								<%=new DecimalFormat("#,##0").format(orderItem.getOi_qty() * orderItem.getProduct().getP_price())%>
							</td>

							<td width=50 height=26 align=center class=t1 bgcolor="ffffff">
								<form name='f<%=i%>' method='post' onsubmit='return false'>
								<input type="hidden" name="o_no" value="<%=orders.getO_no() %>">
								<input type="hidden" name="oi_no" value="<%= orderItem.getOi_no()%>">
								<input type="hidden" name="p_no" value="<%=orderItem.getProduct().getP_no() %>">
									<%
									if (orderReviewService.checkOR(orderItem.getOi_no()) == 1) {
									%>

									<input type="hidden" name="r_no"
										value="<%=orderReviewService.returnRno(orderItem.getOi_no())%>" />

									<%
									check = 1;
									bName = "작성한 리뷰";
									}

									if(orderReviewService.checkOR(orderItem.getOi_no()) == 0) {
									check = 0;
									bName = "리뷰 작성";
									}
									%>
								</form> 
								<%if(orders.getO_desc().equals("배송완료")) {%>
								<input name="reviewBtn" type="button" value="<%=bName%>" onClick="review_writeCheck('f<%=i%>',<%=check%>)" />
								<%} %>
							</td>
						</tr>
						<%
						i++;
						%>
						<%
						}
						%>
						<!-- cart item end -->
						<tr>
							<td width=440 colspan=4 height=26 bgcolor="ffffff" class=t1>

								<p align=right style="padding-top: 10px">
									<font color=#FF0000>총 주문 금액 : <%=orders.getO_price()%>
										원&nbsp;&nbsp;&nbsp;
									</font>
								</p>
							</td>
						</tr>
					</table>
					</form> <br />
					<table border="0" cellpadding="0" cellspacing="1" width="590">
						<tr>
							<td align=center>&nbsp;&nbsp;<a href=order_list.jsp class=m1>주문목록</a>
								&nbsp;&nbsp;<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>