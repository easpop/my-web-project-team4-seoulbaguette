<%@page import="com.itwill.bakery.service.NoticeService"%>
<%@page import="com.itwill.bakery.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Notice notice = new Notice();
notice.setNotice_no(Integer.parseInt(request.getParameter("notice_no")));
notice.setNotice_title(request.getParameter("notice_title"));
notice.setNotice_content(request.getParameter("notice_content"));
notice.setGroupno(Integer.parseInt(request.getParameter("groupno")));

NoticeService.getInstance().updateNotice(notice);

String pageno="1";
if(request.getParameter("pageno")!=null){
	pageno=request.getParameter("pageno");
}

response.sendRedirect(
		String.format("notice_view.jsp?notice_no=%d&pageno=%s&groupno=%d",
							notice.getNotice_no(),pageno,notice.getGroupno()));


%>