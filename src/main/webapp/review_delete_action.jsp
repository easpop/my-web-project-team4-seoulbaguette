<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%> 

<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("review_write_form.jsp");
	return;
}


String r_no=request.getParameter("r_no");

ReviewService reviewService=new ReviewService();
try{
	reviewService.deleteReivew(Integer.parseInt(r_no));
	response.sendRedirect("review_list_user.jsp");
	
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