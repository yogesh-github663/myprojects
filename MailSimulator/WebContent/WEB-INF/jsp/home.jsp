<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
<body>
<!--<h1 align="center">Welcome To Email Application</h1>
	<h4 align="right">
		<a href="link3">Compose</a> | 
		<a href="draft">Draft</a> | 
		<a href="inbox">Inbox</a> | 
		<a href="sent">Sent mail</a> |
		<a href="deletedItems">Deleted Items</a> |
		<a href="logout">Logout</a> |
		
		
	</h4>
	<hr>  -->
	
<div id="header">
<h1>Welcome To Gmail Application</h1>
</div>

<div id="nav">
<a href="link3">Compose</a> <br>
<a href="draft">Draft</a> <br>
<a href="inbox">Inbox</a> <br>
<a href="sent">Sent mail</a> <br>
<a href="deletedItems">Deleted Items</a> <br>
<a href="logout">Logout</a> 



</div>
<div id="footer">

</div>


	
	  
	
</body>
</html>