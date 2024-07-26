<!DOCTYPE html>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<html>
<head>
<title>Start Page</title>

</head>
<body>
<h2><center>--Hello World!--<center></h2>
<h2><center>HI shopstar famaly<center></center></h2>
<h1>creting session factory object</h1>
<% 
out.println(FactoryProvide.getFactory());   
%>
</html>
