package semi.db;

import java.sql.*;


public class semiDB_Test {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public semiDB_Test(){

	}
	
	public Connection dbConnect(){
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

	public int dbcpTest() {
		try {
			conn = semi.db.semiDB.getConn();
			
			String sql = "SELECT COUNT(*) FROM emp";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int count = 0;
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int dbTest(){
		try {
			conn = dbConnect();
			
			String sql = "SELECT COUNT(*) FROM emp";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int count = 0;
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		semiDB_Test db = new semiDB_Test();
		System.out.println(db.dbTest());
		//System.out.println(db.dbcpTest());
	}
}
