package semi.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PayDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	static int error=-1;

	public PayDAO() {
		
	}
	
	public int payInsert(String member_id, int product_idx, int payment_totalprice, int payment_num, String payment_addr, String payment_tel){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="insert into payment_table values(payment_table_idx.nextval,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setInt(2, product_idx);
			ps.setInt(3, payment_totalprice);
			ps.setInt(4, payment_num);
			ps.setString(5, payment_addr);
			ps.setString(6, payment_tel);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return error;
		}finally{
			try{
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			}catch(Exception e2){
				
			}
		}
	}
}

