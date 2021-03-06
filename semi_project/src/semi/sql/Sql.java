package semi.sql;

public class Sql {
	
	///////////////// 회원 테이블 관련 (member_table) /////////////////
	
	//////////////////////////////////////////////////////////////////
	
	///////////////// 상품 테이블 관련 (product_table) /////////////////
	/** 상품 테이블 갯수 조회 */
	public static final String PRODUCT_TOTALCOUNT = "SELECT COUNT(*) FROM product_table";
	/** 관리자 검색 총 갯수 */
	public static final String getPRODUCT_FINDTOTALCOUNT(String fkey){
		String sql = "SELECT COUNT(*) FROM product_table "
				+ "WHERE " + fkey + " = ?";
		return sql;
	}
	/** 상품 테이블 대분류 별 총 갯수 조회 */
	public static final String getPRODUCT_LARGECATEGORY_TOTALCOUNT(){
		String sql = "SELECT COUNT(*) "
				+ "FROM product_table "
				+ "WHERE smallcategory_id IN (SELECT smallcategory_id "
				+ 							 "FROM smallcategory_table "
				+ 							 "WHERE largecategory_id = (SELECT largecategory_id "
				+ 													   "FROM largecategory_table "
				+ 													   "WHERE largecategory_name = ?))";
		return sql;
	}
	/** 상품 테이블 대분류 별 총 갯수 조회 */
	public static final String getPRODUCT_SMALLCATEGORY_TOTALCOUNT(){
		String sql = "SELECT COUNT(*) "
				+ 	 "FROM product_table "
				+ 	 "WHERE smallcategory_id = (SELECT smallcategory_id "
				+ 							   "FROM smallcategory_table "
				+ 							   "WHERE smallcategory_name = ?)";
		return sql;
	}
	/** 상품 테이블 검색 조회 총 갯수 조회 */
	public static final String getPRODUCT_SEARCH_TOTALCOUNT(String searchStr){
		String sql = "SELECT COUNT(*) "
				+ 	 "FROM product_table "
				+ 	 "WHERE product_code LIKE '%" + searchStr + "%' OR product_name LIKE '%" + searchStr + "%' ";
		return sql;
	}
	
	/** 상품 테이블 전체 조회 */
	public static final String PRODUCT_SELECT_ALL = "SELECT * FROM product_table";
	/** 상품 테이블 전체 조회 */
	public static final String getPRODUCT_SELECT_ALL(int cp, int listSize){
		String sql = "SELECT b.* FROM (SELECT rownum as rnum, a.* "
				+ 	 "FROM product_table a) b "
				+    "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
	}
	/** 상품 카테고리 아이디 조회 */
	//public static final String LARGECATEGORY_SELECT_WHERE = "SELECT largecategory_id FROM largecategory_table WHERE largecategory_name = ?";
	/** 상품 세부 카테고리 아이디 조회 */
	//public static final String SMALLCATEGORY_SELECT_WHERE = "SELECT * FROM smallcategory_id WHERE smallcategory_name = ?";
	/** 상품 테이블 카테고리 별 조회 */
	//public static final String PRODUCT_LARGECATEGORY_SELECT_ALL = "SELECT st.smallcategory_name, pt.* FROM product_table pt, smallcategory_table st WHERE pt.smallcategory_id = st.smallcategory_id AND pt.smallcategory_id IN (SELECT smallcategory_id FROM smallcategory_table WHERE largecategory_id = (SELECT largecategory_id FROM largecategory_table WHERE largecategory_name = ?))";
	/** 상품 테이블 대분류 카테고리 별 정렬 조회 */
	public static final String getPRODUCT_LARGECATEGORY_SELECT_ALL_ORDERYBY(int cp, int listSize, String column, String orderByType){
		String sql = "SELECT b.* FROM "
					+ "(SELECT rownum as rnum, a.* FROM " 
					+  "(SELECT st.smallcategory_name, pt.* "
					+   "FROM product_table pt, smallcategory_table st "
					+   "WHERE pt.smallcategory_id = st.smallcategory_id "
					+    "AND pt.smallcategory_id IN (SELECT smallcategory_id "
					+                                "FROM smallcategory_table "
					+                                "WHERE largecategory_id = (SELECT largecategory_id "
					+                                							"FROM largecategory_table "
					+                                							"WHERE largecategory_name = ?)) "
					+   "ORDER BY pt." + column + " " + orderByType + ") a) b "
					+ "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
	}
	/** 상품 테이블 세부 카테고리 별 정렬 조회 */
	public static final String getPRODUCT_SMALLCATEGORY_SELECT_ALL_ORDERYBY(int cp, int listSize, String column, String orderByType){
		String sql = "SELECT b.* FROM "
					+ "(SELECT rownum as rnum, a.* FROM " 
					+  "(SELECT st.smallcategory_name, pt.* "
					+   "FROM product_table pt, smallcategory_table st "
					+ 	"WHERE pt.smallcategory_id = st.smallcategory_id "
					+ 		"AND smallcategory_name = ? ORDER BY pt." + column + " " + orderByType + ") a) b "
					+ "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
	}
	/** 상품 테이블 코드 별 조회 */
	public static final String PRODUCT_CODE_SELECT_ALL = "SELECT * FROM product_table WHERE product_code = ?";
	 /** 상품 관리자 검색 조회 */
	public static final String getPRODUCT_SEARCH_FIND(String fkey){
		String sql = "SELECT * FROM product_table WHERE " + fkey + " = ?";
		return sql;
	}
	
	/** 상품 테이블 검색 조회 */
	public static final String getPRODUCT_SEARCH_SELLECT_ALL(String searchStr, int cp, int listSize, String column, String orderByType){
		String sql = "SELECT b.* "
				+	 "FROM (SELECT rownum as rnum, a.* " 
				+  		   "FROM (SELECT pt.*, slt.smallcategory_name, slt.largecategory_name "
				+   			 "FROM product_table pt, (SELECT st.smallcategory_id, st.smallcategory_name, lt.largecategory_name "
				+ 										 "FROM smallcategory_table st, largecategory_table lt "
				+ 										 "WHERE st.largecategory_id = lt.largecategory_id) slt "
				+ 				 "WHERE pt.smallcategory_id = slt.smallcategory_id "
				+ 				 "AND ( pt.product_code LIKE '%" + searchStr + "%' OR pt.product_name LIKE '%" + searchStr + "%' ) "
				+ 				 "ORDER BY " + column + " " + orderByType + ") a) b "
				+   "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
	return sql;
	}
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
			+ "?, " // product_imgcount
			+ "SYSDATE)"; // product_regdate
	
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
			+ "product_imgcount = ? "
			+ "WHERE product_idx = ?";

	/** 상품 테이블 삭제 */
	public static final String PRODUCT_DELETE = "DELETE FROM product_table WHERE product_table_idx = ?";
	
	//////////////////////////////////////////////////////////////////
	
	/////////////////// Q&A 테이블 관련 (qna_table) ///////////////////
	/** Q&A 테이블 상품 별 총 갯수 조회 */
	public static final String QNA_PRODUCTIDX_TOTALCOUNT = "SELECT COUNT(*) FROM qna_table WHERE product_idx = ?";
	/** Q&A 테이블 사용자 총 갯수 조회 */
	public static final String QNA_MEMBERID_TOTALCOUNT = "SELECT COUNT(*) FROM qna_table WHERE qna_ref IN (SELECT qna_ref FROM qna_table where member_id = ?)";
	/** Q&A 테이블 상품 별 총 갯수 조회 */
	public static final String QNA_ADMIN_TOTALCOUNT = "SELECT COUNT(*) FROM qna_table WHERE qna_state = 0";
	/** Q&A 테이블 전체 조회 */
	public static final String QNA_SELECT_ALL = "SELECT * FROM qna_table";
	
	/** Q&A 테이블 상품 별 페이징 조회 */
	//public static final String QNA_PRODUCTIDX_SELECT_ALL_ORDERBY = "SELECT * FROM qna_table";
	public static final String getQNA_PRODUCTIDX_SELECT_ALL_ORDERBY(int cp, int listSize){
		String sql = "SELECT b.* "
				+ 	 "FROM (SELECT rownum as rnum, a.* " 
				+  		   "FROM (SELECT * "
				+   	   		 "FROM qna_table "
				+ 				 "WHERE product_idx = ? "
				+ 				 "ORDER BY qna_ref DESC, qna_sunbun ASC) a) b "
				+ 	 "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
	}
	/** Q&A 테이블 관리자 페이징 조회 */
	public static final String getQNA_ADMIN_SELECT_ALL_ORDERBY(int cp, int listSize){
		String sql = "SELECT b.* "
				+ 	 "FROM (SELECT rownum as rnum, a.* " 
				+  		   "FROM (SELECT * "
				+   	   		 "FROM qna_table "
				+ 				 "WHERE qna_state = 0 "
				+ 				 "ORDER BY qna_ref DESC, qna_sunbun ASC) a) b "
				+ 	 "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
	}
	/** Q&A 테이블 사용자 시점 페이징 조회 */
	public static final String getQNA_MEMBERID_SELECT_ALL_ORDERBY(int cp, int listSize){
		String sql = "SELECT b.* "
				+ 	 "FROM (SELECT rownum as rnum, a.* " 
				+  		   "FROM (SELECT * "
				+   	   		 "FROM qna_table "
				+ 				 "WHERE qna_ref IN (SELECT qna_ref FROM qna_table where member_id = ?) "
				+ 				 "ORDER BY qna_ref DESC, qna_sunbun ASC) a) b "
				+ 	 "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
		/*String sql = "SELECT b.* "
				+ 	 "FROM (SELECT rownum as rnum, a.* " 
				+  		   "FROM (SELECT * "
				+   	   		 "FROM qna_table "
				+ 				 "WHERE member_id = ? "
				+ 				 "ORDER BY qna_ref DESC, qna_sunbun ASC) a) b "
				+ 	 "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;*/
	}
	
	/** Q&A 테이블 lef 최대값 조회 */
	public static final String QNA_SELECT_MAX_REF = "SELECT MAX(qna_ref) FROM qna_table";
	/** Q&A 테이블 삽입 */
	public static final String QNA_INSERT = "INSERT INTO qna_table VALUES(qna_table_idx.NEXTVAL, "
			+ "?, " // product_idx
			+ "?, " // member_id
			+ "?, " // qna_subject
			+ "?, " // qna_content
			+ "0, " // qna_state
			+ "SYSDATE, " // qna_regdate
			+ "?, " // qna_ref
			+ "?, " // qna_lev
			+ "?)"; // qna_sunbun 
	/** Q&A 테이블 순번 업데이트 */
	public static final String QNA_UPDATE_SUNBUN = "UPDATE qna_table SET qna_sunbun = qna_sunbun + 1 WHERE qna_ref = ? AND qna_sunbun >= ?";
	/** Q&A 질문글 상태 변환 */
	public static final String QNA_UPDATE_QUESTION_STATE = "UPDATE qna_table SET qna_state = 1 WHERE qna_idx = ?";
	/** Q&A 테이블 댓글 삽입 */
	public static final String QNA_INSERT_REPLY = "INSERT INTO qna_table VALUES(qna_table_idx.NEXTVAL, "
			+ "?, " // product_idx
			+ "?, " // member_id
			+ "?, " // qna_subject
			+ "?, " // qna_content
			+ "2, " // qna_state
			+ "SYSDATE, "
			+ "?, " // qna_ref
			+ "?, " // qna_lev
			+ "?)"; // qna_sunbun 
	/**  Q&A 테이블 삭제 */
	public static final String QNA_DELETE = "DELETE FROM qna_table WHERE qna_idx = ?";
	
	//////////////////////////////////////////////////////////////////
	
	/////////////////// Q&A 테이블 관련 (qna_table) ///////////////////
	/** 리뷰 테이블 상품 별 총 갯수 조회 */
	public static final String REVIEW_PRODUCTIDX_TOTALCOUNT = "SELECT COUNT(*) FROM review_table WHERE product_idx = ?";
	/** 리뷰 테이블 전체 조회 */
	public static final String REVIEW_SELECT_ALL = "SELECT * FROM review_table";
	/** 리뷰 테이블 상품 별 페이징 조회 */
	public static final String getREVIEW_PRODUCTIDX_SELECT_ALL_ORDERBY(int cp, int listSize){
		String sql = "SELECT b.* "
				+ 	 "FROM (SELECT rownum as rnum, a.* " 
				+  		   "FROM (SELECT * "
				+   	   		 "FROM review_table "
				+ 				 "WHERE product_idx = ? "
				+ 				 "ORDER BY review_ref DESC, review_sunbun ASC) a) b "
				+ 	 "WHERE rnum >= (" + cp + "-1)*" + listSize + "+ 1 AND rnum <= " + cp + "*" + listSize;
		return sql;
	}
	/** 리뷰 테이블 lef 최대값 조회 */
	public static final String REVIEW_SELECT_MAX_REF = "SELECT MAX(review_ref) FROM review_table";
	/** 리뷰 테이블 이미지명 조회 */
	public static final String REVIEW_SELECT_IMG = "SELECT review_img FROM review_table WHERE product_idx = ? AND member_id = ? AND review_lev = 0 ORDER BY review_ref ASC";
	/** 리뷰 테이블 삽입 */
	public static final String REVIEW_INSERT = "INSERT INTO review_table VALUES(review_table_idx.NEXTVAL, "
			+ "?, " // product_idx
			+ "?, " // member_id
			+ "?, " // review_subject
			+ "?, " // review_content
			+ "SYSDATE, " // review_regdate
			+ "?, " // review_grade
			+ "NULL, " // review_img
			+ "?, " // review_ref
			+ "?, " // review_lev
			+ "?)"; // review_sunbun 
	/** 리뷰 테이블 이미지 삽입 */
	public static final String getREVIEW_INSERT_IMAGE(String member_id, int product_idx, String fileType){
		String sql ="INSERT INTO review_table VALUES(review_table_idx.NEXTVAL, "
				+ "?, " // product_idx
				+ "?, " // member_id
				+ "?, " // review_subject
				+ "?, " // review_content
				+ "SYSDATE, " // review_regdate
				+ "?, " // review_grade
				+ "'" + member_id + "_" + product_idx + "_' || TO_CHAR(review_table_idx.CURRVAL) || '" + fileType + "', " // review_img
				+ "?, " // review_ref
				+ "?, " // review_lev
				+ "?)"; // review_sunbun 
		return sql;
	}
			
	/** 리뷰 테이블 순번 업데이트 */
	public static final String REVIEW_UPDATE_SUNBUN = "UPDATE review_table SET review_sunbun = review_sunbun + 1 WHERE review_ref = ? AND review_sunbun >= ?";
	/** 리뷰 테이블 댓글 삽입 */
	public static final String REVIEW_INSERT_REPLY = "INSERT INTO review_table VALUES(review_table_idx.NEXTVAL, "
			+ "?, " // product_idx
			+ "?, " // member_id
			+ "?, " // review_subject
			+ "?, " // review_content
			+ "SYSDATE, " // review_regdate
			+ "0, " // review_grade
			+ "NULL, " // review_img
			+ "?, " // review_ref
			+ "?, " // review_lev
			+ "?)"; // review_sunbun 
	
	
	//////////////////////////////////////////////////////////////////
	
	
}
