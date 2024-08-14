<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error - ShopStar</title>
<!-- Bootstrap CSS -->
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/commondata.jsp"%>

<style>
body {
	background-color: #f8f9fa;
	font-family: 'Arial', sans-serif;
	color: #333;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.error-container {
	text-align: center;
	padding: 30px;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.error-code {
	font-size: 6rem;
	font-weight: bold;
	color: #ff6f61;
	margin-bottom: 20px;
}

.error-message {
	font-size: 1.5rem;
	margin-bottom: 20px;
}

.error-description {
	font-size: 1rem;
	margin-bottom: 30px;
	color: #777;
}

.error-actions .btn {
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 6px;
	margin-right: 10px;
}

.error-actions .btn-primary {
	background-color: #444;
	border-color: #444;
}

.error-actions .btn-primary:hover {
	background-color: #555;
	border-color: #555;
}

.error-actions .btn-secondary {
	background-color: #ff6f61;
	border-color: #ff6f61;
}

.error-actions .btn-secondary:hover {
	background-color: #e55d51;
	border-color: #e55d51;
}
</style>
</head>
<body>
	
	<div class="error-container">
		<div class="error-code">404</div>
		<div class="error-message">Page Not Found</div>
		<div class="error-description">Sorry, the page you are looking
			for might have been removed, had its name changed, or is temporarily
			unavailable.</div>
		<div class="error-actions">
			<a href="index.jsp" class="btn btn-primary">Go to Homepage</a> <a
				href="about.jsp" class="btn btn-secondary">Contact Support</a>
		</div>
	</div>

	
	
</body>
</html>
