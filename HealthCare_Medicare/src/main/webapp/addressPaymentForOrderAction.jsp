<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider"%>
<%
String email=session.getAttribute("email").toString();
String address=session.getAttribute("address");
String city=session.getAttribute("city");
String state=session.getAttribute("state");
String country=session.getAttribute("country");
String mobileNumber=session.getParameter("mobileNumber");
String paymentMethod=session.getParameter("paymentMethod");
String tranactionId="";
tranactionId=request.getParameter("transactiobId");
String status="bill";

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,mobileNumber);
	ps.setString(6,email);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionID=?,status=? where email=? and address is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,country);
	ps1.setString(5,mobileNumber);
	ps1.setString(6,paymentMethod);
	ps1.setString(7,tranactionId);
	ps1.setString(8,status);
	ps1.setString(9,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}
	catch(Exception e)
{
	System.out.println(e);
}
%>