<%@page import="com.itwill.bakery.vo.Coupon"%>
<%@page import="com.itwill.bakery.service.CouponService"%>
<%@page import="com.itwill.bakery.vo.Address"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.service.CartService"%>
<%@page import="com.itwill.bakery.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>    
 
 <%
 CouponService couponService = new CouponService();
 
 String buyType=request.getParameter("buyType");
	String p_noStr=request.getParameter("p_no");
	String p_qtyStr=request.getParameter("p_qty");
	String add_select = request.getParameter("add_select");
	String coupon_select = request.getParameter("coupon_select");


	
	
	int o_price=Integer.parseInt(request.getParameter("changeTot"));
	int o_point=Integer.parseInt(request.getParameter("changePointTot"));
	int total_price=o_price;
	Coupon coupon = couponService.selectCoupon(new Coupon(Integer.parseInt(coupon_select), null, null, 0, null, 0));
	/* if(coupon_select.equalsIgnoreCase("None")){
		total_price = o_price;
	}else{
		coupon = couponService.selectCoupon(new Coupon(Integer.parseInt(coupon_select), null, null, 0, null, 0));
		int discount = coupon.getC_discount();
		total_price = (o_price*(100-discount))/100;
	} */
	
	System.out.println(add_select);
	
	String[] cart_item_no_strArray=request.getParameterValues("cart_item_no");
	OrderService orderService=new OrderService();
	CartService cartService=new CartService();
	UserService userService = new UserService();
	User p_User = userService.selectUser(sUserId);
	p_User.setUser_point(o_point);
	
	if(buyType.equals("cart")){
		orderService.create(sUserId);
	}else if(buyType.equals("cart_select")){
		
		orderService.createTest(sUserId,cart_item_no_strArray,total_price,Integer.parseInt(add_select));	
		userService.updatePoint(p_User);
		if(coupon_select.equalsIgnoreCase("0")){
			
		}else{
			couponService.useCoupon(coupon.getC_no());
		}
		
		
 }else if(buyType.equals("direct")){
	orderService.createTest(sUserId, Integer.parseInt(p_noStr), Integer.parseInt(p_qtyStr),Integer.parseInt(add_select),total_price);
	userService.updatePoint(p_User);
	if(coupon_select.equalsIgnoreCase("0")){
	
	}else{
		couponService.useCoupon(coupon.getC_no());
	}

	}
	response.sendRedirect("order_list.jsp");
 	
 %>
