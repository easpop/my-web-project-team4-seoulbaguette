<%@page import="com.itwill.bakery.vo.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.vo.Cart"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.service.CartService"%>
<%@page import="com.itwill.bakery.service.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="user_login_check.jspf"%>  
   
<%
OrderService orderService = new OrderService();


String buyType = request.getParameter("buyType");
String p_no = request.getParameter("p_no");

String c_qty = request.getParameter("cart_qty");

String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");

if (buyType == null)
   buyType = "";
if (request.getAttribute("p_no") == null){
   p_no = request.getParameter("p_no");
}else{
	p_no=(String)request.getAttribute("p_no");
}
if (request.getAttribute("c_qty") == null){
	   c_qty = request.getParameter("cart_qty");;
	}else{
		c_qty=(String)request.getAttribute("c_qty");
	}



if (cart_item_noStr_array == null)
   cart_item_noStr_array = new String[]{};

CartService cartService = new CartService();
UserService userService = new UserService();
ProductService productService = new ProductService();

List<Address> userAddress=userService.selectAddress(new User("yeji2345","","","","",0,null));

List<Cart> cartItemList = new ArrayList<Cart>();
Address add = userService.selectAddressno(7);
User user = userService.selectUser("yeji2345");


if (buyType.equals("cart")) {
   cartItemList = cartService.selectCartList("yeji2345");
} else if (buyType.equals("cart_select")) {
   for (String cart_item_noStr : cart_item_noStr_array) {
      cartItemList.add(cartService.selectCart(Integer.parseInt(cart_item_noStr)));
   }
} else if (buyType.equals("direct")) {
   Product product = productService.selectByNo(Integer.parseInt(p_no));
   cartItemList.add(new Cart(0, Integer.parseInt(c_qty), product, user.getUser_id()));
}



int tot_price = 0;

for (Cart cart : cartItemList) {
   tot_price += cart.getCart_qty() * cart.getProduct().getP_price();
}

int point=0;
if(request.getAttribute("remainPoint")==null){
	point=0;
}else{
	point=(Integer)request.getAttribute("remainPoint");
}



%>
<!DOCTYPE html>
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
<script src="js/test.js"></script>
<script src="js/coupon.js"></script>
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
                        <tr>
                           <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
                                 주문/결제폼</b></td>
                        </tr>
                     </table> <!--form-->
                     <form name="order_create_form" method="post">
                        <input type="hidden" name="buyType" value="<%=buyType%>">
                        <input type="hidden" name="p_no" value="<%=p_no%>"> <input
                           type="hidden" name="p_qty" value="<%=c_qty%>">
                                             <table align=center width=80% border="0" cellpadding="0"
                           cellspacing="1" bgcolor="BBBBBB">
                           <caption style="text-align: left;">구매자정보</caption>
                           <tr>
                              <td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>아이디</td>
                              <td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>이름</td>
                              <td width=166 height=25 align=center bgcolor="E6ECDE" class=t1>이메일</td>
                              <td width=228 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
                              <td width=228 height=25 align=center bgcolor="E6ECDE" class=t1>포인트</td>
                              
                           </tr>
                           <tr>
                              <td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=user.getUser_id()%></td>
                              <td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=user.getUser_name()%></td>
                              <td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=user.getUser_email()%></td>
                              <td width=190 height=26 align=center bgcolor="ffffff" class=t1>
                                 <select name="add_select">
                                 <% for(Address address : userAddress) { %>
                                    
                                 <option value="<%=address.getAdd_no()%>"><%=address.getAddress() %></option>
                                    
                                    <%} %>   
                                    
                                    
                        
                              
                              
                              </select>
                              </td>
                              <td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=user.getUser_point()%></td>
                           </tr>
                        </table>

                        <br />

                        <table align=center width=80% border="0" cellpadding="0"
                           cellspacing="1" bgcolor="BBBBBB">
                           <caption style="text-align: left;">주문제품목록</caption>
                           <tr style="border: 0.1px solid">
                              <td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>제품</td>
                              <td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>수
                                 량</td>
                              <td width=166 height=25 bgcolor="E6ECDE" align=center class=t1>가
                                 격</td>
                              <td width=50 height=25 bgcolor="E6ECDE" align=center class=t1>비
                                 고</td>
                           </tr>
                           <%
                          
                           for (Cart cart : cartItemList) {
                           %>
                           <!-- cart item start -->
                           <tr>
                              <td width=290 height=26 align=center bgcolor="ffffff" class=t1>
                                 <a
                                 href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
                              </td>
                              <td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getCart_qty()%></td>
                              <td width=166 height=26 align=center bgcolor="ffffff" class=t1>
                                 <%=new DecimalFormat("#,###").format(cart.getCart_qty() * cart.getProduct().getP_price())%>
                              </td>
                              <td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
                           </tr>
                           <!-- cart item end -->
                           <%
                           }
                           %>
                          
                           <tr>
                              <td width=640 colspan=4 height=26 bgcolor="ffffff" class=t1>
                                 <p align=right style="padding-top: 10px">
                                    <font color=#FF0000>총 주문 금액 : <%=tot_price-point%>원
                                    </font>
                                    <input type="hidden" name="changeTot" value="<%=tot_price-point%>">
                                    
                                 </p>
                              </td>
                           </tr>
                        </table>      
                           
                           

                        <%
                        for (String cart_item_noStr : cart_item_noStr_array) {
                        %>
                        <input type="hidden" name="cart_item_no"
                           value="<%=cart_item_noStr%>">
                        <%
                        }
                        %>
                        
                        
                     <table align=center width=80% border="0" cellpadding="0"
                           cellspacing="1">
                           <tr>
                              <td width=120  height=20 bgcolor="ffffff" class=t1>
                                 <p align=left style="padding-left: 30px">
                                    <font style="font-weight: bold">쿠폰 </font>
                                 </p>
                              </td>
                              <td align="left" width=520 colspan=5 height=20 bgcolor="ffffff" class=t1>
                                 <input type="button" value="선택하기" onClick="couponOrderList()">
                              </td>
                           </tr>
                           <tr>
                              <td width=120  height=20 bgcolor="ffffff" class=t1>
                                 <p align=left style="padding-left: 30px">
                                    <font style="font-weight: bold">포인트 </font>
                                 </p>
                              </td>
                              <td align="left" width=60  height=20 bgcolor="ffffff" class=t1>
                                 <input type="text" name="point"  onchange="calPointF()" value="<%=point %>" placeholder="원">
                              </td>
                              <td align="left" width=520 colspan=5 height=20 bgcolor="ffffff" class=t1>
                                 <%-- <input type="button" value="적용하기" onClick="point(<%=point %>)" > --%>
                                 <input type="button" value="취소" onClick="point(<%=point %>)" >
                              </td>
                              <!--  
                              <td align="left" width=560 colspan=54 height=20 bgcolor="ffffff" class=t1>
                                 &nbsp;&nbsp;&nbsp;&nbsp;보유포인트:<%=user.getUser_point() %>
                              </td>
                              -->
                           </tr>
                           <tr>
                              <td width=120  height=20 bgcolor="ffffff" class=t1>
                                 <p align=left style="padding-left: 30px">
                                    <font style="font-weight: bold">결재수단 </font>
                                 </p>
                              </td>
                              <td align="left" width=520 colspan=5 height=20 bgcolor="ffffff" class=t1>
                                 <input type="radio" name="gener" value="신용카드">신용카드
                                 <input type="radio" name="gener" value="계좌이체">계좌이체
                                 <input type="radio" name="gener" value="무통장입금">무통장입금
                              </td>
                           </tr>
                        </table>
                     </form> <br />
                     
                     <table border="0" cellpadding="0" cellspacing="1" width="590">
                        <tr>
                           <td align=center>&nbsp;&nbsp; <a
                              href="javascript:order_create_form_submit();" class=m1>구매/결제하기</a>
                              &nbsp;&nbsp;<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

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