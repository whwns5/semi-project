package semi.product;

import java.sql.Date;

public class ProductDTO {
	/** 상품 아이디 (PK) */private int product_idx;
	/** 카테고리 아이디 (FK) */private int category_id;
	/** 상품 명 */private String product_name;
	/** 상품 색상 */private String product_color;
	/** 상품 사이즈 */private String product_size;
	/** 상품 재고 수량 */private int product_num;
	/** 상품 가격 */private int product_price;
	/** 상품 설명 내용 */private String product_content;
	/** 상품 이미지 명 */private String product_img;
	/** 상품 등록일 */private Date product_regdate;
	
	public ProductDTO() {
		super();
	}

	public ProductDTO(int product_idx, int category_id, String product_name, String product_color, String product_size,
			int product_num, int product_price, String product_content, String product_img, Date product_regdate) {
		super();
		this.product_idx = product_idx;
		this.category_id = category_id;
		this.product_name = product_name;
		this.product_color = product_color;
		this.product_size = product_size;
		this.product_num = product_num;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_img = product_img;
		this.product_regdate = product_regdate;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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

	@Override
	public String toString() {
		return "ProductDTO [product_idx=" + product_idx + ", category_id=" + category_id + ", product_name="
				+ product_name + ", product_color=" + product_color + ", product_size=" + product_size
				+ ", product_num=" + product_num + ", product_price=" + product_price + ", product_content="
				+ product_content + ", product_img=" + product_img + ", product_regdate=" + product_regdate + "]";
	}
	
}
