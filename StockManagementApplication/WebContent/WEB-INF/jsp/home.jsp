<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

#header {
    background-color: red;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
    float:left;
    padding:5px;	      
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color: red;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}

a:link    {color:black; background-color:transparent; text-decoration:none;}
a:visited {color:black; background-color:transparent; text-decoration:none;}
a:hover   {color:blue; background-color:transparent; text-decoration:none;}
a:active  {color:green; background-color:transparent; text-decoration:none;}


</style>

</head>
<!-- <body align="center">
<h1>Welcome to Home Page ${email }</h1>
<a href="addproduct">AddProduct</a>
<a href="fetchproduct">SearchProduct</a>
<a href="logout">Logout</a> -->

<body>
<div id="header">
<h1>Welcome To Stock Management Application</h1>
</div>
<marquee><h2>Welcome to Home Page </h2></marquee>
<h5>User:${email }</h5>
<div id="nav">
<a href="addproduct">Add Product</a> <br>
<a href="fetchproduct">Search Product</a> <br>
<a href="logout">Logout</a> 



</div>
<div id="footer">

</div>


</body>
</html>