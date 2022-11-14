<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

							<form name="f" method="post" action="order_delete_action.jsp"
								onsubmit="return check_delete_order()">
								<input type="hidden" name="o_no" value="131">
								<table align="center" width="80%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption
										style="text-align: left; font-weight: bold; padding-bottom: 7px">
										<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;구매자정보
									</caption>

									<tr>
										<td width=202 height=25 bgcolor="E6ECDE" align=center class=t1><font>아이디</font></td>
										<td width=202 height=25 bgcolor="E6ECDE" align=center class=t1><font>이름</font></td>
										<td width=202 height=25 bgcolor="E6ECDE" align=center class=t1><font>이메일</font></td>
										<td width=202 height=25 bgcolor="E6ECDE" align=center class=t1><font>배송지</font></td>

									</tr>


									<tr>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1>guard</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>한예지</td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>abc@gmail.com</td>
										<td width=190 height=26 align=center bgcolor="ffffff" class=t1>
											<select>
												<option>서울시</option>
												<option>부산시</option>
												<option>울산시</option>
												<option>대구시</option>
										</select>
										</td>

									</tr>
								</table>
								<br />

								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption
										style="text-align: left; font-weight: bold; padding-bottom: 7px">
										<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;주문번호:12
									</caption>
									<tr style="border: 0.1px solid">
										<td width=30 height=25 bgcolor="E6ECDE" align=center class=t1></td>
										<td width=260 height=25 bgcolor="E6ECDE" align=center class=t1>상품명</td>
										<td width=109 height=25 bgcolor="E6ECDE" align=center class=t1>수
											량</td>
										<td width=109 height=25 bgcolor="E6ECDE" align=center class=t1>가
											격</td>
										<td width=110 height=25 bgcolor="E6ECDE" align=center class=t1>총가격</td>
									</tr>

									<!-- order item start -->

									<tr>
										<td width=30 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=1'><img width="30"
												height="26" src="image/0700000065282.jpg"></a>
										</td>
										<td width=260 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=1'>테디베어-분홍리본</a>
										</td>
										<td width=109 height=26 align=center bgcolor="ffffff" class=t1>1</td>
										<td width=109 height=26 align=center bgcolor="ffffff" class=t1>
											54,000</td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1>54,000</td>

									</tr>
									<tr>
										<td width=30 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=1'><img width="30"
												height="26" src="image/0700000065282.jpg"></a>
										</td>
										<td width=260 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=1'>테디베어-분홍리본</a>
										</td>
										<td width=109 height=26 align=center bgcolor="ffffff" class=t1>1</td>
										<td width=109 height=26 align=center bgcolor="ffffff" class=t1>
											54,000</td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1>54,000</td>

									</tr>
									<!-- order item end -->
								</table>
								<br>
								<br>
								<br>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1">
									<tr>
										<td width=120  height=20 bgcolor="ffffff" class=t1>
											<p align=left style="padding-left: 30px">
												<font style="font-weight: bold">쿠폰 </font>
											</p>
										</td>
										<td align="left" width=520 colspan=5 height=20 bgcolor="ffffff" class=t1>
											<input type="button" value="선택하기">
										</td>
									</tr>
									<tr>
										<td width=120  height=20 bgcolor="ffffff" class=t1>
											<p align=left style="padding-left: 30px">
												<font style="font-weight: bold">포인트 </font>
											</p>
										</td>
										<td align="left" width=60  height=20 bgcolor="ffffff" class=t1>
											<input type="text" placeholder="원">
										</td>
										
										<td align="left" width=560 colspan=54 height=20 bgcolor="ffffff" class=t1>
											&nbsp;&nbsp;&nbsp;&nbsp;보유포인트:
										</td>
									</tr>
									<tr>
										<td width=120  height=20 bgcolor="ffffff" class=t1>
											<p align=left style="padding-left: 30px">
												<font style="font-weight: bold">결재수단 </font>
											</p>
										</td>
										<td align="left" width=520 colspan=5 height=20 bgcolor="ffffff" class=t1>
											<input type="radio" value="신용카드">신용카드
											<input type="radio" value="계좌이체">계좌이체
											<input type="radio" value="무통장입금">무통장입금
										</td>
									</tr>
								</table>
							</form> 
							<br />
							<br />
							<br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>
										<input type="button" value="구매">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="쇼핑계속">
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

	</div>
	<!--container end-->
</body>
</html>
