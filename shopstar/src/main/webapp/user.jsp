<%@page import="com.shopstar.entities.User"%>
<%

User user = (User)session.getAttribute("current_user");
if(user==null){
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
}else{
	if(user.getUserType().equals("admin")){
		session.setAttribute("message", "You are not normal user !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
	
}

%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp"%>

</body>
</html>