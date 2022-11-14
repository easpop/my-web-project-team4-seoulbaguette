<%@page import="com.itwill.bakery.vo.NoticeListPageMaker"%>
<%@ page import="com.itwill.bakery.vo.Notice"%>
<%@ page import="java.util.List"%>
<%@ page import="com.itwill.bakery.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

NoticeService noticeService = new NoticeService();

String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
	pageno = "1";
}
NoticeListPageMaker noticeListPage=new NoticeService().findNoticeList(Integer.parseInt(pageno));

String sUserId=(String)session.getAttribute("s_u_id");

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
<style type="text/css" media="screen">
</style>
<script src="js/notice.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>

<script type="text/javascript">
	function noticeCreate() {
		location.href = "notice_write_form.jsp";
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
								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									NOTICE
								</caption>
							</table>
					<tr bgcolor="#FFFFFF">
						<td height="20" class="t1" align="right" valign="bottom">
							총 <font color="#FF0000"><%=noticeListPage.totCount%></font> 건 |
							현재페이지( <font color="#FF0000"><%=noticeListPage.pageMaker.getCurPage()%></font>
							/ <font color="#0000FF"><%=noticeListPage.pageMaker.getTotPage()%></font>
							)
						</td>
					</tr>

				</table>
				<br />
				<!-- list -->
				<form name="f" method="post" action="">
					<table border="0" cellpadding="0" cellspacing="1" width="400"
						bgcolor="BBBBBB">

						<tr>
							<td width=200 height=30 align=center bgcolor="E2E2E2">제목</td>
							<td width=70 height=30 align=center bgcolor="E2E2E2">작성일</td>
							<td width=50 height=30 align=center bgcolor="E2E2E2">내용</td>
						</tr>
						<%
						for (Notice notice : noticeListPage.itemList) {
						%>
						<tr>

							<td width=200 height=25 bgcolor="ffffff"
								style="padding-left: 10px" align="left"><a
								href='notice_view.jsp?notice_no=<%=notice.getNotice_no()%>&pageno=<%=noticeListPage.pageMaker.getCurPage()%>'>
									<%=notice.getNotice_title()%>
							</a>
							<td width=70 height=25 align=center bgcolor="ffffff" align="left"><%=notice.getNotice_date()%>
							</td>
							<td width=50 height=25 align="center" bgcolor="ffffff"><a
								href='notice_view.jsp?notice_no=<%=notice.getNotice_no()%>'>
									<%="<상세 보기>"%>
							</a></td>
						</tr>
						<%
						}
						%>
					</table>
					<!-- /list -->
				</form>
				<br><br>
				<table border="0" cellpadding="0" cellspacing="1" width="400">
					<tr>
						<td align="center">
										<%
										if (noticeListPage.pageMaker.getPrevGroupStartPage() > 0) {
										%> <a href="./notice_list.jsp?pageno=1">◀◀</a>&nbsp; <%
 										}
 										%> <%
										 if (noticeListPage.pageMaker.getPrevPage() > 0) {
										 %> <%-- 이전페이지가 0이면 안보임 --%> 
										 <a href="./notice_list.jsp?pageno=<%=noticeListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										<%
										}
										%> <%
 										for (int i = noticeListPage.pageMaker.getBlockBegin(); i <= noticeListPage.pageMaker.getBlockEnd(); i++) {
 										if (noticeListPage.pageMaker.getCurPage() == i) {
 										%> <font color='aqua'><strong><%=i%></strong></font>&nbsp; <%
										 } else {
 										%> <a href="./notice_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										}
										}
										%> <%
 										if (noticeListPage.pageMaker.getNextGroupStartPage() < noticeListPage.pageMaker.getTotPage()) {
 										%> <a href="./notice_list.jsp?pageno=<%=noticeListPage.pageMaker.getNextPage()%>">▶</a>&nbsp;
										<%
										}
										%> <%
 										if (noticeListPage.pageMaker.getNextGroupStartPage() < noticeListPage.pageMaker.getTotPage()) {
 										%> <a href="./notice_list.jsp?pageno=<%=noticeListPage.pageMaker.getNextGroupStartPage()%>">▶▶</a>&nbsp;
										<%
										}
										%>
									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right">
											
									<%
									if(sUserId.equals("admin")){			
									 %>
									<input type="button" style="font: inherit;" value="공지 쓰기" onclick="noticeCreate();" /></td>
									<%} %>
								</tr>
							</table> <br />
							
							
							
			
						</div>
		
					<!-- include_content.jsp end-->
					<!-- content end -->
				</div>
					<!--wrapper end-->
							<div id="footer">
								<!-- include_common_bottom.jsp start-->
								<jsp:include page="include_common_bottom.jsp" />
								<!-- include_common_bottom.jsp end-->

						</div>	</div> <!--container end-->
</body>
</html>
