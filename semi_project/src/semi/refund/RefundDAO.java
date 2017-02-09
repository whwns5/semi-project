package semi.refund;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	public ArrayList<RefundDTO> refundInfo(String member_ids){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="select * from refund_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_ids);
			rs=ps.executeQuery();
			ArrayList<RefundDTO> arr=new ArrayList<RefundDTO>();
			while(rs.next()){
				int refund_idx = rs.getInt("refund_idx");
				String member_id = rs.getString("member_id");
				int product_idx = rs.getInt("product_idx");
				int payment_idx = rs.getInt("payment_idx");
				String refund_subject = rs.getString("refund_subject");
				String refund_content =rs.getString("refund_content");
				java.sql.Date refund_date = rs.getDate("refund_date");
				RefundDTO dto = new RefundDTO(refund_idx, member_id, product_idx, payment_idx, refund_subject, refund_content, refund_date);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	public RefundDTO refundFindOne(int refund_idxs){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="select * from refund_table where refund_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, refund_idxs);
			rs=ps.executeQuery();
			RefundDTO rdto=null;
			if(rs.next()){
				int refund_idx = rs.getInt("refund_idx");
				String member_id = rs.getString("member_id");
				int product_idx = rs.getInt("product_idx");
				int payment_idx = rs.getInt("payment_idx");
				String refund_subject = rs.getString("refund_subject");
				String refund_content =rs.getString("refund_content");
				java.sql.Date refund_date = rs.getDate("refund_date");
				rdto = new RefundDTO(refund_idx, member_id, product_idx, payment_idx, refund_subject, refund_content, refund_date);
			}
			return rdto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
