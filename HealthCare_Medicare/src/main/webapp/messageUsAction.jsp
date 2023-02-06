<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider"%>
<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try
{

	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msf=valid");
}
catch(Exception e)
{
	response.sendRedirect("messageUs.jsp?msf=invalid");
	System.out.println(e);
}
%>