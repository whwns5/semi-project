package semi.db;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class semiDB {
	static DataSource ds;
	
	static{ // 프로그램 시점에서 메모리에 올라간다.
		try{
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(Exception e) {
			System.out.println("생성오류");
			e.printStackTrace();
		} 
	}
	
	public static Connection getConn() throws Exception{
		return ds.getConnection();
	}
}
