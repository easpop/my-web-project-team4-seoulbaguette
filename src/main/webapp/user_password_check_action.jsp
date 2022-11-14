<%@page import="com.itwill.bakery.vo.User"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="user_login_check.jspf"%>
    
    <%
    UserService userService=new UserService();
    User user=userService.selectUser(sUserId);
    
    String password=request.getParameter("user_password");
    
    boolean check=user.isMatchPassword(password);
    
    if(check){
    	
    	RequestDispatcher rd=request.getRequestDispatcher("user_remove_action.jsp");
		rd.forward(request, response);
    	
    }else{
    	String msg2="비밀번호가 일치하지 않습니다.";
    	request.setAttribute("msg2", msg2);
		RequestDispatcher rd=request.getRequestDispatcher("user_password_check_form.jsp");
		rd.forward(request, response);
    	
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