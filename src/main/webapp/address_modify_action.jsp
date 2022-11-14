<%@page import="com.itwill.bakery.vo.Address"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="user_login_check.jspf"%>
<%
int add_no = Integer.parseInt(request.getParameter("add_no"));
String addressStr = request.getParameter("address");

UserService userService = new UserService();
Address address= new Address(add_no,addressStr,null);

userService.updateAddr(address);
response.sendRedirect("address_list.jsp");
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