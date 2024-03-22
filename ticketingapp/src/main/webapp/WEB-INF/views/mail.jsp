<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <style>
       
body {font-family: Arial, Helvetica, sans-serif;}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #38444d;
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
       



form {
  border: 3px solid #f2f2f2;
  font-family: Arial;
}

.container {
  padding: 20px;
  background-color: #f1f1f1;
  
}

  input[type=submit] {
  width: 30%;
  padding: 12px;
  margin: 8px 0;
  pdding-leff:20px;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  border: none;
}

input[type=submit]:hover {
  opacity: 0.8;
}


</style>
<!-- <script src="validatation.js"></script> -->
<script>
function myFunction() {

}
</script>

    </head>
    <script>

</script>
    <body>
    <ul>
  <li><a href="home">Home</a></li>
  <li><a href="mail">Raise a Ticket</a></li>
  <li><a href="tickets">View Tickets</a></li> 
</ul>
    <form action="EmailSendingServlet" method="post" id="formid">
    
      <div class="container" style="background-color:white">
        <table id="mailtable" border="0" width="30%" align="center">
            <caption><h2>Send Queries</h2></caption>
            <tr>
                <td width="30%">To mail </td>
                <td><input type="email"  id="tomail" name="tomail" size="50" required/></td>
            </tr>
            <tr>
                <td>Subject </td>
                <td><input type="text" name="subject" size="50"/></td>
            </tr>
            <tr>
                <td width="30%"></td>
                <td><textarea rows="10" cols="48" id="body" name="body" placeholder="&nbsp;body" required></textarea> </td>
            </tr>
            <tr>
                <td colspan="5" align="center"><input id="btn" type="submit" value="Send" onmouseover="myFunction()"/></td>
            </tr>
        </table>
  </div>
        
    </form>
</body>
</html>
