package semi.cart;

public class CartDTO {

	private int cart_idx;
	private String member_id;
	private int product_idx;
	private int cart_num;
	private int cart_validity;
	private int product_price;
	
	public CartDTO(int cart_idx, String member_id, int product_idx, int cart_num, int cart_validity,
			int product_price) {
		super();
		this.cart_idx = cart_idx;
		this.member_id = member_id;
		this.product_idx = product_idx;
		this.cart_num = cart_num;
		this.cart_validity = cart_validity;
		this.product_price = product_price;
	}
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getCart_validity() {
		return cart_validity;
	}
	public void setCart_validity(int cart_validity) {
		this.cart_validity = cart_validity;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_idx=" + cart_idx + ", member_id=" + member_id + ", product_idx=" + product_idx
				+ ", cart_num=" + cart_num + ", cart_validity=" + cart_validity + ", product_price=" + product_price
				+ "]";
	}
	
	
	
}
