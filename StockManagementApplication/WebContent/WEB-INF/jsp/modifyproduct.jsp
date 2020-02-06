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
<body align="center">
	<table text-align="center" >
<tr style="color: green;"><th>Modify Products</th></tr>
</table>
	
	
	<table align='center' border='1'><tr><th>Product Name</th> <th>Category</th> <th>Company</th> <th>Quantity</th> <th>Price</th> <th>Modify</th></tr><br>
		<form action="modifydata?id=${m.getId() }" method="post">
		<tr> <td><input type="text" name="productname" placeholder="productname" value="${m.getProductname()}" ></td> <td><input type="text" name="category" placeholder="category" value="${m.getCategory()}"></td> <td> <input type="text" name="company" placeholder="company" value="${m.getCompany()}"></td> <td><input type="text" name="quantity" placeholder="quantity" value="${m.getQuantity()}"></td> <td><input type="text" name="price" placeholder="price" value="${m.getPrice()}"></td> <td><input type="submit" value="Modify"></td><tr>
		 
		</form>
		</table>
<table>
<tr>
<th><a href="addproduct">AddProduct</a></th>
<th><a href="fetchproduct">SearchProduct</a></th>
<th><a href="logout">Logout</a></th>
</tr>
</table>	



</body>
</html>