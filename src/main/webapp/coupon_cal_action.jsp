<%@page import="com.itwill.bakery.service.CouponService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 
    CouponService couponService=new CouponService();
    
    int c_no=Integer.parseInt(request.getParameter("coupon_select"));
    if(c_no!=0){
    int dis=couponService.selectCoupon(c_no).getC_discount();
    request.setAttribute("coupon_select",dis);
    }
    int point=Integer.parseInt(request.getParameter("point"));
    
  	String p_no=request.getParameter("p_no");
  	String c_qtyStr = request.getParameter("p_qty");
  	String a_addno = request.getParameter("add_select");
  	
  	request.setAttribute("add_select",a_addno);
    request.setAttribute("remainPoint", point);
    request.setAttribute("p_no", p_no);
    request.setAttribute("c_qty", c_qtyStr);
    
    request.setAttribute("selectC",c_no);
    RequestDispatcher rd=request.getRequestDispatcher("order_create_form.jsp");
    rd.forward(request, response);
   
    
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