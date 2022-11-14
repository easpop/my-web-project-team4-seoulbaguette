<%@page import="com.itwill.bakery.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  

<%
      OrderService orderService=new OrderService();
      orderService.delete(sUserId);
      response.sendRedirect("order_list.jsp");
 %>


