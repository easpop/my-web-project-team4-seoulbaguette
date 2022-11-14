<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	  response.sendRedirect("user_login_form.jsp");
	 return;
}
String user_id = (String) request.getParameter("userId");
String user_password = (String) request.getParameter("password");
UserService userService = new UserService();
int result = userService.login(user_id, user_password);



if(result==1){//성공
	 session.setAttribute("s_u_id", user_id);
	 session.setAttribute("sUser", result);
	 response.sendRedirect("bakery_main.jsp");
}else if(result==0){//아이디없음
	String msg = user_id+"는 존재하지 않는 아이디 입니다.";
	
	request.setAttribute("msg1", msg);
	RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
	rd.forward(request, response);
}else if(result==2){//패스워드 불일치
	String msg = "비밀번호가 일치하지 않습니다.";
	request.setAttribute("msg2", msg);
	request.setAttribute("loginId", user_id);
	RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
	rd.forward(request, response);
}


%>
