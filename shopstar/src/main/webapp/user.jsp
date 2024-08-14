<%@page import="com.shopstar.dao.UserDao"%>
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

UserDao userDao = new UserDao(FactoryProvide.getFactory());
User currentUser = (User) session.getAttribute("current_user");

if (currentUser == null) {
    response.sendRedirect("login.jsp");
    return;
}
User userr = userDao.getUserById(currentUser.getUserId());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
<style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .profile-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            margin: 20px auto;
            max-width: 800px;
        }
        .profile-header {
            position: relative;
            padding: 20px;
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
        }
        .profile-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 5px solid #ffffff;
            position: absolute;
            top: -60px;
            left: 50%;
            transform: translateX(-50%);
        }
        .profile-header h1 {
            margin-top: 60px;
            font-size: 1.8rem;
        }
        .profile-header p {
            font-size: 1.1rem;
        }
        .profile-body {
            padding: 20px;
        }
        .profile-body h3 {
            margin-top: 0;
            font-size: 1.5rem;
        }
        .profile-body .list-group-item {
            border: none;
            padding: 10px;
        }
        .profile-body .list-group-item:first-child {
            border-top: 1px solid #ddd;
        }
        .btn-edit {
            border: 1px solid #007bff;
            color: #007bff;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-edit:hover {
            background-color: #007bff;
            color: #ffffff;
        }
    </style>
</head>
<body>
<%@include file="components/navbar.jsp"%>
    

<body>
    <div class="container">
        <div class="profile-card">
            <div class="profile-header">
<%--                 <img src="<%= user.getProfilePicture() != null ? 'img/products/' + user.getProfilePicture() : 'https://via.placeholder.com/120' %>" alt="Profile Picture"> --%>
                <h1><%= user.getUserName() %></h1>
                <p><%= user.getUserEmail() %></p>
            </div>
            <div class="profile-body">
                <h3>About Me</h3>
                <p></p>
                <h3>Contact Information</h3>
                <ul class="list-group">
                    <li class="list-group-item"><i class="fas fa-envelope"></i> <%= user.getUserEmail() %></li>
                    <li class="list-group-item"><i class="fas fa-phone"></i> <%= user.getUserPhone() %></li>
                    <li class="list-group-item"><i class="fas fa-map-marker-alt"></i> <%= user.getUserAddress() %></li>
                </ul>
                <div class="text-center mt-4">
                    <a href="edit-profile.jsp" class="btn btn-edit">Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
<%@include file="components/common_modals.jsp"%>
</body>
</html>







