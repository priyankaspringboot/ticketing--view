<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;text-align: center;}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #38444d;
}


input[type=submit] {
  background-color: #04AA6D;
  color: white;
  border: none;
  width: 10%;
  padding: 12px;
  margin: 8px 0;
  pdding-leff:20px;
  display: inline-block;
  border: 2px solid #ccc;
}

input[type=submit]:hover {
  opacity: 0.8;
}


li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>

</body>
<!-- navigation pages  -->
<ul>
  <li><a href="home">Home</a></li>
  <li><a href="mail">Raise a Ticket</a></li>
  <li><a href="tickets">View Tickets</a></li>
</ul>

<!-- display boys of page -->
<h2>view tickets</h2>

<form action="emailReading" method ="get">

  <input type="submit" value="view tickets">
<table border="1" >
<tr>
   <td>From</td> <td>Subject</td> <td>content</td>
 </tr>
 <%--  <c:forEach var="msg" items ="${messages}"> 
  
    <tr>
    <td>${msg.from[0]}</td><td>${msg.subject}</td><td>${msg.content}</td>
    
     
    </tr>
  
  </c:forEach> --%>
  <c:forEach items="${emails}" var="email">
            <tr>
                <td>${email.from}</td>
                <td>${email.subject}</td>
                <td><pre>${email.messageContent}</pre></td>
            </tr>
        </c:forEach>
 
</table>
</form>



</html>