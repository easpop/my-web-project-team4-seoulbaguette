<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page import="com.itwill.bakery.vo.Notice"%>
<%@ page import="java.util.List"%>
<%@ page import="com.itwill.bakery.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

Integer notice_no =null;
Integer groupno = null;
int pageno = 1;

try {
	notice_no = Integer.parseInt(request.getParameter("notice_no"));
	notice_no = Integer.parseInt(request.getParameter("groupno"));
	pageno = Integer.parseInt(request.getParameter("pageno"));
} catch (Exception e) {
}
if (notice_no == null) {
	response.sendRedirect("notice_list.jsp?pageno=" + pageno);
	return;
}
Notice notice = NoticeService.getInstance().findNotice(notice_no);
if (notice == null) {
	response.sendRedirect("notice_list.jsp?=pageno=" + pageno);
	return;
}

String sUserId=(String)session.getAttribute("s_u_id");

//List<Notice> noticeList = noticeService.findNoticeList(currPage);
//String noStr = request.getParameter("notice_no");
//Notice notice = noticeService.selectByNoticeNo(Integer.parseInt(noStr));
%>

<!-- ********************************************************** -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>

<script type="text/javascript" src="js/notice.js">
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>

	<script type="text/javascript">
		function noticeCreate() {
			location.href = "notice_write_form.jsp";
		}

		function noticeUpdate() {
			f.action = "notice_modify_form.jsp";
			f.submit();
		}

		function noticeRemove() {
			if (confirm("정말 삭제하시겠습니까?")) {
				f.action = "notice_remove_action.jsp";
				f.submit();
			}
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
		<!-- navigation start-->
		<!-- navigation end-->
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
								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									NOTICE > 상세보기
								</caption>
							</table> <!-- **************************************************** -->
					<tr bgcolor="#FFFFFF">
						<td height="20" class="t1" align="right" valign="bottom"></td>
					</tr>

				</table>
				<br />

				<form name="f" method="post">
					<input type="hidden" name="notice_no" value="<%=notice.getNotice_no()%>">
					<input type="hidden" name="pageno" value="<%=pageno%>">
					<input type="hidden" name="groupno" value="<%=notice.getGroupno()%>">
						
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">

						<tr>
							<td width=100 align=center bgcolor="E2E2E2" height="30">제목</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><%=notice.getNotice_title()%></td>
						</tr>
						
						<tr>
							<td width=100 align=center bgcolor="E2E2E2" height="30">작성일</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><%=notice.getNotice_date()%></td>
						</tr>
						
						<tr>
							<td width=100 align=center bgcolor="E2E2E2" height="22">내용</td>
							<td width=490 bgcolor="ffffff" height="180px"
								style="padding-left: 10px" align="left"><%=notice.getNotice_content()%><br />
							</td>
						</tr>

					</table>

				</form>
				<br>
				<table width=590 border=0 cellpadding=0 cellspacing=0>
					<tr>
					<%
					if(sUserId!=null&&sUserId.equals("admin")){
					%>
						<td align=center><input type="button" style="font: inherit;" value="글쓰기" onClick="noticeCreate()"> &nbsp; 
						<input type="button" style="font: inherit;" value="수정" onClick="noticeUpdate()"> &nbsp; 
						<input type="button" style="font: inherit;" value="삭제" onClick="noticeRemove()"> &nbsp; 
					<% } %>
						
						<input type="button" style="font: inherit;" value="리스트" onClick="noticeList()"></td>
					</tr>
				</table>
			

			<!-- ********************************************************** -->
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