<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="user_login_check.jspf"%>
    <%
    
    String period=request.getParameter("period");
    if(period==null||period.equals("")){
    	response.sendRedirect("review_list_product.jsp");
    	return;
    }
    String discount=request.getParameter("discount");
    
    CouponService couponService=new CouponService();
    Coupon coupon=new Coupon(0,null,null,Integer.parseInt(discount),sUserId,Integer.parseInt(period));
    
    
    couponService.createCoupon(coupon);
    response.sendRedirect("coupon_list_user.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
</head>
<body>

</body>
</html>