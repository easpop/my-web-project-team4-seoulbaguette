<%@page import="com.itwill.bakery.service.OrderReviewService"%>
<%@page import="com.itwill.bakery.vo.Order_Review"%>
<%@page import="com.itwill.bakery.service.ReviewService"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("review_write_form.jsp");
	return;
}

int p_no = Integer.parseInt(request.getParameter("p_no"));
int oi_no = Integer.parseInt(request.getParameter("oi_no"));

String r_title = request.getParameter("r_title");
String r_stargrade = request.getParameter("r_stargrade");
String r_content = request.getParameter("r_content");

Review review = new Review(0, r_title, null, Integer.parseInt(r_stargrade), r_content, sUserId,
		new Product(p_no, null, 0, null, null, 0, 0));

ReviewService reviewService = new ReviewService();
UserService userService = new UserService();

try {
	reviewService.writeReivew(review, oi_no);
	userService.addPoint(sUserId, 100);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
</head>
<body>
	<script type="text/javascript">
		alert("리뷰 작성으로 포인트 100원이 지급되었습니다! ");
		location.href="review_list_user.jsp";
	</script>
</body>
</html>