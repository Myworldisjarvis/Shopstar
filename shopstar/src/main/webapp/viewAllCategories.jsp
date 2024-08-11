<%@page import="com.shopstar.entities.User"%>
<%
User user = (User) session.getAttribute("current_user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not Admin !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}

}
%>


<%@page import="com.shopstar.dao.CategoryDao"%>
<%@page import="com.shopstar.entities.Category"%>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<%@page import="java.util.List"%>

<%
CategoryDao cdao = new CategoryDao(FactoryProvide.getFactory());
List<Category> categories = cdao.getCategory();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
<title>View All Categories</title>
<style>
/* Prefixing all classes with vcats- to avoid conflicts */
body.vcats-body {
    background-color: #1e1e1e;
    font-family: 'Roboto', sans-serif;
    color: #fff;
}

.vcats-container {
    margin-top: 50px;
}

.vcats-heading {
    color: #e0e0e0;
    text-align: center;
    margin-bottom: 20px;
}

.vcats-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #2c2c2c;
    border-radius: 8px;
    overflow: hidden;
}

.vcats-thead {
    background-color: #444;
}

.vcats-thead th {
    color: #fff;
    padding: 15px;
    text-align: left;
}

.vcats-tbody tr {
    border-bottom: 1px solid #444;
}

.vcats-tbody tr:nth-child(even) {
    background-color: #3c3c3c;
}

.vcats-tbody tr:hover {
    background-color: #555;
}

.vcats-tbody td {
    color: #e0e0e0;
    padding: 15px;
}

.vcats-btn {
    padding: 8px 12px;
    border: none;
    border-radius: 5px;
    transition: background-color 0.2s, transform 0.2s;
    font-weight: 500;
    text-transform: uppercase;
    text-align: center;
    display: inline-block;
    min-width: 100px;
}

.vcats-btn-warning {
    background-color: #ffa726;
    color: #000;
}

.vcats-btn-warning:hover {
    background-color: #ff9800;
    transform: scale(1.05);
}

.vcats-btn-danger {
    background-color: #ef5350;
    color: #fff;
}

.vcats-btn-danger:hover {
    background-color: #e53935;
    transform: scale(1.05);
}

.vcats-action-buttons {
    display: flex;
    gap: 10px;
}

.vcats-back-btn {
    margin-bottom: 20px;
    display: block;
    background-color: #444;
    color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
    text-align: center;
    transition: background-color 0.2s, transform 0.2s;
}

.vcats-back-btn:hover {
    background-color: #555;
    transform: scale(1.05);
}

.vcats-text-center {
    text-align: center;
}

</style>
</head>
<body class="vcats-body">
    <%@include file="components/navbar.jsp"%>
<div class="container">

    <div class="vcats-container">
        <a href="admin.jsp" class="vcats-back-btn">Back to Admin Panel</a>
        <h2 class="vcats-heading">All Categories</h2>
        <table class="vcats-table">
            <thead class="vcats-thead">
                <tr>
                    <th>#</th>
                    <th>Category Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody class="vcats-tbody">
                <% for (Category category : categories) { %>
                <tr>
                    <td>SHTECH<%= category.getCategoryID() %></td>
                    <td><%= category.getCategoryTital() %></td>
                    <td><%= category.getCategoryDescription() %></td>
                    <td>
                        <div class="vcats-action-buttons">
                            <a href="<%= category.getCategoryID() %>" class="vcats-btn vcats-btn-warning">Update</a>
                            <a href="<%= category.getCategoryID() %>" class="vcats-btn vcats-btn-danger">Delete</a>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
