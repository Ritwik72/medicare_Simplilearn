<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider"%>
<%
String email=session.getAttribute("email").toString();
String mobileNumber=request.getPassword("mobileNumber");
String password=request.getPassword("password");
	 int check=0;
	 try
	 {
		 Connection con=ConnectionProvider.getCon();
		 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select *from users where email='"+email+"' and password='"+password+"'");
		 while(rs.next())
		 {
			 check=1;
			 st.executeUpdate("Update users set mobileNumber='"+mobileNumber+"' where email='"+email+"'");
			 response.sendRedirect("changeMobileNumber.jsp?msg=done");
		 }
		 if(check==0)
			 response.sendRedirect("changeMobileNumberS.jsp?msg=wrong");
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
%>
