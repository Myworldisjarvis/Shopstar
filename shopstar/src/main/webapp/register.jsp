<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Sign Up - Shopstar</title>
<%@include file="components/common_css_js.jsp"%>
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Arial', sans-serif;
}

.card {
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-body {
	padding: 2rem;
}

.form-group label {
	font-weight: bold;
}

.form-control {
	border-radius: 30px;
	padding: 10px 20px;
}

.btn {
	border-radius: 30px;
	padding: 10px 20px;
}

.btn-outline-success {
	color: #28a745;
	border-color: #28a745;
}

.btn-outline-success:hover {
	background-color: #28a745;
	color: #fff;
}

.btn-outline-warning {
	color: #ffc107;
	border-color: #ffc107;
}

.btn-outline-warning:hover {
	background-color: #ffc107;
	color: #fff;
}

.text-center img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
}

.container-fluid {
	margin-top: 50px;
}

/* h3 {
	color: #343a40;
}
 */
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row justify-content-center mt-5">
			<div class="col-md-5">
				<div class="card">
					

					<div class="card-header bg-dark text-white text-center">
						<h3 class="fw-bold"
							style="font-family: -apple-system, BlinkMacSystemFont, Segoe
							UI, Roboto, Helvetica Neue, Arial, sans-serif, Apple Color
							Emoji, Segoe UI Emoji, Segoe UISymbol;">Sign-up
							here!</h3>
					</div>


					<div class="card-body">
						<%@include file="components/message.jsp"%>
                     <div class="text-center">
                        <img src="data:image/jpeg;base64,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" alt="Signup Image" class="rounded-circle img-fluid" alt="User Image">
                    </div> 
                    
						<!-- <h3 class="text-center my-3">Sign Up Here!</h3> -->

						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="name">User Name</label> <input name="name"
									type="text" class="form-control" id="name"
									placeholder="Enter Name" required>
							</div>
							<div class="form-group">
								<label for="email">User Email</label> <input name="email"
									type="email" class="form-control" id="email"
									placeholder="Enter Email" required>
							</div>
							<div class="form-group">
								<label for="password">User Password</label> <input
									name="password" type="password" class="form-control"
									id="password" placeholder="Enter Password" required>
							</div>
							<div class="form-group">
								<label for="Phone">User Phone Number</label> <input
									name="phonenumber" type="tel" class="form-control" id="Phone"
									placeholder="Enter Mobile Number" required>
							</div>
							<div class="form-group">
								<label for="Address">User Address</label>
								<textarea name="address" class="form-control" id="Address"
									style="height: 150px;" placeholder="Enter your address"
									required></textarea>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="components/common_modals.jsp"%>
</body>
</html>
