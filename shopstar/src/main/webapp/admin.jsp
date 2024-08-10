<%@page import="java.util.Map"%>
<%@page import="com.shopstar.helper.DescHelper"%>
<%@page import="com.shopstar.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<%@page import="com.shopstar.dao.CategoryDao"%>
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

<!-- Product category -->
<!--  gating category from db-->
<%
CategoryDao cdao = new CategoryDao(FactoryProvide.getFactory());
List<Category> categorys = cdao.getCategory();

//gatting count product and user
Map<String ,Long> m = DescHelper.getCounts(FactoryProvide.getFactory());



%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
body {
	background: linear-gradient(135deg, #1e1e1e, #272727, #303030);
	color: #fff;
	font-family: 'Roboto', sans-serif;
}

/*  .container {
            margin-top: 80px;
        } */
.card {
	background-color: rgba(44, 44, 44, 0.9);
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s;
	background-image: linear-gradient(to right, #3c3c3c, #444);
}

.card:hover {
	transform: translateY(-10px);
}

.card-header {
	background-color: rgba(60, 60, 60, 0.9);
	border-bottom: none;
	border-radius: 15px 15px 0 0;
}

.form-control {
	background-color: #2c2c2c;
	color: #fff;
	border: 1px solid #444;
}

.form-control:focus {
	background-color: #3c3c3c;
	color: #fff;
	border-color: #555;
	box-shadow: none;
}

.btn-primary {
	background-color: #444;
	border: none;
	transition: background-color 0.2s, box-shadow 0.2s;
}

.btn-primary:hover {
	background-color: #555;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.btn-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.25);
}

.icon {
	font-size: 2rem;
	margin-bottom: 10px;
}

.counter {
	font-size: 3rem;
	font-weight: 500;
}

.footer {
	background-color: #1c1c1c;
	color: #ffffff;
}

.footer a {
	color: #ffffff;
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline;
}

.footer h5 {
	margin-bottom: 15px;
	font-size: 1.25rem;
	font-weight: 500;
}

.footer p {
	font-size: 0.875rem;
}

.modal-content {
	background-color: #2c2c2c;
	color: #fff;
}

.modal-header {
	border-bottom: 1px solid #444;
}

.modal-footer {
	border-top: 1px solid #444;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>


	<div class="container mt-5">
		<%@include file="components/message.jsp"%>

		<div class="row">
			<!-- Number of Users -->
			<div class="col-md-4 mb-4">
				<div class="card text-center">
					<div class="card-header">
						<i class="fas fa-users icon"></i>
						<h5>Number of Users</h5>
					</div>
					<div class="card-body">
						<h3 class="counter" id="userCount"><%=m.get("userCount") %></h3>
					</div>
				</div>
			</div>

			<!-- Number of Products -->
			<div class="col-md-4 mb-4">
				<div class="card text-center">
					<div class="card-header">
						<i class="fas fa-boxes icon"></i>
						<h5>Number of Products</h5>
					</div>
					<div class="card-body">
						<h3 class="counter" id="productCount"><%=m.get("productCount") %></h3>
					</div>
				</div>
			</div>

			<!-- Number of Categories -->
			<div class="col-md-4 mb-4">
				<div class="card text-center">
					<div class="card-header">
						<i class="fas fa-list-alt icon"></i>
						<h5>Number of Categories</h5>
					</div>
					<div class="card-body">
						<h3 class="counter" id="categoryCount"><%=categorys.size() %></h3>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- Add Product -->
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						<h5>Add Product</h5>
					</div>
					<div class="card-body">
						<button class="btn btn-primary btn-block" data-toggle="modal"
							data-target="#addProductModal">Add Product</button>
					</div>
				</div>
			</div>

			<!-- Add Category -->
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-header">
						<h5>Add Category</h5>
					</div>
					<div class="card-body">
						<button class="btn btn-primary btn-block" data-toggle="modal"
							data-target="#addCategoryModal">Add Category</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Product Modal -->
	<div class="modal fade" id="addProductModal" tabindex="-1"
		aria-labelledby="addProductModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addProductForm" action="ProductOperationServlet"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct">
						<div class="form-group">
							<label for="productName">Product Name</label> <input type="text"
								class="form-control" placeholder="Enter Product Name"
								name="pName" id="productName" required>
						</div>
						<div class="form-group">
							<label for="productDesc">Product Description</label>
							<textarea name="pDesc" placeholder="Enter product discription"
								class="form-control" id="productDesc" required></textarea>
						</div>
						<div class="form-group">
							<label for="productPrice">Product Price</label> <input
								placeholder="Enter Product Price" name="pPrice" type="number"
								class="form-control" id="productPrice" required>
						</div>
						<div class="form-group">
							<label for="productDiscount">Product Discount</label> <input
								type="number" name="pDisc" placeholder="Enter Product Discount"
								class="form-control" id="productDiscount" required>
						</div>
						<div class="form-group">
							<label for="productQuan">Product Quantity</label> <input
								type="number" name="pQuan" placeholder="Enter Product Quantity"
								class="form-control" id="productQuan" required>
						</div>


						// yaha ki category uper kar di gyi hai

						<div class="form-group">
							<label for="productCat">Product Category</label> <select
								name="catId" class="form-control" id="productCat">

								<!-- dynamic data gating -->
								<%
								for (Category c : categorys) {
								%>
								<option value="<%=c.getCategoryID()%>"><%=c.getCategoryTital()%></option>
								<%
								}
								%>

							</select>
						</div>

						<div class="form-group">
							<label for="productPic">Product Image</label> <input type="file"
								name="pPic" placeholder="Enter Product Quantity"
								class="form-control" id="productPic" required>
						</div>


						<button type="submit" class="btn btn-primary btn-block">Add
							Product</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Category Modal -->
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		aria-labelledby="addCategoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addCategoryModalLabel">Add
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addCategoryForm" action="ProductOperationServlet"
						method="post">
						<input type="hidden" name="operation" value="addcategory">
						<div class="form-group">
							<label for="categoryName">Category Name</label> <input
								name="catTitle" type="text" placeholder="Enter Category Name"
								class="form-control" id="categoryName" required>
						</div>
						<div class="form-group">
							<label for="productDesc">Product Description</label>
							<textarea name="catDesc" placeholder="Enter Category Discription"
								class="form-control" id="productDesc" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary btn-block">Add
							Category</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer bg-dark text-light py-4">
		<div class="container">
			<div class="row">
				<!-- Footer Column 1: About -->
				<div class="col-md-4 mb-3 mb-md-0">
					<h5>About Us</h5>
					<p class="small">Admin Panel is designed to help manage and
						monitor your products and users efficiently. All rights reserved ©
						2024.</p>
				</div>
				<!-- Footer Column 2: Links -->
				<div class="col-md-4 mb-3 mb-md-0">
					<h5>Quick Links</h5>
					<ul class="list-unstyled">
						<li><a href="#" class="text-light">Home</a></li>
						<li><a href="#" class="text-light">Products</a></li>
						<li><a href="#" class="text-light">Categories</a></li>
						<li><a href="#" class="text-light">Contact</a></li>
					</ul>
				</div>
				<!-- Footer Column 3: Contact Info -->
				<div class="col-md-4 mb-3 mb-md-0">
					<h5>Contact Us</h5>
					<p class="small">
						Email: <a href="mailto:namesadaf@gmail.com" class="text-light">namesadaf@gmail.com</a><br>
						Phone: <a href="tel:+917987837245" class="text-light">+91
							7987837245</a>
					</p>
				</div>
			</div>
			<!-- Footer Bottom -->
			<div class="text-center mt-4">
				<p class="small mb-0">&copy; 2024 Admin Panel. All Rights
					Reserved.</p>
			</div>
		</div>
	</footer>

	<!-- JavaScript for Counter Animation -->
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const userCount = <%=m.get("userCount") %>; // Example value
			const productCount = <%=m.get("productCount") %>; // Example value
			const categoryCount = <%=categorys.size() %>; // Example value

			const counters = {
				userCount : userCount,
				productCount : productCount,
				categoryCount : categoryCount
			};

			function animateCounter(element, targetValue) {
				$(element).prop('Counter', 0).animate({
					Counter : targetValue
				}, {
					duration : 1500, // Duration of the animation
					easing : 'swing',
					step : function(now) {
						$(this).text(Math.ceil(now));
					}
				});
			}

			animateCounter('#userCount', counters.userCount);
			animateCounter('#productCount', counters.productCount);
			animateCounter('#categoryCount', counters.categoryCount);

			// Chart.js Initialization
			const ctx = document.getElementById('dashboardChart').getContext(
					'2d');
			new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ 'Users', 'Products', 'Categories' ],
					datasets : [ {
						label : 'Counts',
						data : [ userCount, productCount, categoryCount ],
						backgroundColor : 'rgba(255, 99, 132, 0.2)',
						borderColor : 'rgba(255, 99, 132, 1)',
						borderWidth : 1
					} ]
				},
				options : {
					responsive : true,
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});
		});
	</script>

</body>
</html>