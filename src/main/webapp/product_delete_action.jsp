<%@page import="com.itwill.bakery.service.ProductService"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}

	String noStr=request.getParameter("p_no");
	
	if(noStr==null||noStr.equals("")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	
	ProductService productService = new ProductService();
	try{
		productService.delete(Integer.parseInt(noStr));
		response.sendRedirect("product_list.jsp");
	} catch(Exception e){
		e.printStackTrace();
	}

%>

