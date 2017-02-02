package semi.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import seung.product.*;

public class CartDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	static int error=-1;
	
	Calendar date=Calendar.getInstance();
	SimpleDateFormat today=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String time=today.format(date.getTime());
	
	public CartDAO() {
	}
	
	public int productLoad(int cart_idx){
		try {
			conn=seung.db.seungDB.getConn();
			String sql="select product_idx from cart_table where cart_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cart_idx);
			rs=ps.executeQuery();
			int product_idx=-1;
			if(rs.next()){
				product_idx=rs.getInt("product_idx");
			}
			return product_idx;
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
	
	public int cartDel(int cart_idx, String member_id){
		try {
			conn=seung.db.seungDB.getConn();
			String sql="delete from cart_table where cart_idx=? and member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cart_idx);
			ps.setString(2, member_id);
			int count=ps.executeUpdate();
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

	
	public int cartSum(String member_id){
		try {
		conn=seung.db.seungDB.getConn();
		String sql="select sum(product_price) from cart_table where member_id=?";
		ps=conn.prepareStatement(sql);
		ps.setString(1, member_id);
		rs=ps.executeQuery();
		int sum=0;
		if(rs.next()){
			sum=rs.getInt("sum(product_price)");
		}
		return sum;
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
	
	public void insert(String member_id, int product_id, int product_price){
		try {
			conn=seung.db.seungDB.getConn();
			String sql="insert into cart_table values(cart_table_cart_idx.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setInt(2, product_id);
			ps.setInt(3, 1);
			ps.setInt(4, 0);
			ps.setInt(5, product_price);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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
	
	public ArrayList<CartDTO> cartList(String sid){
		try {
			conn=seung.db.seungDB.getConn();
			String sql="select * from cart_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sid);
			rs=ps.executeQuery();
			ArrayList<CartDTO> arr=new ArrayList<CartDTO>();
			while(rs.next()){
				int cart_idx=rs.getInt("cart_idx");
				String member_id=rs.getString("member_id");
				int product_idx=rs.getInt("product_idx");
				int cart_num=rs.getInt("cart_num");
				int cart_validity=rs.getInt("cart_validity");
				int product_price=rs.getInt("product_price");
				CartDTO dto=new CartDTO(cart_idx, member_id, product_idx, cart_num, cart_validity, product_price);
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
	
	
	public CartDTO show(String sid){
		try {
			conn=seung.db.seungDB.getConn();
			System.out.println("CartDTO="+sid);
			String sql="select * from cart_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sid);
			rs=ps.executeQuery();
			CartDTO dto=null;
			if(rs.next()){
				int cart_idx=rs.getInt("cart_idx");
				String member_id=rs.getString("member_id");
				int product_idx=rs.getInt("product_idx");
				int cart_num=rs.getInt("cart_num");
				int cart_validity=rs.getInt("cart_validity");
				int product_price=rs.getInt("product_price");
				dto=new CartDTO(cart_idx, member_id, product_idx, cart_num, cart_validity, product_price);
			}
			return dto;
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
