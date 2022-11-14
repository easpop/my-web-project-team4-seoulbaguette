<%@page import="com.itwill.bakery.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 
	<%
	String sUserId=(String)session.getAttribute("s_u_id");
%>	
<script type="text/javascript">
	 function login_message() {
		alert('로그인하세요');
		location.href = 'userinfo_login_form.jsp';
	}
</script>

<div id="menu">
	<div id="menu_title" OnClick="location.href ='bakery_main.jsp'"><img src="image/llogo.png" width="200" height="60" text-align="left"></div>
	<ul>
	<%
		if(sUserId==null){
	%>

		<li id="logo"><a href="bakery_main.jsp"></a></li>
		<li><a href="user_login_form.jsp">LOGIN</a></li>
		<li><a href="user_login_form.jsp">MYPAGE</a></li>
		<li><a href="user_login_form.jsp">CART</a></li>
		<%}else{ 
			CartService cartService=new CartService();
		  	int cart_item_count = cartService.selectCartList(sUserId).size();
		%>
		<li id="logo"><a href="bakery_main.jsp"></a></li>
		<li><a href="user_logout_action.jsp">LOGOUT</a></li>
		<li><a href="user_view.jsp">MYPAGE</a></li>
		<span class="w3-badge w3-green w3-margin-right"></span>
		<li><a href="cart_view_select_update_qyt_all_check_delete_image.jsp">CART<span class="w3-badge w3-green w3-margin-right">[<%=cart_item_count%>]</span></a></li>
			<%} %>
	</ul>
</div>
<div id="sub_menu">
	<ul>
		<li id="menu_product"><a href="product_list.jsp">PRODUCT</a></li>
		<li id="menu_notice"><a href="notice_list.jsp">NOTICE</a></li>
		<li id="menu_qna"><a href="qna_list.jsp">Q&A</a></li>
		<li id="menu_coupon"><a href="coupon_create_form.jsp">EVENT</a></li>
	</ul>
</div>