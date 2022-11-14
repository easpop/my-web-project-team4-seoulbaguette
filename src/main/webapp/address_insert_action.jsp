<%@page import="com.itwill.bakery.vo.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="user_login_check.jspf"%>
    
    <%
    String addressStr=request.getParameter("address");
    UserService userService=new UserService();
    Address address=new Address(0,addressStr,sUserId);
    
    userService.createAddress(address);
    
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