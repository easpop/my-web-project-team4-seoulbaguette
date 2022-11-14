<%@page import="com.itwill.bakery.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%

	String sUser_id=(String)session.getAttribute("s_u_id");

	Integer notice_no=null;
	Integer pageno=null;
	Integer groupno=null;
	try {
		notice_no=Integer.valueOf(request.getParameter("notice_no"));
		pageno=Integer.valueOf(request.getParameter("pageno"));
		groupno=Integer.valueOf(request.getParameter("groupno"));
	}catch(Exception ex){
	}
	boolean result=true;
	
	String msg="";
	if(notice_no==null){
		result=false;
		msg="삭제실패";
	}else{
		try{
			NoticeService.getInstance().deleteNotice(notice_no);
			result=true;
			msg="삭제성공";
		}catch(Exception ex){
			result=false;
			msg="삭제실패";
				
		}
	}
	
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='notice_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	location.href='notice_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>
