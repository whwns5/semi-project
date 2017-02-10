package semi.db;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;

public class semiDB {
	
	static DataSource ds;
	
	static{
		try{
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
/*	public static Connection getConn()
	throws Exception{
		return ds.getConnection();
	}*/
	
	public static Connection getConn(){
		try{
			Connection conn2 = null;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String pwd = "1234";
			
			conn2 = DriverManager.getConnection(url, user, pwd);
			
			return conn2;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/*public static Connection dbConnect(){
		try{
			Connection conn2 = null;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String pwd = "1234";
			
			conn2 = DriverManager.getConnection(url, user, pwd);
			
			return conn2;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}*/
}
