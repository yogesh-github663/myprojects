<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="UpdatePassword" method="post" >
  
    <label for=""><b>Enter Email</b></label><br>
    <input type="text" placeholder="enterId" name="email" required><br>

    <label for=""><b>New Password</b></label><br>
    <input type="text" placeholder="newpassword" name="newpassword" required><br>
    <br>

    <button type="submit">Update</button>
    
  

    <button type="button" >Cancel</button>
    
  
</form>
</body>
</html>