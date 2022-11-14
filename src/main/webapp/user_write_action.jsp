<%@page import="com.itwill.bakery.service.UserService"%>
<%@page import="com.itwill.bakery.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("user_write_form.jsp");
	return;
}
request.setCharacterEncoding("UTF-8");

String user_id = request.getParameter("u_id");
String user_password = request.getParameter("user_password");
String user_name = request.getParameter("user_name");
String user_email = request.getParameter("user_email");
String user_phone = request.getParameter("user_phone");
int user_point = Integer.parseInt(request.getParameter("point"));

User newUser = null;

newUser = new User(user_id, user_password, user_name, user_email, user_phone, user_point, null);
UserService userService = new UserService();

int check = userService.createUser(newUser);



if (check == -1) {
	/*##################아이디중복#################*/
	/*String msg=userId+" 는 이미 존재하는 아이디입니다.";
	msg=URLEncoder.encode(msg,"UTF-8");
	userId=URLEncoder.encode(userId,"UTF-8");
	password=URLEncoder.encode(password,"UTF-8");
	name=URLEncoder.encode(name,"UTF-8");
	email=URLEncoder.encode(email,"UTF-8");
	
	String queryString ="msg="+msg+"&userId="+userId+"&password="+password+"&name="+name+"&email="+email;
	*/

	/*case 1 script
	
	out.println("<script>");
	out.println("alert('"+userId+"는 이미 존재하는 아이디입니다.');" );
	out.println("location.href='user_write_form.jsp?"+queryString+"';");
	out.println("</script>");
	***/

	/*case 2 redirect */
	/*response.sendRedirect("user_write_form.jsp?"+queryString);*/

	/*case3 forward*/
	String msg = user_id + "는 이미 존재하는 아이디입니다.";
	request.setAttribute("fuser", newUser);
	request.setAttribute("msg", msg);

	RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
	rd.forward(request, response);

} else if (check == 1) {
	/*##################회원가입성공#################*/
	response.sendRedirect("user_login_form.jsp");

}
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