package semi.refund;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RefundDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	static int error=-1;
	
	public RefundDAO() {
	}
	
	public int refundInsert(String member_id, int product_idx, int payment_idx, String refund_subject, String refund_content){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="insert into refund_table values(refund_table_idx.nextval,?,?,?,?,?,TO_DATE(sysdate,'YY/MM/DD HH:mi'))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setInt(2, product_idx);
			ps.setInt(3, payment_idx);
			ps.setString(4, refund_subject);
			ps.setString(5, refund_content);
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
