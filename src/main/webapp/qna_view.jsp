<%@page import="com.itwill.bakery.vo.QnA"%>
<%@page import="com.itwill.bakery.service.QnAService"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Integer qna_no =null;
Integer groupno=null;
int pageno = 1;

try {
	qna_no = Integer.parseInt(request.getParameter("qna_no"));
	qna_no = Integer.parseInt(request.getParameter("groupno"));
	pageno = Integer.parseInt(request.getParameter("pageno"));
} catch (Exception e) {
}
if (qna_no == null) {
	response.sendRedirect("qna_list.jsp?pageno=" + pageno);
	return;
}
QnA qna = QnAService.getInstance().findQnA(qna_no);
if (qna == null) {
	response.sendRedirect("qna_list.jsp?=pageno=" + pageno);
	return;
}
//readCount 증가
QnAService.getInstance().updateReadCount(qna_no);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">

<script type="text/javascript" src="js/qna.js">
</script>
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
							<td><br />
								<table style="padding-left: 10px" border=0 cellpadding=0
									cellspacing=0>
								
									<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									Q & A > 상세보기
									</caption>
								
								</table> <br>

								<form name="f" method="post">
									<input type="hidden" name="qna_no" value="<%=qna.getQna_no()%>"> 
									<input type="hidden" name="pageno" value="<%=pageno%>">
									<input type="hidden" name="groupno" value="<%=qna.getGroupno()%>">
									<table border="0" cellpadding="0" cellspacing="1" width="590"
										bgcolor="BBBBBB">
										<tr>
											<td width=100 align=center bgcolor="E2E2E2" height="22">작성자</td>
											<td width=490 bgcolor="ffffff" style="padding-left: 10px"
												align="left"><%=qna.getUser_id()%></td>
										</tr>

										<tr>
											<td width=100 align=center bgcolor="E2E2E2" height="22">제목</td>
											<td width=490 bgcolor="ffffff" style="padding-left: 10px"
												align="left"><%=qna.getQna_title()%></td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E2E2E2" height="22">내용</td>
											<td width=490 bgcolor="ffffff" height="180px"
												style="padding-left: 10px" align="left"><%=qna.getQna_content()%><br />

											</td>
										</tr>

									</table>

								</form> <br>
								<table width=590 border=0 cellpadding=0 cellspacing=0>
									<tr>
										<td align=center>
										<input type="button" style="font: inherit;"value="글쓰기" onClick="qnaCreate()"> &nbsp; 
										<input type="button" style="font: inherit;"value="답글쓰기" onClick="qnaReplyCreate()"> &nbsp; 
										<input type="button" style="font: inherit;"value="수정" onClick="qnaUpdate()"> &nbsp; 
										<input type="button" style="font: inherit;"value="삭제" onClick="qnaRemove()"> &nbsp; 
										<input type="button" style="font: inherit;"value="리스트" onClick="qnaList()">
										</td>
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