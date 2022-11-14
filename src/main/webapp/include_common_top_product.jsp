<%@page import="com.itwill.bakery.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
	<%
	String sUserId=(String)session.getAttribute("s_u_id");
%>	
<div id="menu" >
	<div id="menu_title" OnClick="location.href ='bakery_main.jsp'"><img src="image/llogo.png" width="200" height="60"></div>
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
		<li><a href="cart_view_select_update_qyt_all_check_delete_image.jsp">CART<span class="w3-badge w3-green w3-margin-right">[<%=cart_item_count%>]</span></a></li>
		<%} %>
	</ul>
</div>
<div id="sub_menu">
	<ul>
		
		<li id="tatal"><a href="product_list.jsp?category_no=0">TOTAL</a></li>
		<li id="bread"><a href="product_list.jsp?category_no=1">BREAD</a></li>
		<li id="cake"><a href="product_list.jsp?category_no=2">CAKE</a></li>
		<li id="sandwich"><a href="product_list.jsp?category_no=3">SANDWICH</a></li>
	</ul>
</div>