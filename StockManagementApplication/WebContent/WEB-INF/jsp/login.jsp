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
<!--<body align="center">
<h1>Welcome to login</h1>
<form  action="logindata" method="post">
<label for="fname">Enter Email<br></label>
  <input type="email" placeholder="Enter email" name="email"><br>
  <label for="lname">Enter Password<br></label>
  <input type="password" placeholder="Enter password" name="password"><br>
  <button type="submit">Submit</button>
</form><br>
<h3>${msg }</h3>
<h3>${em }</h3>
<a href="registration">Register</a><br>

<h3 align="left">Login</h3>  -->

<body>
<div>
  <form action="logindata" method="post" >
    <label for="fname">Enter Email<br></label>
    <input type="text" id="fname" name="email" placeholder="Your email.."><br>
    <label for="lname">Enter Password<br></label>
    <input type="password" id="lname" name="password" placeholder="Your password..">
    <input type="submit" value="Submit"><br>
    <h3><a href="registration">Register</a></h3><br>
  </form>
   <h3>${msg }</h3>
   <h3>${em }</h3>
</div>
</body>
</html>