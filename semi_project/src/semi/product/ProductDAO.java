package semi.product;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import semi.sql.Sql;
/** 
 * 상품 관련 DAO
 * 
 * @author 조준현
 * @since 2017.01.23
 * */
public class ProductDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private final int ERROR = -1;
	
	public ProductDAO(){
		
	}
	
	/** 
	 * 상품 조회 관련 메서드
	 * @param void
	 * @return ArrayList<ProductDTO>
	 * */
	public ArrayList<ProductDTO> productList(){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.PRODUCT_SELECT_ALL);
			
			rs = ps.executeQuery();
			
			ArrayList<ProductDTO> arr_pdto = new ArrayList<ProductDTO>();
			
			while(rs.next()){
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
				Date product_regdate = rs.getDate("product_regdate");
				
				ProductDTO pdto = new ProductDTO(product_idx, smallcategory_id, product_name, 
						product_code, product_color, product_size, product_num, product_price, 
						product_content, product_img, product_regdate);
			
				arr_pdto.add(pdto);
			}
			
			return arr_pdto;

		} catch(Exception e){
			e.printStackTrace();
			return null;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 
	 * 상품 입력 관련 메서드
	 * @param ProductDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int productAdd(ProductDTO pdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.PRODUCT_INSERT);
			ps.setInt(1, pdto.getSmallcategory_id());
			ps.setString(2, pdto.getProduct_name());
			ps.setString(3, pdto.getProduct_color());
			ps.setString(5, pdto.getProduct_size());
			ps.setInt(6, pdto.getProduct_num());
			ps.setInt(7, pdto.getProduct_price());
			ps.setString(8, pdto.getProduct_content());
			ps.setString(9, pdto.getProduct_img());
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e){
			e.printStackTrace();
			return ERROR;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 
	 * 상품 수정 관련 메서드
	 * @param ProductDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int productUpdate(ProductDTO pdto){
		try {
			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.PRODUCT_UPDATE);
			ps.setInt(1, pdto.getSmallcategory_id());
			ps.setString(2, pdto.getProduct_name());
			ps.setString(3, pdto.getProduct_color());
			ps.setString(4, pdto.getProduct_size());
			ps.setInt(5, pdto.getProduct_num());
			ps.setInt(6, pdto.getProduct_price());
			ps.setString(7, pdto.getProduct_content());
			ps.setString(8, pdto.getProduct_img());
			ps.setInt(9, pdto.getProduct_idx());
			
			
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 
	 * 상품 삭제 관련 메서드
	 * @param product_table_idx (상품 아이디)
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int productDel(int product_table_idx){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.PRODUCT_DELETE);
			ps.setInt(1, product_table_idx);
			
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
