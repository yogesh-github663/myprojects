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
<h1>Registration Page</h1>
<form action="registrationdata" method="post">
<input type="text" name="username" placeholder="username"><br>
<input type="text" name="usertype" placeholder="usertype"><br>
<input type="text" name="email" placeholder="email" ><br>
<input type="password" name="password" placeholder="password" ><br>
<input type="submit" value="Register" >
</form><br>
<h3>${msg}</h3>
<a href="login">Login</a><br>
</body>  -->


<body>
<h3 align="left">Registration</h3>

<div>
  <form action="registrationdata" method="post" >
    <span class="input"></span>
    <label for="fname">Enter UserName<br></label>
    <input type="text" id="fname" name="username" placeholder="Your name.." title="Format: Xx[space]Xx (e.g. Yogesh Pandey)"  autofocus autocomplete="off" required pattern="^\w+\s\w+$" /><br>

   <label for="fname">Enter UserType<br></label>
   <input type="text" name="usertype" placeholder="usertype....."><br>


    <label for="lname">Enter Email<br></label>
      <span class="input"></span>
    <input type="password" id="password"  name="email" placeholder="Enter email.." title="Password min 8 characters. At least one UPPERCASE and one lowercase letter" required pattern="(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$"/><br>
    
    <label for="lname">Enter Password<br></label>
    <span id="passwordMeter"></span>
    <input type="password" id="password" name="password" placeholder="Your password..">
    <input type="submit" value="Register">
  </form>
  <h3>${msg}</h3>
    <h2><a href="login">Login</a></h2><br>
</div>
	
</body>

</html>