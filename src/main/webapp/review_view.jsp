<%@page import="com.itwill.bakery.vo.Review"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//int r_no=8;
    /* if(request.getMethod().equalsIgnoreCase("GET")){
    	response.sendRedirect("review_list_product.jsp");
    	return;
    } */
    
   
    String r_no=request.getParameter("r_no");
    
    if(r_no==null||r_no.equals("")){
    	response.sendRedirect("review_list_user.jsp");
    	return;
    }
     

    ReviewService reviewService=new ReviewService();
    Review review=reviewService.selectReview(Integer.parseInt(r_no));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>

<script src="js/review.js">
	
	
</script>
</head>
<body>
<h1>리뷰</h1>
	
	<div>
	<form name="f" method="post">
	<input type="hidden" name="r_no" value="<%=review.getR_no()%>"/>
	<input type="hidden" name="user_id" value="<%=review.getUser_id()%>"/>

	
	상품 이름 : <%=review.getProduct().getP_name()%>
	<br>
	상품 이미지 : <%=review.getProduct().getP_image()%>
	<br>
	별점 : <%for(int s=0;s<review.getR_stargrade();s++){%>
				<%out.print("★");}%>
	작성 날짜 : <%=review.getR_date()%>
	작성자: <%=review.getUser_id() %> <br>
	제목: <%=review.getR_title() %> <br>
	내용 : <%=review.getR_content()%>
	
	</form>
	
	<input type="button" value="수정하기" onclick="reviewModify()"/>&nbsp; 
	<input type="button" value="삭제하기" onclick="reviewRemove()"/>&nbsp; 
	<input type="button" value="돌아가기" onclick="reviewReturn()"/>&nbsp;
	
	</div>
</body>
</html>