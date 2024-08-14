<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - ShopStar</title>
<%@include file="components/common_css_js.jsp"%>
	
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	color: #333;
}

.about-header {
	background-image: url('https://via.placeholder.com/1200x500');
	background-size: cover;
	background-position: center;
	color: white;
	padding: 100px 0;
	text-align: center;
}

.about-header h1 {
	font-size: 3.5rem;
	font-weight: bolder;
	margin-bottom: 20px;
}

.about-header p {
	font-size: 1.2rem;
	max-width: 600px;
	margin: 0 auto;
}

.about-section {
	padding: 60px 0;
}

.about-section h2 {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 40px;
	text-align: center;
	color: #444;
}

.about-section p {
	font-size: 1.1rem;
	line-height: 1.8;
	margin-bottom: 30px;
}

.about-image {
	max-width: 100%;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.team-section {
	background-color: #ffffff;
	padding: 60px 0;
}

.team-section h2 {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 40px;
	text-align: center;
	color: #444;
}

.team-member {
	text-align: center;
	margin-bottom: 30px;
}

.team-member img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin-bottom: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.team-member h5 {
	font-size: 1.25rem;
	font-weight: bold;
}

.team-member p {
	font-size: 1rem;
	color: #777;
}

.mission-vision-section {
	padding: 60px 0;
	background-color: #f1f1f1;
}

.mission-vision-section h2 {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 40px;
	text-align: center;
	color: #444;
}

.mission-vision-section .col-md-6 {
	margin-bottom: 30px;
}

.mission-vision-section h5 {
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.mission-vision-section p {
	font-size: 1.1rem;
	line-height: 1.8;
}

.contact-us-section {
	padding: 60px 0;
}

.contact-us-section h2 {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 40px;
	text-align: center;
	color: #444;
}

.contact-us-section p {
	font-size: 1.1rem;
	text-align: center;
	max-width: 600px;
	margin: 0 auto 30px;
}

.contact-form {
	max-width: 600px;
	margin: 0 auto;
}

.contact-form .form-group input, .contact-form .form-group textarea {
	border-radius: 6px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.contact-form .btn {
	background-color: #444;
	border: none;
	padding: 10px 20px;
	border-radius: 6px;
	transition: background-color 0.3s;
}

.contact-form .btn:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<!-- About Header -->
	<header class="about-header">
		<h1>About ShopStar</h1>
		<p>Your trusted destination for quality products, exceptional
			service, and unbeatable prices.</p>
	</header>

	<!-- About Section -->
	<section class="about-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="https://via.placeholder.com/500x300" alt="About Image"
						class="about-image">
				</div>
				<div class="col-md-6">
					<h2>Who We Are</h2>
					<p>ShopStar is an innovative e-commerce platform that offers a
						wide range of products, from fashion and electronics to home
						essentials and more. Our mission is to provide a seamless and
						enjoyable shopping experience for our customers, ensuring quality
						products and exceptional service every step of the way.</p>
					<p>We started with a simple idea: to make shopping easier, more
						affordable, and more enjoyable for everyone. Today, ShopStar is a
						growing community of shoppers who value quality, convenience, and
						trust in their online shopping experience.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Team Section -->
	<section class="team-section">
		<div class="container">
			<h2>Meet Our Team</h2>
			<div class="row">
				<div class="col-md-4 team-member">
					<img src="https://via.placeholder.com/150" alt="Team Member">
					<h5>John Doe</h5>
					<p>Founder & CEO</p>
				</div>
				<div class="col-md-4 team-member">
					<img src="https://via.placeholder.com/150" alt="Team Member">
					<h5>Jane Smith</h5>
					<p>Chief Marketing Officer</p>
				</div>
				<div class="col-md-4 team-member">
					<img src="https://via.placeholder.com/150" alt="Team Member">
					<h5>Michael Johnson</h5>
					<p>Chief Technology Officer</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Mission & Vision Section -->
	<section class="mission-vision-section">
		<div class="container">
			<h2>Our Mission & Vision</h2>
			<div class="row">
				<div class="col-md-6">
					<h5>Our Mission</h5>
					<p>Our mission is to deliver quality products at unbeatable
						prices while providing an exceptional shopping experience. We
						strive to meet the needs of our customers by offering a diverse
						range of products and a hassle-free shopping environment.</p>
				</div>
				<div class="col-md-6">
					<h5>Our Vision</h5>
					<p>Our vision is to become the leading e-commerce platform,
						trusted by customers worldwide for our commitment to quality,
						affordability, and customer satisfaction. We aim to continuously
						innovate and improve our services to meet the ever-changing needs
						of our customers.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Contact Us Section -->
	<section class="contact-us-section">
		<div class="container">
			<h2>Contact Us</h2>
			<p>We'd love to hear from you! Whether you have a question about
				our products, need assistance with an order, or just want to say
				hello, we're here to help.</p>
			<form class="contact-form">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Your Name"
						required>
				</div>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="Your Email"
						required>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="5" placeholder="Your Message"
						required></textarea>
				</div>
				<button type="submit" class="btn btn-warning btn-block text-white">Send
					Message</button>
			</form>
		</div>
	</section>



	<%@include file="components/common_modals.jsp"%>
	<%@include file="components/footer.jsp"%>
</body>
</html>