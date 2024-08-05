<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopstar.helper.DescHelper"%>
<%@page import="com.shopstar.entities.Category"%>
<%@page import="com.shopstar.dao.CategoryDao"%>
<%@page import="com.shopstar.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shopstar.dao.ProductDao"%>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<html>
<head>
<title>Welcome to ShopStar</title>
<!--  css -->
<%@include file="components/common_css_js.jsp"%>
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Arial', sans-serif;
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

.card {
	border: none;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card img {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card-body {
	padding: 1rem;
}

.card-title {
	font-size: 1.25rem;
	font-weight: bold;
}

.card-text {
	color: #777;
}

.card-footer {
	background-color: #f8f9fa;
	border-top: none;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0.5rem 1rem;
}

.list-group-item-action.active {
	background-color: #444;
	border-color: #444;
}

.container-fluid {
	margin-top: 20px;
}

/* no item in this category message */
.no-items-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	padding: 20px;
}

.no-items-message {
	text-align: center;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
	max-width: 500px;
	margin: auto;
}

.no-items-message h1 {
	font-size: 2.5rem;
	color: #333;
	margin-bottom: 20px;
	font-weight: bolder;
}

.no-items-message p {
	font-size: 1.2rem;
	color: #666;
	margin-bottom: 20px;
}

.btn-primary {
	background-color: #444;
	border: none;
	transition: background-color 0.3s, box-shadow 0.3s;
	padding: 10px 20px;
	border-radius: 6px;
	font-size: 1.1rem;
}

.btn-primary:hover {
	background-color: #555;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.btn-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.25);
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-3 mx-2">

			<%
			/* Getting all products */
			ProductDao dao = new ProductDao(FactoryProvide.getFactory());

			List<Product> list = null;
			String cat = request.getParameter("category");

			try {
				if (cat == null) {
					// Provide default behavior if cat is null
					list = dao.getAllProducts();
				} else if (cat.trim().equals("all")) {
					list = dao.getAllProducts();
				} else {
					try {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
					} catch (NumberFormatException e) {
				// Handle the case where cat is not a valid integer
				// Provide some default behavior or an error message
				list = new ArrayList<>(); // Or handle it according to your needs
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				// Optionally, add a user-friendly error message or redirect to an error page
			}

			/* Getting all categories */
			CategoryDao cDao = new CategoryDao(FactoryProvide.getFactory());
			List<Category> cList = cDao.getCategory();
			%>

			<!-- Show Categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">

					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action <%= (cat == null || cat.equals("all")) ? "active" : "" %>">All
						Products</a>

					<%
					for (Category category : cList) {
					%>

					<a href="index.jsp?category=<%=category.getCategoryID()%>"
						class="list-group-item list-group-item-action <%= (cat != null && cat.equals(String.valueOf(category.getCategoryID()))) ? "active" : "" %>"><%=category.getCategoryTital()%></a>

					<%
					}
					%>
				</div>
			</div>

			<!-- Show Products -->
			<div class="col-md-10">
				<!-- Row -->
				<div class="row mt-4">
					<%
					for (Product p : list) {
					%>
					<div class="col-md-4 mb-4">
						<div class="card">
							<div class="container text-center">
								<img alt="<%=p.getpName()%>" class="card-img-top m-2"
									src="img/products/<%=p.getpPhoto()%>"
									style="max-height: 200px; max-width: 100%; width: auto;">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=DescHelper.get10Words(p.getpDisc())%></p>
							</div>
							<div class="card-footer">
								<button class="btn btn-primary">Add to cart</button>
								<button class="btn btn-outline-success">
									&#8377;<%=p.getpPrice()%></button>
							</div>
						</div>
					</div>
					<%
					}

					if (list.size() == 0) {
					%>
					<div class="container no-items-container">
						<div class="no-items-message">
							<h1>No Items Available</h1>
							<p>Sorry, there are no items in this category at the moment.
								Please check back later or browse other categories.</p>
							<a href="index.jsp?category=all" class="btn btn-primary mt-3">Browse Other
								Categories</a>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>

		</div>
	</div>

	<!-- script -->
</body>
</html>
