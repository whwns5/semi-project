package semi.product;

import java.sql.Date;

public class ProductDTO {
	/** 상품 아이디 (PK) */
	private int product_idx;
	/** 카테고리 아이디 (FK) */
	private int smallcategory_id;
	/** 카테고리 아이디 */
	private String largecategory_name;
	/** 카테고리 아이디 */
	private String smallcategory_name;
	/** 상품 명 */
	private String product_name;
	/** 상품 코드 */
	private String product_code;
	/** 상품 색상 */
	private String product_color;
	/** 상품 사이즈 */
	private String product_size;
	/** 상품 재고 수량 */
	private int product_num;
	/** 상품 가격 */
	private int product_price;
	/** 상품 설명 내용 */
	private String product_content;
	/** 상품 이미지 명 */
	private String product_img;
	/** 상품 이미지 갯수 */
	private int product_imgcount;
	/** 상품 등록일 */
	private Date product_regdate;

	public ProductDTO() {
		super();
	}

	public ProductDTO(int product_idx, int smallcategory_id, String product_name, String product_code,
			String product_color, String product_size, int product_num, int product_price, String product_content,
			String product_img, int product_imgcount, Date product_regdate) {
		super();
		this.product_idx = product_idx;
		this.smallcategory_id = smallcategory_id;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_color = product_color;
		this.product_size = product_size;
		this.product_num = product_num;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_img = product_img;
		this.product_imgcount = product_imgcount;
		this.product_regdate = product_regdate;
	}

	public ProductDTO(int product_idx, int smallcategory_id, String smallcategory_name, String product_name,
			String product_code, String product_color, String product_size, int product_num, int product_price,
			String product_content, String product_img, int product_imgcount, Date product_regdate) {
		super();
		this.product_idx = product_idx;
		this.smallcategory_id = smallcategory_id;
		this.smallcategory_name = smallcategory_name;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_color = product_color;
		this.product_size = product_size;
		this.product_num = product_num;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_img = product_img;
		this.product_imgcount = product_imgcount;
		this.product_regdate = product_regdate;
	}
	
	public String getSmallcategory_name() {
		return smallcategory_name;
	}

	public void setSmallcategory_name(String smallcategory_name) {
		this.smallcategory_name = smallcategory_name;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getSmallcategory_id() {
		return smallcategory_id;
	}

	public void setSmallcategory_id(int smallcategory_id) {
		this.smallcategory_id = smallcategory_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public Date getProduct_regdate() {
		return product_regdate;
	}

	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}

	
	public int getProduct_imgcount() {
		return product_imgcount;
	}

	public void setProduct_imgcount(int product_imgcount) {
		this.product_imgcount = product_imgcount;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_idx=" + product_idx + ", smallcategory_id=" + smallcategory_id
				+ ", smallcategory_name=" + smallcategory_name + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_color=" + product_color + ", product_size=" + product_size
				+ ", product_num=" + product_num + ", product_price=" + product_price + ", product_content="
				+ product_content + ", product_img=" + product_img + ", product_imgcount=" + product_imgcount
				+ ", product_regdate=" + product_regdate + "]";
	}


}
