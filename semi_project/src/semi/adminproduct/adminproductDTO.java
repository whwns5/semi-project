package semi.adminproduct;

import java.sql.Date;

public class adminproductDTO {
	/** 순번 */private int product_idx;
    /** 카테고리 아이디 */private String smallcategory_name;
    /** 아이템 이미지*/private String product_img;
    /** 상품 명 */private String product_name;
	/** 상품 가격 */private int product_price;
	/** 상품 재고 수량 */private int product_num;
	/** 상품 등록일 */private Date product_regdate;
	
	
	public adminproductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}





	public adminproductDTO(int product_idx, String smallcategory_name, String product_name, int product_price,
			int product_num, Date product_regdate) {
		super();
		this.product_idx = product_idx;
		this.smallcategory_name = smallcategory_name;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_num = product_num;
		this.product_regdate = product_regdate;
	}
	public adminproductDTO(int product_idx, String smallcategory_name, String product_name, int product_price,
			int product_num, Date product_regdate) {
		super();
		this.product_idx = product_idx;
		this.smallcategory_name = smallcategory_name;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_num = product_num;
		this.product_regdate = product_regdate;
	}

	public int getProduct_idx() {
		return product_idx;
	}


	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}


	public String getSmallcategory_name() {
		return smallcategory_name;
	}


	public void setSmallcategory_name(String smallcategory_name) {
		this.smallcategory_name = smallcategory_name;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public int getProduct_num() {
		return product_num;
	}


	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}


	public Date getProduct_regdate() {
		return product_regdate;
	}


	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}
	
}
