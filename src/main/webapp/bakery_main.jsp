<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String category_noStr="4";
ProductService productService=new ProductService();
List<Product> productList=new ArrayList<Product>();
productList=productService.selectByCategory(Integer.parseInt(category_noStr));
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
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_main.jsp"/>
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
									<td align="center" bgcolor="f4f4f4" height="35"><font size="5">BEST 3</font>&nbsp;&nbsp;<b></b></td></tr>
								<tr>	
									<td align="center" bgcolor="f4f4f4" height="22"><font color="gray">실시간 베스트 상품입니다 :)</font>&nbsp;&nbsp;<b> </b></td></tr>
							</table>

							<form name="f" method="post">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="FFFFFF">
									<%
									int product_size=productList.size();
									int product_column_size=3;
									int product_line_count = 1;
									
								
									for (int i=0;i<productList.size();i++) {
											Product product=productList.get(i);
											
									%>
									<!--상품시작 -->
									<%
									 if(i%product_column_size==0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%"  bgcolor="ffffff" style="padding-left:10px;padding-top: 10px; padding-right: 10px;padding-bottom: 10px;">
										<a href="product_detail.jsp?p_no=<%=product.getP_no()%>">
										<img width="210px" height="210px"src="image/<%=product.getP_image()%>" border="0"></a><br/>
											<br/> <b><%=product.getP_name()%></b><br>
									    <font color="#FF0000">
										</font></td>
									 <%if(i%product_column_size==3){%>
									</tr>
									<%} %>	
									
								   <!--상품 끝 -->
								   <%}%>	
								</table>
				
							</form> <br /></td>
					</tr>
				</table>
			</div>

			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	
	<!--container end-->
</body>
</html>