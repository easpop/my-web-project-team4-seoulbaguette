	<%@page import="com.itwill.bakery.service.QnAService"%>
<%@page import="com.itwill.bakery.vo.QnA"%>
<%@page import="com.itwill.bakery.vo.QnAListPageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!public String getTitleString(QnA qna) {
		StringBuilder title = new StringBuilder(128);
		String t = qna.getQna_title();

		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입

		for (int i = 0; i < qna.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}

		if (qna.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}

		title.append(t.replace(" ", "&nbsp;"));

		return title.toString();
	}%>
<%
QnAService qnaService = new QnAService();

String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
	pageno = "1";
}
QnAListPageMaker qnaListPage = new QnAService().findQnAList(Integer.parseInt(pageno));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script src="js/qna.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
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
						<td>
						&nbsp;&nbsp;
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									Q & A
								</caption>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">
										총 <font color="#FF0000"><%=qnaListPage.totCount%></font> 건 |
										현재페이지( <font color="#FF0000"><%=qnaListPage.pageMaker.getCurPage()%></font>
										/ <font color="#0000FF"><%=qnaListPage.pageMaker.getTotPage()%></font>
										)
									</td>
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=200 height=30 align=center bgcolor="E2E2E2">제목</td>
										<td width=150 height=30 align=center bgcolor="E2E2E2">작성자</td>
										<td width=150 height=30 align=center bgcolor="E2E2E2">작성일</td>
										<td width=90 height=30 align=center bgcolor="E2E2E2">조회수</td>
									</tr>
									<%
									for (QnA qna : qnaListPage.itemList) {
									%>
									<tr>
										<td width=200 height=25  bgcolor="ffffff" style="padding-left: 10px"
											align="left"><a
											href='qna_view.jsp?qna_no=<%=qna.getQna_no()%>&pageno=<%=qnaListPage.pageMaker.getCurPage()%>'>
												<%=this.getTitleString(qna)%>
										</a></td>
										<td width=150 height=25  align=center bgcolor="ffffff"><%=qna.getUser_id()%>
										</td>
										<td width=150 height=25 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><%=qna.getQna_date().toString().substring(0, 10)%>
										</td>
										<td width=90 height=25 align=center bgcolor="ffffff" align="left"><%=qna.getQna_readcount()%>
										</td>
									</tr>
									<%
									}
									%>
								</table>
								<!-- /list -->
							</form> <br><br>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
										<%
										if (qnaListPage.pageMaker.getPrevGroupStartPage() > 0) {
										%> <a href="./qna_list.jsp?pageno=1">◀◀</a>&nbsp; <%
 										}
 										%> <%
										 if (qnaListPage.pageMaker.getPrevPage() > 0) {
										 %> <%-- 이전페이지가 0이면 안보임 --%> 
										 <a href="./qna_list.jsp?pageno=<%=qnaListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										<%
										}
										%> <%
 										for (int i = qnaListPage.pageMaker.getBlockBegin(); i <= qnaListPage.pageMaker.getBlockEnd(); i++) {
 										if (qnaListPage.pageMaker.getCurPage() == i) {
 										%> <font color='aqua'><strong><%=i%></strong></font>&nbsp; <%
										 } else {
 										%> <a href="./qna_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										}
										}
										%> <%
 										if (qnaListPage.pageMaker.getNextGroupStartPage() < qnaListPage.pageMaker.getTotPage()) {
 										%> <a href="./qna_list.jsp?pageno=<%=qnaListPage.pageMaker.getNextPage()%>">▶</a>&nbsp;
										<%
										}
										%> <%
 										if (qnaListPage.pageMaker.getNextGroupStartPage() < qnaListPage.pageMaker.getTotPage()) {
 										%> <a href="./qna_list.jsp?pageno=<%=qnaListPage.pageMaker.getNextGroupStartPage()%>">▶▶</a>&nbsp;
										<%
										}
										%>
									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right">
									<input type="button" style="font: inherit;" value="게시물 작성" onclick="qnaCreate();" /></td>
								</tr>
							</table> <br /></td>
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
