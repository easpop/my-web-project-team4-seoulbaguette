<%@page import="com.itwill.bakery.service.QnAService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
<%
	String user_id=request.getParameter("user_id");
	String sUser_id=(String)session.getAttribute("s_u_id");

	Integer qna_no=null;
	Integer pageno=null;

	try {
		qna_no=Integer.valueOf(request.getParameter("qna_no"));
		pageno=Integer.valueOf(request.getParameter("pageno"));

	}catch(Exception ex){
	}
	
	QnAService qnaService = new QnAService();
	int removeCount=qnaService.remove(qna_no, sUser_id);
	String msg="";		
	if(removeCount==0){
		
			
			msg="작성자 외에 삭제권한이 없습니다.";
			out.println("<script>");
			out.println("alert('"+msg+"');");
			out.println("location.href='qna_list.jsp';");
			out.println("</script>");
	}	

	
	if (removeCount==1){
		
			msg="게시물을 삭제하였습니다.";
			out.println("<script>");
			out.println("alert('"+msg+"');");
			out.println("location.href='qna_list.jsp';");
			out.println("</script>");
			
		
	}
	

	
%>
<script type="text/javascript">
<%//if (result) {%>
	alert('<%=msg%>');
	location.href='qna_list.jsp?pageno=<%=pageno%>';
<%//} else {%>
	alert('<%=msg%>');
	location.href='qna_list.jsp?pageno=<%=pageno%>';
<%//}%>
	
</script>
