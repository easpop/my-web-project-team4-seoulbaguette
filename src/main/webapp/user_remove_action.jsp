<%@page import="com.itwill.bakery.service.UserService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%> 
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shop_main.jsp");
	return;	
} 

UserService userService= new UserService();
try{
	userService.deleteUser(sUserId);
	//response.sendRedirect("user_logout_action.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
<script type="text/javascript">

alert("탈퇴되었습니다.");
location.href='user_logout_action.jsp';
</script>
</head>
<body>

</body>
</html>