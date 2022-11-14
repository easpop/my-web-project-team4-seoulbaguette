<%@page import="com.itwill.bakery.service.CouponService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int c_no=Integer.parseInt(request.getParameter("c_no"));
    CouponService couponService=new CouponService();
    try{
    couponService.useCoupon(c_no);
    response.sendRedirect("coupon_list_user.jsp");
    }catch(Exception e){
    	e.printStackTrace();
    }
    
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