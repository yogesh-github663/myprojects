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
</style>

</head>
<body>
<table text-align="center" >
<tr style="color: green;"><th>Sent Mails</th></tr>
</table>
<table align='center'><tr><th>MailTo</th><th>Subject</th><th>Mail</th><th>MailFrom</th><th>Delete</th></tr>
<c:forEach var="mail" items="${mlist}">
<tr><td>${mail.getTo_id()}</td><td>${mail.getSubject()}</td><td>${mail.getMessage()}</td><td>${mail.getFrom_id()}</td><td><a href="delete?id=${mail.getId()}">Delete</a></td></tr>
 </c:forEach>
 
</body>
</html>