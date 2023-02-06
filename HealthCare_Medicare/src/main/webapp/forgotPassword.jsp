<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter Email" required>
     <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
     <select name="securityQuestion">
      <option value="What is first pet name?">What is your first pet name?</option>
     <option value="What is your first car?">What is your first car?</option>
     <option value="What is your mother name?">What is your mother name?</option>
     <option value="What is the name of the town you were born?">What is the name of the town you were born?</option>
     <input type ="text"name="answer" placeholder="Enter answer" required>
     <input type ="password"name="newPassword" placeholder="Enter your new Password" required>
     <input type="submit" value="Save">
     </select>
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  <%
String msg= request.getParameter("msg");
if("done".equals(msg))
{
%>
<h1>Password Change Successfully</h1>
<%}%>
 <%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>