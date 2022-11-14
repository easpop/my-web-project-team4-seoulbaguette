<%@page import="com.itwill.bakery.vo.Notice"%>
<%@page import="com.itwill.bakery.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%
Integer notice_no = null;
try {
	notice_no = Integer.valueOf(request.getParameter("notice_no"));
} catch (Exception ex) {

}
Integer groupno = null;
try {
	groupno = Integer.valueOf(request.getParameter("groupno"));
} catch (Exception ex) {

}
//번호없으면 list이동
if (notice_no == null) {
	response.sendRedirect("notice_list.jsp");
	return;
}
Notice notice = NoticeService.getInstance().findNotice(notice_no);

String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}

String sUser_id=null;
if(session.getAttribute("s_u_id")!=null){
	sUser_id=(String)session.getAttribute("s_u_id");
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">

<script type="text/javascript" src="js/notice.js">
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>

	<script type="text/javascript">
		function noticeModifyMsg() {
			if (f.notice_title.value == "") {
				alert("제목을 입력하십시오.");
				f.notice_title.focus();
				return false;
			}
			if (f.notice_content.value == "") {
				alert("내용을 입력하십시오.");
				f.notice_content.focus();
				return false;
			}
			f.action = "notice_modify_action.jsp";
			f.method = 'POST';
			f.submit();
		}

		function noticeList() {
			f.action = "notice_list.jsp";
			f.submit();
		}
	</script>

	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>공지 -
											공지 수정</b>
									</td>
								</tr>
							</table> <br> <!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" />
								<input type="hidden" name="notice_no" value="<%=notice.getNotice_no()%>" />
								<input type="hidden" name="groupno" value="<%=notice.getGroupno()%>" />

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150"
											name="notice_title" value="<%=notice.getNotice_title()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="notice_content"
												style="width: 350px" rows="14"><%=notice.getNotice_content()%></textarea></td>
									</tr>


								</table>
							</form>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="수정"
										onClick="noticeModifyMsg()"> &nbsp; <input
										type="button" value="리스트" onClick="noticeList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>