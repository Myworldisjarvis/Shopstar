<!DOCTYPE html>
<%@page import="com.shopstar.helper.FactoryProvide"%>
<html>
<head>
<title>Wellcome to shopstar</title>
<!--  css -->
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<h1>creting session factory object</h1>
<% 
out.println(FactoryProvide.getFactory());   
%>







<!-- script -->

</body>
</html>
