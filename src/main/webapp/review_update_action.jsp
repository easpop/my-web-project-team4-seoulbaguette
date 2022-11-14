<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@page import="com.itwill.bakery.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="user_login_check.jspf"%> 
 --%>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("review_write_form.jsp");
	return;
}


String r_title=request.getParameter("r_title");
String r_stargrade=request.getParameter("r_stargrade");
String r_content=request.getParameter("r_content");
String r_no=request.getParameter("r_no");

ReviewService reviewService=new ReviewService();
Review review=new Review(Integer.parseInt(r_no),r_title,null,Integer.parseInt(r_stargrade),r_content,null ,null );
try{
reviewService.updateReview(review);
response.sendRedirect("review_view_user.jsp?r_no="+r_no);
}
catch(Exception e){
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