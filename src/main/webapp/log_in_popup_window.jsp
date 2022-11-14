<%@page import="com.itwill.bakery.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("product_list.jsp");
		return;
	}
	String cart_qtyStr = request.getParameter("cart_qty");
	String p_noStr = request.getParameter("p_no");
	CartService cartService = new CartService();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
<script type="text/javascript">
</script>
</head>
<body>
<div style="width:250px ;margin:0 auto;padding: 10px">
	<img src="image/image__header-mypage.svg" width="33px" height="33px"
		alt="장바구니이미지">
	<strong>로그인을 해주세요.</strong>
	<div  style="margin-top: 15px;margin-left: auto;margin-right: auto;padding: 10px" >
		<div  style="margin: 0 auto;padding: 0px 20px">
			<button onclick="window.close();opener.location.href='user_login_form.jsp';">
				로그인 하기
			</button>
			<!-- 
			<button onclick="window.close();opener.location.href='cart_view_select_update_qyt_image.jsp';">
				장바구니로
			</button> 
			-->
			<button onclick="window.close();opener.location.href='user_write_form.jsp';">
				회원가입
			</button>
		</div>
	</div>
</div>
</body>
</html>
