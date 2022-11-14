<%@page import="com.itwill.bakery.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%
	CartService cartService=new CartService();
	String cart_noStr=request.getParameter("cart_no");
	String cart_qtyStr= request.getParameter("cart_qty");
	
	if(cart_qtyStr.equals("0")){
		cartService.deleteCartByCNo(Integer.parseInt(cart_noStr));
		response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
	}else{
		cartService.updateQty(sUserId, Integer.parseInt(cart_noStr), Integer.parseInt(cart_qtyStr));
		response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>