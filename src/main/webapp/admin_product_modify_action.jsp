<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int p_no=Integer.parseInt(request.getParameter("p_no"));
    String p_name=request.getParameter("p_name");
    int category_no=Integer.parseInt(request.getParameter("category_no"));
    int p_price=Integer.parseInt(request.getParameter("p_price"));
    String p_desc=request.getParameter("p_desc");
    
    ProductService productService=new ProductService();
    Product product=new Product(p_no,p_name,p_price,null,p_desc,0,category_no);
    
    productService.update(product);
     
    response.sendRedirect("product_detail.jsp?p_no="+p_no);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL BAGUETTE</title>
</head>
<body>

</body>
</html>