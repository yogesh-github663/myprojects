<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

input[type=text],input[type=password], select {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 50%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<!-- <body align="center">
<h1>Enter the detail here</h1>
<form action="stockdata" method="post">
PRODUCTNAME:<br> <input type="text" name="productname" placeholder="productname" ><br>
CATEGORY:<br> <input type="text" name="category" placeholder="category" ><br>
COMPANY :<br> <input type="text" name="company" placeholder="company" ><br>
QUANTITY:<br> <input type="text" name="quantity" placeholder="quantity"  value="0"><br>
PRICE:<br> <input type="text" name="price" placeholder="price" value="0"><br>
<input type="submit" value="Submit" >
</form>
<a href="fetchproduct">SearchProduct</a>
<a href="logout">Logout</a>

</body> -->
<body>
<h3 align="left">Enter Details</h3>
<div>
  <form action="stockdata" method="post" >
    <span class="input"></span>
    <label for="fname">Enter Product Name<br></label>
    <input type="text" name="productname" placeholder="productname" ><br>
    
    <label for="fname">Enter Category<br></label>
    <input type="text" name="category" placeholder="category" ><br>
    
    <label for="fname">Enter Company<br></label>
    <br> <input type="text" name="company" placeholder="company" ><br>
    
    <label for="fname">Enter Quantity<br></label>
    <input type="text" name="quantity" placeholder="quantity"  value="0"><br>

   <label for="fname">Enter Price<br></label>
   <input type="text" name="price" placeholder="price" value="0"><br>

<input type="submit" value="Add" >
</form>
<h3><a href="fetchproduct">SearchProduct</a></h3>
<h3><a href="logout">Logout</a></h3>
</div>
</body>
</html>