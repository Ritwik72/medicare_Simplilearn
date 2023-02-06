package project;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;

public class ConnectionProvider {
	public static Connection getCon()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Dreiver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","root");
			
			
			return con;
			
		}
		catch(Exception e)
		
		{
			System.out.print(e);
			return null;
			
		}
		
	}

}
