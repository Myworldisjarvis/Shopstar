<!DOCTYPE html>
<%@page import="com.shopstar.helper.DescHelper"%>
<%@page import="com.shopstar.entities.Category"%>
<%@page import="com.shopstar.dao.CategoryDao"%>
<%@page import="com.shopstar.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shopstar.dao.ProductDao"%>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<html>
<head>
<title>Wellcome to shopstar</title>
<!--  css -->
<%@include file="components/common_css_js.jsp"%>

<style>


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

</style>




</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="row mt-3 mx-2">

		<%
		/* geting all products */
		ProductDao dao = new ProductDao(FactoryProvide.getFactory());
		List<Product> list = dao.getAllProducts();

		/* gateign all categoryes */
		CategoryDao cDao = new CategoryDao(FactoryProvide.getFactory());
		List<Category> cList = cDao.getCategory();
		%>


		<!-- Show Categorys -->
		<div class="col-md-2">
			<div class="list-group mt-4">

				<a href="#" class="list-group-item list-group-item-action active">
					All Products </a>

				<%
				for (Category category : cList) {
				%>

				<a href="#" class="list-group-item list-group-item-action"><%=category.getCategoryTital()%></a>

				<%
				}
				%>
			</div>

		</div>


		<!-- Show Products -->
		<div class="col-md-8">

			<!--Row -->
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">

						<!-- travrsing products  -->
						<%
						for (Product p : list) {
						%>
						<div class="card">
							<div class="container text-center"><img alt="<%=p.getpName()%>" style="max-height: 200px; max-width: 100%; width: auto; " class="card-img-top m-2" src="img/products/<%=p.getpPhoto()%>"></div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=DescHelper.get10Words(p.getpDisc())%></p>
							</div>
							
							<div class="card-footer">
								<button class="btn btn-primary">Add to cart</button>			
								<button class="btn btn-outline-success">&#8377;<%=p.getpPrice() %></button>
							</div>
						
						</div>
			
						<%
						}
						%>
			
					</div>
				</div>
			</div>

		</div>
	</div>





	<!-- script -->

</body>
</html>
