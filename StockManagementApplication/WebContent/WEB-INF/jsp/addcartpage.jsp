<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

a:link    {color:black; background-color:transparent; text-decoration:none;}
a:visited {color:black; background-color:transparent; text-decoration:none;}
a:hover   {color:blue; background-color:transparent; text-decoration:none;}
a:active  {color:green; background-color:transparent; text-decoration:none;}

</style>
</head>
<table text-align="center" >
<tr style="color: green;"><th>Add to cart</th></tr>
</table>
<body align="center">


	<table align='center' border='1'><tr><th>Product Name</th> <th>Category</th> <th>Company</th> <th>Quantity</th> <th>Price</th> <th>Addcart</th></tr><br>
		<form action="addcartdata?id=${m.getId() }" method="post">
		<tr> <td>${m.getProductname()}</td> <td>${m.getCategory()}</td> <td>${m.getCompany()}</td> <td><input type="text" name="quantity" placeholder="quantity" value="1"></td> <td>${m.getPrice()}</td> <td><input type="submit" value="AddCart"></td><tr>
		 
		</form>
		</table>



	

</body>
<table>
<th><a href="addproduct">AddProduct</a></th>
<th><a href="fetchproduct">SearchProduct</a></th>
<th><a href="logout">Logout</a></th>
</table>
</html>