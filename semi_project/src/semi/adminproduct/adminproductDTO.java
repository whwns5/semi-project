package semi.adminproduct;

import java.sql.Date;

public class adminproductDTO {
	
	/**상품번호*/private int product_idx;
	/**상품아이디*/private int smallcategory_id;
	/**상품명*/private String product_name;
	/**상품코드 */private String product_code;
	/**상품색상*/private String product_color;
	/**상품사이즈*/private String product_size;
	/**상품재고수량*/private int product_num;
	/**상품가격*/private int product_price;
	/**상품설명내용*/private String product_content;
	/**상품이미지명*/private String product_img;
	/**상품이미지수*/private int product_imgcount;
	/**상품등록*/private Date product_regdate;
	public adminproductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminproductDTO(int product_idx, int smallcategory_id, String product_name, String product_code,
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
	public int getProduct_imgcount() {
		return product_imgcount;
	}
	public void setProduct_imgcount(int product_imgcount) {
		this.product_imgcount = product_imgcount;
	}
	public Date getProduct_regdate() {
		return product_regdate;
	}
	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}
	
	
	
	
	
}
