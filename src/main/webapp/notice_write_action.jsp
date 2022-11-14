<%@page import="com.itwill.bakery.service.NoticeService"%>
<%@page import="com.itwill.bakery.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("notice_list.jsp");
		return;
	}

	Notice notice = new Notice();
	notice.setNotice_title(request.getParameter("notice_title"));
	notice.setNotice_content(request.getParameter("notice_content"));

	NoticeService.getInstance().createNotice(notice);
	response.sendRedirect("notice_list.jsp");
	

%>