<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bakery.vo.Cart"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="com.itwill.bakery.vo.Address"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.CartService"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.service.OrderService"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="user_login_check.jspf"%>
<%
CartService cartService=new CartService();
ArrayList<Cart> cartList=cartService.selectCartList(sUserId);

String buyType = request.getParameter("buyType");
String p_no = request.getParameter("p_no");

String c_qty = request.getParameter("cart_qty");

String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");

if (buyType == null)
   buyType = "";
if (request.getAttribute("p_no") == null){
   p_no = request.getParameter("p_no");
}else{
	p_no=(String)request.getAttribute("p_no");
}
if (request.getAttribute("c_qty") == null){
	   c_qty = request.getParameter("cart_qty");;
	}else{
		c_qty=(String)request.getAttribute("c_qty");
	}



if (cart_item_noStr_array == null)
   cart_item_noStr_array = new String[]{};

UserService userService = new UserService();
ProductService productService = new ProductService();

List<Address> userAddress=userService.selectAddress(new User(sUserId,"","","","",0,null));

List<Cart> cartItemList = new ArrayList<Cart>();
Address add = userService.selectAddressno(7);
User user = userService.selectUser(sUserId);


if (buyType.equals("cart")) {
   cartItemList = cartService.selectCartList(sUserId);
} else if (buyType.equals("cart_select")) {
   for (String cart_item_noStr : cart_item_noStr_array) {
      cartItemList.add(cartService.selectCart(Integer.parseInt(cart_item_noStr)));
   }
} else if (buyType.equals("direct")) {
   Product product = productService.selectByNo(Integer.parseInt(p_no));
   cartItemList.add(new Cart(0, Integer.parseInt(c_qty), product, user.getUser_id()));
}



int tot_price = 0;
int remain_point = 0;

for (Cart cart : cartItemList) {
   tot_price += cart.getCart_qty() * cart.getProduct().getP_price();
}

int point=0;
if(request.getAttribute("remainPoint")==null){
	
	point=0;
	remain_point = user.getUser_point() - point;
}else{
	point=(Integer)request.getAttribute("remainPoint");
	remain_point = user.getUser_point() - point;
}

int coupon=0;

if(request.getAttribute("coupon_select")==null){
	coupon=0;
}else{
	coupon= (Integer)request.getAttribute("coupon_select");
} 

double dis=(100-coupon)/100.0;

int c_no=0;
if(request.getAttribute("selectC")==null){
	c_no=0;
}else{
	c_no= (Integer)request.getAttribute("selectC");
} 

int add_no=0;
String addStr=(String)request.getAttribute("add_select");
if(request.getAttribute("add_select")==null){
	add_no=0;
}else{
	add_no= Integer.parseInt(addStr);
} 
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

<script type="text/javascript">
	function changeNumber(desc, formId) {
		console.log(formId);
		var form = document.getElementById(formId);
		if (desc == '+') {
			form.cart_qty.value = parseInt(form.cart_qty.value) + 1;

		} else if (desc == '-') {
			if (form.cart_qty.value - 1 >= 0) {
				form.cart_qty.value = parseInt(form.cart_qty.value) - 1;
			}
		}

		form.method = 'POST';
		form.action = 'cart_update_item_action.jsp';
		form.submit();
	}
	/*
	cart item1개삭제하기
	 */
	function cart_delete_item_action(formId) {
		if(window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'cart_delete_item_action.jsp';
			form.submit();
		}
		
	}
	/*
	cart 전체삭제(비우기)
	 */
	function cart_delete() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_action.jsp';
		document.cart_view_form.submit();
	}
	function cart_view_form_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.buyType.value = 'cart';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	
	function cart_view_form_select_submit() {
		var cart_item_no_check_list = document
				.getElementsByName("cart_item_no_check");
		var isChecked = false;
		for (var i = 0; i < cart_item_no_check_list.length; i++) {
			if (cart_item_no_check_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('제품을선택해주세요');

			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	function cart_item_all_select_checkbox_deselect(){
		document.getElementById('all_select_checkbox').checked=false;
	}
	/*
	cart 아이템카운트갱신,cart_view_form 갱신
	*/
	function cart_item_select_count(){
			var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
			var cart_item_check_selected_count = 0;
			document.cart_view_form.innerHTML ='';
			document.cart_view_form.innerHTML +="<input type='hidden' name='buyType'>";
			var tot_order_price=0;
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				if (cart_item_no_check_list.item(i).checked === true) {
					document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"+ cart_item_no_check_list.item(i).value + "'>";
					var updateFormId='cart_update_form_'+ cart_item_no_check_list.item(i).value;
					var cart_qty=document.getElementById(updateFormId).cart_qty.value;
					var cart_product_unit_price=document.getElementById(updateFormId).cart_product_unit_price.value;
					tot_order_price+=cart_qty*cart_product_unit_price;
					cart_item_check_selected_count++;
				}
			}
			document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
			document.getElementById('tot_order_price').innerHTML = tot_order_price.toLocaleString();
			
	}
	/*
	cart 아이템전체선택해제
	*/
	function cart_item_all_select(e){
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
		if(e.target.checked){
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=true;
			}
		}else{
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=false;
			}
		}
	}
</script>
</head>
<body onload="cart_item_select_count();" bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin:0">
		<input type="hidden" name="buyType">
	</form>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp" />
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
									서울바게트 > 장바구니 보기
								</caption>
							</table> <!--form--> <!-- 
							<form name="f" method="post">
							 -->
							<div id='f'>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=60 height=25 align="center" bgcolor="E6ECDE"
											class=t1><input type="checkbox" id="all_select_checkbox" checked="checked" onchange="cart_item_all_select(event);cart_item_select_count();"></td>
										<td width=40 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>상품</font></td>
										<td width=210 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>상품명</font></td>
										<td width=112 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>수 량</font></td>
										<td width=146 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>금 액</font></td>
										<td width=50 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>삭 제</font></td>
									</tr>
									<!-- cart item start -->
									<%
									for (Cart cart : cartList) {
										tot_price += cart.getProduct().getP_price() * cart.getCart_qty();
									%>
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1>
										 <input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect();cart_item_select_count();" value="<%=cart.getCart_no()%>" checked="checked">
										</td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1>
											<img src='image/<%=cart.getProduct().getP_image()%>' width="34" height="28" />
										</td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
										</td>

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
											<form  method="post"
												id="cart_update_form_<%=cart.getCart_no()%>">
												<input type="hidden" name="cart_no"
													value="<%=cart.getCart_no()%>"> <input
													type="button" value="-"
													onclick="changeNumber('-','cart_update_form_<%=cart.getCart_no()%>');"/>
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="cart_qty"
													value="<%=cart.getCart_qty()%>">
												<input type="button" value="+"
													onclick="changeNumber('+','cart_update_form_<%=cart.getCart_no()%>');"/>
												<input type="hidden" name="cart_product_unit_price" value="<%=cart.getProduct().getP_price()%>"/>	
											</form>
										</td>

										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,##0").format(cart.getProduct().getP_price() * cart.getCart_qty())%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>

											<%-- 
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="<%=cart.getCart_no()%>">
												<input type="submit" value="삭제">
											</form>
											 --%>
											<form id="cart_delete_item_form_<%=cart.getCart_no()%>">
												<input type="hidden" name="cart_no"
													value="<%=cart.getCart_no()%>"> <a
													href="javascript:cart_delete_item_action('cart_delete_item_form_<%=cart.getCart_no()%>');">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 28 28" class="icon--close">
													<g fill="none" fill-rule="evenodd"> <path
														d="M0 0H28V28H0z"></path> <g fill="#9B9BA0"
														transform="translate(6 6)" class="icon--close__group">
													<rect width="2" height="18" x="7" y="-1" rx="1"
														transform="rotate(-135 8 8)"></rect> <rect width="2"
														height="18" x="7" y="-1" rx="1"
														transform="rotate(-45 8 8)"></rect> </g> </g> </svg>
												</a>
											</form>

										</td>
									</tr>
									<%}%>
									<!-- cart item end -->



									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br /> 
												<font color='red'>총주문금액 : <span id="tot_order_price"><%=new DecimalFormat("#,##0").format(tot_price)%></span> 원</font>&nbsp;&nbsp;&nbsp;
											</p>
										</td>
									</tr>
								</table>

							</div> <!-- 
							</form> 
							 --> <br />

							<table style="padding-left: 10px" border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a href="product_list.jsp"
										class=m1>계속 구경하기</a>&nbsp;&nbsp; <%
										 if (cartList.size() >= 1) {
										 %> <a href="javascript:cart_view_form_select_submit();" class=m1>
										 	총 <span style="font-weight: bold;" id="cart_item_select_count"></span>개 주문하기[주문폼]
										 	</a>&nbsp;&nbsp;
											<a href="javascript:cart_delete();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;
											<%
											}
											%>
									</td>
								</tr>
							</table></td>
					</tr>
				<br>
					<%-- <%
					for (Cart cart : cartList) {
                           %>
                           <!-- cart item start -->
                           <tr>
                              <td width=290 height=26 align=center bgcolor="ffffff" class=t1>
                                 <a
                                 href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
                              </td>
                              <td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getCart_qty()%></td>
                              <td width=166 height=26 align=center bgcolor="ffffff" class=t1>
                                 <%=new DecimalFormat("#,##0").format(cart.getCart_qty() * cart.getProduct().getP_price())%>
                              </td>
                              <td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
                           </tr>
                           <!-- cart item end -->
                           <%
                           }
                           %> --%>
					
						
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