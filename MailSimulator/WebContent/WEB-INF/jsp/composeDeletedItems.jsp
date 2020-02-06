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
<body>
<div>
<h1 align="left">Compose Mail</h1>
  <form action="ComposeDeletedItems" method="post" >
    <label for="fname">To<br></label>
    <input type="text" id="fname" name="to" placeholder=""><br>
    <label for="fname">Subject<br></label>
    <input type="text" id="fname" name="sub" placeholder=""><br>
    <label for="fname">Message<br></label>
    <input type="text" style="height: 200px" id="fname" name="msg" placeholder=""><br>

   
    <input type="submit" value="Send">
   
  </form>
</div>

</body>
</html>