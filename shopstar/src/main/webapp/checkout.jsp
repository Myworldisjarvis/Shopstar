<%
/* check if user login or not then show checkout page */
User user = (User) session.getAttribute("current_user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}


%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout-Shopstar</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/commondata.jsp"%>
<style>
body {
	background-color: #e2e2e2;
}

.card {
	border-radius: 1rem;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #555;
	color: #fff;
	border-radius: 1rem 1rem 0 0;
}

.btn-custom {
	background-color: #28a745;
	border-color: #28a745;
	border-radius: 0.5rem;
	padding: 0.75rem 1.25rem;
	color: #fff;
	font-size: 1rem;
	transition: background-color 0.3s, box-shadow 0.3s;
}

.btn-custom:hover {
	background-color: #218838;
	border-color: #1e7e34;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.btn-custom:focus {
	outline: none;
	box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
}

.form-group label {
	font-weight: bold;
	color: #495057;
}

.form-control {
	border-radius: 0.5rem;
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
}

.form-control:focus {
	border-color: #007bff;
	box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
}

.form-row {
	margin-bottom: 1rem;
}

.card-body {
	padding: 2rem;
}

.placeholder-custom {
	color: #6c757d;
	opacity: 1;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>



	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- product details -->
				<div class="card">
					<div class="card-header">
						<h3 class="text-center mb-1">Your Selected Items</h3>
					</div>

					<div class="card-body">
						<div class="card-bodys"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="card-header">
						<h4 class="text-center">Checkout Details</h4>
					</div>
					<div class="card-body">
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="firstName">First Name</label> <input type="text"
										class="form-control" id="firstName" placeholder="Sadaf"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="lastName">Last Name</label> <input type="text"
										class="form-control" id="lastName" placeholder="Hussain" required>
								</div>
							</div>
							<div class="form-group">
								<label for="email">Email Address</label> <input type="email" value="<%=user.getUserEmail() %>"
									class="form-control" id="email"
									placeholder="shopstar@example.com" required>
							</div>
							<div class="form-group">
								<label for="phone">Phone Number</label> <input type="tel" value="<%=user.getUserPhone() %>"
									class="form-control" id="phone" placeholder="+91 (798) 783-4567"
									required>
							</div>
							<div class="form-group">
								<label for="address">Address</label> <input type="text" value="<%=user.getUserAddress()%>"
									class="form-control" id="address" placeholder="1234 Main Street"
									required>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="city">City</label> <input type="text" 
										class="form-control" id="city" placeholder="City" required>
								</div>
								<div class="form-group col-md-4">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" placeholder="State" required>
								</div>
								<div class="form-group col-md-2">
									<label for="zip">Zip Code</label> <input type="text"
										class="form-control" id="zip" placeholder="12345" required>
								</div>
							</div>
							<button type="submit" class="btn btn-custom btn-block">Submit
								Order</button>
								<button type="" class="btn btn-custom btn-block">Continue Shoping </button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>