package semi.sql;

public class Sql {
	
	///////////////// 회원 테이블 관련 (member_table) /////////////////
	
	//////////////////////////////////////////////////////////////////
	
	///////////////// 상품 테이블 관련 (product_table) /////////////////

	/** 상품 테이블 전체 조회 */
	public static final String PRODUCT_SELECT_ALL = "SELECT * FROM product_table";
	/** 상품 카테고리 아이디 조회 */
	//public static final String LARGECATEGORY_SELECT_WHERE = "SELECT largecategory_id FROM largecategory_table WHERE largecategory_name = ?";
	/** 상품 세부 카테고리 아이디 조회 */
	//public static final String SMALLCATEGORY_SELECT_WHERE = "SELECT * FROM smallcategory_id WHERE smallcategory_name = ?";
	/** 상품 테이블 카테고리 별 조회 */
	public static final String PRODUCT_LARGECATEGORY_SELECT_ALL = "SELECT st.smallcategory_name, pt.* FROM product_table pt, smallcategory_table st WHERE pt.smallcategory_id = st.smallcategory_id AND pt.smallcategory_id IN (SELECT smallcategory_id FROM smallcategory_table WHERE largecategory_id = (SELECT largecategory_id FROM largecategory_table WHERE largecategory_name = ?))";
	/** 상품 테이블 세부 카테고리 별 조회 */
	public static final String PRODUCT_SMALLCATEGORY_SELECT_ALL = "SELECT st.smallcategory_name, pt.* FROM product_table pt, smallcategory_table st WHERE pt.smallcategory_id = st.smallcategory_id AND smallcategory_name = ?";
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
