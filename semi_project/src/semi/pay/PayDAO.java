package semi.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PayDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	static int error=-1;

	public PayDAO() {
		
	}
	
	public int payInsert(String member_id, int product_idx, int payment_totalprice, int payment_num, String payment_addr, String payment_tel, String product_name, String product_code, String product_color){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="insert into payment_table values(payment_table_idx.nextval,?,?,?,?,?,?,?,?,?,TO_DATE(sysdate,'YY/MM/DD HH:mi'))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setInt(2, product_idx);
			ps.setInt(3, payment_totalprice);
			ps.setInt(4, payment_num);
			ps.setString(5, payment_addr);
			ps.setString(6, payment_tel);
			ps.setString(7, product_name);
			ps.setString(8, product_code);
			ps.setString(9, product_color);
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
	
	public ArrayList<PayDTO> payInfo(String member_ids){
		try {
			ArrayList<PayDTO> arr=new ArrayList<PayDTO>();
			conn=semi.db.semiDB.getConn();
			String sql="select * from payment_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_ids);
			rs=ps.executeQuery();
			while(rs.next()){
				int payment_idx=rs.getInt("payment_idx");
				String member_id=rs.getString("member_id");
				int product_idx = rs.getInt("product_idx");
				int payment_totalprice = rs.getInt("payment_totalprice");
				int payment_num = rs.getInt("payment_num");
				String payment_addr = rs.getString("payment_addr");
				String payment_tel = rs.getString("payment_tel");
				String product_name = rs.getString("product_name");
				String product_code = rs.getString("product_code");
				String product_color = rs.getString("product_color");
				java.sql.Date payment_date=rs.getDate("payment_date");
				
				PayDTO dto = new PayDTO(payment_idx, member_id, product_idx, payment_totalprice, payment_num, payment_addr, payment_tel, product_name, product_code, product_color, payment_date);
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
}

