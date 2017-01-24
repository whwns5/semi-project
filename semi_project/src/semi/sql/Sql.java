package semi.sql;

public class Sql {
	
	///////////////// 회원 테이블 관련 (member_table) /////////////////
	
	//////////////////////////////////////////////////////////////////
	
	///////////////// 상품 테이블 관련 (product_table) /////////////////

	/** 상품 테이블 전체 조회*/
	public static final String PRODUCT_SELECT_ALL = "SELECT * FROM product_table";
	
	/** 상품 테이블 삽입 */
	public static final String PRODUCT_INSERT = "INSERT INTO product_table VALUES(product_table_idx.NEXTVAL, " // product_idx
			+ "?, " // smallcategory_id
			+ "?, " // product_name
			+ "?, " // product_code
			+ "?, " // product_color
			+ "?, " // product_size
			+ "?, " // product_num
			+ "?, " // product_price
			+ "?, " // product_content
			+ "?, " // product_img
			+ "SYSDATE"; // product_regdate
	
	/** 상품 테이블 수정 */
	public static final String PRODUCT_UPDATE = "UPDATE product_table SET smallcategory_id = ?, "
			+ "product_name = ?, "
			+ "product_code = ?, "
			+ "product_color = ? "
			+ "product_size = ? "
			+ "product_num = ? "
			+ "product_price = ? "
			+ "product_content = ? "
			+ "product_img = ? "
			+ "WHERE product_idx = ?";

	/** 상품 테이블 삭제 */
	public static final String PRODUCT_DELETE = "DELETE FROM product_table WHERE product_table_idx = ?";
	
	//////////////////////////////////////////////////////////////////
	
	
}
