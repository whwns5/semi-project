package seung.db;

import java.sql.*;

public class DBtest {

	private static Connection conn;
	private static PreparedStatement ps;
	private static ResultSet rs;

	public DBtest() {
				System.out.println("empDAO test");
	}
	
	public static int testDB(){
		try {
			conn=seung.db.SeungDB.getConn();

			String sql = "select * from employee where idx=1";
			ps = conn.prepareStatement(sql);
			int count = ps.executeUpdate();

			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
	}
	

	}
