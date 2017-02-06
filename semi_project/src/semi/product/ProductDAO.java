package semi.product;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import semi.sql.Sql;
import semi.product.ProductDTO;
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
	 * 해당 카태고리별 총 갯수 조회 관련 메서드
	 * @param category_id_s, category_type
	 * @return count
	 * */
	public int getTotalCnt(String category_id_s, String category_type){
		try{
			conn = semi.db.semiDB.getConn();
			
			if(category_type.equals("lcid")){
				ps = conn.prepareStatement(Sql.getPRODUCT_LARGECATEGORY_TOTALCOUNT());
			} else if(category_type.equals("scid")){
				ps = conn.prepareStatement(Sql.getPRODUCT_SMALLCATEGORY_TOTALCOUNT());
			}
			
			ps.setString(1, category_id_s);
			
			rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt(1);
			
			count = count == 0 ? 1 : count;
		
			return count;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
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
				int product_imgcount = rs.getInt("product_imgcount");
				Date product_regdate = rs.getDate("product_regdate");
				
				ProductDTO pdto = new ProductDTO(product_idx, smallcategory_id, product_name, 
						product_code, product_color, product_size, product_num, product_price, 
						product_content, product_img, product_imgcount, product_regdate);
			
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
	 * 카테고리 아이디 조회 관련 메서드
	 * @param category_name, category_type
	 * @return int
	 * */
	/*public int productGetCategoryId(String category_name, String category_type){
		try{
			conn = semi.db.semiDB.getConn();
		
			if(category_type.equals("lcid")){
				ps = conn.prepareStatement(Sql.LARGECATEGORY_SELECT_WHERE);
			} else if(category_type.equals("scid")){
				ps = conn.prepareStatement(Sql.SMALLCATEGORY_SELECT_WHERE);
			}
			
			ps.setString(1, category_name);
			
			rs = ps.executeQuery();
			int category_id = 0;
			
			if(rs.next()){
				category_id = rs.getInt(1);
			}
			return category_id;

		} catch(Exception e){
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}*/
	
	/** 
	 * 상품 카테고리 별 조회 관련 메서드
	 * @param category_id_s, category_typem, cp, listSize, column, orderByType
	 * @return ArrayList<ProductDTO>
	 * */
	public ArrayList<ProductDTO> productCategoryList(String category_id_s, String category_type, int cp, int listSize, String column, String orderByType){
		try{

			conn = semi.db.semiDB.getConn();

			ps = null;
			if(category_type.equals("lcid")){
				ps = conn.prepareStatement(Sql.getPRODUCT_LARGECATEGORY_SELECT_ALL_ORDERYBY(cp, listSize, column, orderByType));
			} else if(category_type.equals("scid")){
				ps = conn.prepareStatement(Sql.getPRODUCT_SMALLCATEGORY_SELECT_ALL_ORDERYBY(cp, listSize, column, orderByType));
			}

			ps.setString(1, category_id_s); // smallcategory_name OR largecategory_name

			rs = ps.executeQuery();

			ArrayList<ProductDTO> arr_pdto = new ArrayList<ProductDTO>();

			while(rs.next()){
				int product_idx = rs.getInt("product_idx");
				int smallcategory_id = rs.getInt("smallcategory_id");
				String smallcategory_name = rs.getString("smallcategory_name");
				String product_name = rs.getString("product_name");
				String product_code = rs.getString("product_code");
				String product_color = rs.getString("product_color");
				String product_size = rs.getString("product_size");
				int product_num = rs.getInt("product_num");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");
				String product_img = rs.getString("product_img");
				int product_imgcount = rs.getInt("product_imgcount");
				Date product_regdate = rs.getDate("product_regdate");

				ProductDTO pdto = new ProductDTO(product_idx, smallcategory_id, smallcategory_name, 
						product_name, product_code, product_color, product_size, product_num, 
						product_price, product_content, product_img, product_imgcount, product_regdate);
				
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
	 * 상품 코드 별 조회 관련 메서드
	 * @param category_id_s, category_typem, cp, listSize, column, orderByType
	 * @return ArrayList<ProductDTO>
	 * */
	public ArrayList<ProductDTO> productCodeList(String product_code){
		try{
			conn = semi.db.semiDB.getConn();

			ps = null;
			ps = conn.prepareStatement(Sql.PRODUCT_CODE_SELECT_ALL);
			ps.setString(1, product_code);

			rs = ps.executeQuery();

			ArrayList<ProductDTO> arr_pdto = new ArrayList<ProductDTO>();

			while(rs.next()){
				int product_idx = rs.getInt("product_idx");
				int smallcategory_id = rs.getInt("smallcategory_id");
				String product_name = rs.getString("product_name");
				String product_code_temp = rs.getString("product_code");
				String product_color = rs.getString("product_color");
				String product_size = rs.getString("product_size");
				int product_num = rs.getInt("product_num");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");
				String product_img = rs.getString("product_img");
				int product_imgcount = rs.getInt("product_imgcount");
				Date product_regdate = rs.getDate("product_regdate");
				
				ProductDTO pdto = new ProductDTO(product_idx, smallcategory_id, product_name, 
						product_code_temp, product_color, product_size, product_num, product_price, 
						product_content, product_img, product_imgcount, product_regdate);
			
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
	 * 상품 세부 카테고리 별 조회 관련 메서드
	 * @param smallcategory_id
	 * @return ArrayList<ProductDTO>
	 * */
	/*public ArrayList<ProductDTO> productSmallCategoryList(int smallcategory_id){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.PRODUCT_SMALLCATEGORY_SELECT_ALL);
			ps.setInt(1, smallcategory_id);
			
			rs = ps.executeQuery();
			
			ArrayList<ProductDTO> arr_pdto = new ArrayList<ProductDTO>();
			
			while(rs.next()){
				int product_idx = rs.getInt("product_idx");
				int smallcategory_id_temp = rs.getInt("smallcategory_id");
				String product_name = rs.getString("product_name");
				String product_code = rs.getString("product_code");
				String product_color = rs.getString("product_color");
				String product_size = rs.getString("product_size");
				int product_num = rs.getInt("product_num");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");
				String product_img = rs.getString("product_img");
				Date product_regdate = rs.getDate("product_regdate");
				
				ProductDTO pdto = new ProductDTO(product_idx, smallcategory_id_temp, product_name, 
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
	}*/
	
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
			ps.setInt(10, pdto.getProduct_imgcount());
			
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
			ps.setInt(9, pdto.getProduct_imgcount());
			ps.setInt(10, pdto.getProduct_idx());
			
			
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
	/**1개의 상품 정보 불러오기*/
	public ProductDTO productOne(int product_idx) {
		try {
			conn = semi.db.semiDB.getConn();
			String sql = "select * from product_table where product_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, product_idx);
			rs = ps.executeQuery();
			ProductDTO dto = null;
			if (rs.next()) {
				int smallcategory_id = rs.getInt("smallcategory_id");
				/** 상품 명 */
				String product_name = rs.getString("product_name");
				/** 상품 코드 */
				String product_code = rs.getString("product_code");
				/** 상품 색상 */
				String product_color = rs.getString("product_color");
				/** 상품 사이즈 */
				String product_size = rs.getString("product_size");
				/** 상품 재고 수량 */
				int product_num = rs.getInt("product_num");
				/** 상품 가격 */
				int product_price = rs.getInt("product_price");
				/** 상품 설명 내용 */
				String product_content = rs.getString("product_content");
				/** 상품 이미지 명 */
				String product_img = rs.getString("product_img");
				/** 상품 이미지 갯수 */
				int product_imgcount = rs.getInt("product_imgcount");
				/** 상품 등록일 */
				Date product_regdate = rs.getDate("product_regdate");
				
				dto=new ProductDTO(product_idx, smallcategory_id, product_name, product_code, product_color, product_size, product_num, product_price, product_content, product_img, product_imgcount, product_regdate);
			}
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
}
