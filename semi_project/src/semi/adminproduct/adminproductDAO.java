package semi.adminproduct;


import java.sql.*;
import java.sql.Date;
import java.util.*;

import semi.member.MemberDTO;
public class adminproductDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public adminproductDAO(){
    	System.out.println("adminproductDAO 생성");
    	
    	
    }
    /** 상품검색 관련 메서드 */
	public ArrayList<adminproductDTO> productFind(String fkey, String fvalue) {
		try {
			conn = semi.db.semiDB.getConn();
			String sql = "select * from product_table where " + fkey + " = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, fvalue);
			
			rs = ps.executeQuery();
			ArrayList<adminproductDTO> arr = new ArrayList<adminproductDTO>();
			while (rs.next()) {
				int product_idx = rs.getInt("product_idx");
				int smallcategory_id=rs.getInt("smallcategory_id");
				String product_name = rs.getString("product_name");
				String product_code = rs.getString("product_code");
				String product_color = rs.getString("product_color");
				String product_size=rs.getString("product_size");
				int product_num=rs.getInt("product_num");
				int product_price= rs.getInt("product_price");
				String product_content = rs.getString("product_content");
				String product_img = rs.getString("product_img");
				int product_imgcount = rs.getInt("product_imgcount");
				Date product_regdate = rs.getDate("product_regdate");
				
				
				adminproductDTO dto = new adminproductDTO(product_idx, smallcategory_id, product_name, product_code, product_color, product_size, product_num, product_price, product_content, product_img, product_imgcount, product_regdate);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}

	}

	
	/**상품 정보 획득 관련 메서드*/
	public String getproductInfo(String username){
		try{
			conn = semi.db.semiDB.getConn();
			String sql="select product_idx from product_table where product_name=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	/**상품삭제*/
	public int productDel(adminproductDTO dto){
		try{
			conn = semi.db.semiDB.getConn();
			String sql="delete from product_table where product_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,dto.getProduct_idx());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
		}catch(Exception e2){
			
		}
		}
		
	}
	/**상품수정*/
	public int updateContent(adminproductDTO dto){
		try{
			
			conn = semi.db.semiDB.getConn();
			
			String sql = "update product_table set "
					+ "smallcategory_id = ?, "
					+ "product_name = ?, "
					+ "product_code = ?, "
					+ "product_color = ?, "
					+ "product_size = ?, "
					+ "product_num = ?, "
					+ "product_price = ?, "
					+ "product_content = ?, "
					+ "product_img = ?, "
					+ "product_imgcount = ? where product_idx = ?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1,dto.getSmallcategory_id());
			ps.setString(2, dto.getProduct_name());
			ps.setString(3, dto.getProduct_code());
			ps.setString(4, dto.getProduct_color());
			ps.setString(5, dto.getProduct_size());
			ps.setInt(6, dto.getProduct_num());
			ps.setInt(7,dto.getProduct_price());
			ps.setString(8, dto.getProduct_content());
			ps.setString(9,dto.getProduct_img());
			ps.setInt(10,dto.getProduct_imgcount());
			
			ps.setInt(11,dto.getProduct_idx());
			
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
		}
	}
}	

}

    /**
    public static final String USERS_HOME="E:/semi_project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_project/product/load";
    public static final String USERS="I:/workspace/semi/myweb/WebContent/ebbs/upload";

	*/
	/**상품 등록 메서드*/
	/*
    public int adminproductWrite(int smallcategory_id,
			String product_name,
			String product_code,
			String product_color,
			String product_size,
			int product_num,
			int product_price,
			String product_content,
			String product_img,
			int product_imgcount){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="insert into product_table values(product_table_idx.nextval,?,?,?,?,?,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, smallcategory_id);
			ps.setString(2, product_name);
			ps.setString(3, product_code);
			ps.setString(4, product_color);
			ps.setString(5, product_size);
			ps.setInt(6, product_num);
			ps.setInt(7, product_price);
			ps.setString(8, product_content);
			ps.setString(9, product_img);
			ps.setInt(10, product_imgcount);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	*/
	/**상품 리스트 
	public ArrayList<adminproductDTO> adminproductList(int ecp, int ls){
		try{
			ArrayList<adminproductDTO> arr=new ArrayList<adminproductDTO>();
			adminproductDTO pdto=null;
			conn=semi.db.semiDB.getConn();
			String sql="select * from (select rownum as rnum,a.* from "
					+ "(select * from e_bbs)a)b "
					+ "where rnum>=("+ecp+"-1)*"+ls+"+1 and rnum<="+ecp+"*"+ls+" order by idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				do{
					int product_idx = rs.getInt("product_idx");
					int smallcategory_id = rs.getInt("smallcategory_id");
					String product_name = rs.getString("product_name");
					String product_code = rs.getString("product_code");
					String product_color = rs.getString("product_color");
					String product_size = rs.getString("product_size");
					int product_num = rs.getInt("product_num");
					int product_price = rs.getInt("product_price");
					String product_content = rs.getString("product_content"); 
					String product_img = rs.getString("product_img");
					int product_imgcount = rs.getInt("product_imgcount");
					java.sql.Date product_regdate = rs.getDate("product_regdate");
					pdto=new adminproductDTO(product_idx, smallcategory_id, product_name, product_code, product_color, product_size, product_num, product_price, product_content, product_img, product_imgcount, product_regdate);					arr.add(pdto);
				}while(rs.next());
			}
			System.out.println("dao="+arr.size());
			return arr;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	*/
	/**상품 삭제 메서드               
	public int adminproductDelete(int product_idx){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="delete product_table where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, product_idx);
		    
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	*/
	/**상품 수정 메서드
	public int adminproductUpdate(int product_idx, String smallcategory_name, String product_img, String product_name,int product_price, int product_num){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="update product_table set smallcategory_name=?,product_img=?,product_name=?,product_price=?,product_num=? where product_idx=?";
			ps=conn.prepareStatement(sql);
		    ps.setString(1, smallcategory_name);
		    ps.setString(2, product_img);
		    ps.setString(3, product_name);
		    ps.setInt(4, product_price);
		    ps.setInt(5, product_num);
			int count=ps.executeUpdate();
			
			 
			return count;
		}catch(Exception e){
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	*/
	/**상품 목록 상세보기 메서드
	public adminproductDTO adminproductContent(int product_idxs){
		try{
			
			adminproductDTO pdto=null;
			conn=semi.db.semiDB.getConn();
			String sql="select * from product_table where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, product_idxs);
			rs=ps.executeQuery();
			if(rs.next()){
				int product_idx = rs.getInt("product_idx");
				int smallcategory_id = rs.getInt("smallcategory_id");
				String product_name = rs.getString("product_name");
				String product_code = rs.getString("product_code");
				String product_color = rs.getString("product_color");
				String product_size = rs.getString("product_size");
				int product_num = rs.getInt("product_num");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content"); 
				String product_img = rs.getString("product_img");
				int product_imgcount = rs.getInt("product_imgcount");
				java.sql.Date product_regdate = rs.getDate("product_regdate");
				pdto=new adminproductDTO(product_idx, smallcategory_id, product_name, product_code, product_color, product_size, product_num, product_price, product_content, product_img, product_imgcount, product_regdate);
			}
			
			
			return pdto;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	*/
	/**총게시물수 관련 메서드
	public int getTotalCnt(){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="select count(*) from product_table";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			count=count==0?1:count;
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
		
	
	}
	*/
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

