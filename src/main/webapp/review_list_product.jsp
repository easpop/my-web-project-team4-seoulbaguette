<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.vo.Review"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
int p_no = 8;
ReviewService reviewService = new ReviewService();
List<Review> reviewList = reviewService.selectReviewByP(p_no);

ProductService productService=new ProductService();
Product product=productService.selectByNo(p_no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
</head>
<body>


	<h1>리뷰</h1>
	상품 이름 : <%=product.getP_name() %>
	<div>
	<form name="f" method="post">
			<ul>
			<%for(Review review:reviewList){ %>
						<li><a href='review_view.jsp?r_no=<%= review.getR_no()%>'>
			[별점 :<%for(int s=0;s<review.getR_stargrade();s++){%>
				<%out.print("★");}%> ]
			<%=review.getR_date() %> 작성자 : <%=review.getUser_id() %></a>
			<br>
			<%=review.getR_title() %>
			<br>
			<%=review.getR_content() %>
			</li>
	        <% }%>
	</ul>
	</form>
			
			</div>

			



</body>
</html>