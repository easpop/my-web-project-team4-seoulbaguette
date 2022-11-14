<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@page import="com.itwill.bakery.vo.Cart"%>
<%@page import="com.itwill.bakery.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	CartService cartService = new CartService();
	ProductService productService = new ProductService();
	String cart_qtyStr=request.getParameter("cart_qty");
   	String p_noStr=request.getParameter("p_no");
	cartService.CreateCart(sUserId,Integer.parseInt(p_noStr),Integer.parseInt(cart_qtyStr));
	response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
</head>
<body>
		<%-- 
		상품 수량: <%=cart.getCart_qty() %><br>
		상품 이름: <%=cart.getProduct().getP_name() %><br>
		상품 가격: <%=cart.getProduct().getP_price() %><br>
		상품 설명: <%=cart.getProduct().getP_desc() %><br>
		주문 아이디: <%=cart.getUser_id() %><br>
		<br>
		<br>
		 --%>

</body>
</html>