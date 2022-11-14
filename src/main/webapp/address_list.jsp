<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bakery.vo.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="user_login_check.jspf"%>
    <%
   
    UserService userService=new UserService();
    User user=userService.selectUser(sUserId);
    List<Address> addressList=userService.selectAddress(user);
    int check=addressList.size();
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
<script src="js/address.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0 onload="addressCheck(<%=check%>)">

	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_product.jsp" />
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
									내정보 관리 > 주소록 보기
								</caption>								
							</table> <!-- view Form  -->
							<% for(int i=0;i<addressList.size();i++){ %>
							<form id="addr_<%=i%>" method="post">
							<input type="hidden" name="add_no" value="<%=addressList.get(i).getAdd_no()%>"   />
								<table border="0" cellpadding="0" cellspacing="1" width="590" height="40"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="40">
											<%=i+1%></td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=addressList.get(i).getAddress()%>
											<input type="button" style="float:right;" value="수정" onClick="addressModify('addr_<%=i%>')"/>&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="button" style="float:right;" value="삭제" onClick="addressRemove('addr_<%=i%>')"/>&nbsp;
										</td>
									</tr>
								
								
								</table>
									
							</form> <br />
							
							<%} %>
						</td>
					</tr>
				</table>
				<form id='addreturn'>
							</form>
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="돌아가기" onClick="addressBack()"/>&nbsp;
									<input type="button" id="addcheck" value="추가하기"  onclick="addressAdd()"/>&nbsp;
									</td>
								</tr>
							</table>
							</div>
							
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
	
	<!--container end-->
</body>
</html>