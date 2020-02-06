<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
<body>
<table text-align="center" >
<tr style="color: green;"><th>Inbox</th></tr>
</table>

<table align='center' >
<tr border: 1px solid black;><th>Mailfrom</th><th>Subject</th><th>Mail</th><th>Delete</th></tr>
<c:forEach var="mail" items="${mlist}">
<tr><td>${mail.getFrom_id()}</a></td><td>${mail.getSubject()}</td><td>${mail.getMessage()}</td><td><a href="delete?id=${mail.getId()}">Delete</a></td></tr>
 </c:forEach>
 
 </table>
 
</body>
</html>