<%@page import="com.itwill.bakery.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%
	String j_noStr = request.getParameter("j_no");
	OrderService orderService = new OrderService();
	orderService.deleteByOrderNo(Integer.parseInt(j_noStr));
	response.sendRedirect("order_list.jsp");
%>