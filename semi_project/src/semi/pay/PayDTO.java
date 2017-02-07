package semi.pay;

import java.sql.Date;

public class PayDTO {
	private int payment_idx;
	private String member_id;
	private int product_idx;
	private int payment_totalprice;
	private int payment_num;
	private String payment_addr;
	private String payment_tel;
	private String product_name;
	private String product_code;
	private String product_color;
	private Date payment_date;
	public int getPayment_idx() {
		return payment_idx;
	}
	public void setPayment_idx(int payment_idx) {
		this.payment_idx = payment_idx;
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
	public int getPayment_totalprice() {
		return payment_totalprice;
	}
	public void setPayment_totalprice(int payment_totalprice) {
		this.payment_totalprice = payment_totalprice;
	}
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	public String getPayment_addr() {
		return payment_addr;
	}
	public void setPayment_addr(String payment_addr) {
		this.payment_addr = payment_addr;
	}
	public String getPayment_tel() {
		return payment_tel;
	}
	public void setPayment_tel(String payment_tel) {
		this.payment_tel = payment_tel;
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
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	@Override
	public String toString() {
		return "PayDTO [payment_idx=" + payment_idx + ", member_id=" + member_id + ", product_idx=" + product_idx
				+ ", payment_totalprice=" + payment_totalprice + ", payment_num=" + payment_num + ", payment_addr="
				+ payment_addr + ", payment_tel=" + payment_tel + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_color=" + product_color + ", payment_date=" + payment_date + "]";
	}
	public PayDTO(int payment_idx, String member_id, int product_idx, int payment_totalprice, int payment_num,
			String payment_addr, String payment_tel, String product_name, String product_code, String product_color,
			Date payment_date) {
		super();
		this.payment_idx = payment_idx;
		this.member_id = member_id;
		this.product_idx = product_idx;
		this.payment_totalprice = payment_totalprice;
		this.payment_num = payment_num;
		this.payment_addr = payment_addr;
		this.payment_tel = payment_tel;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_color = product_color;
		this.payment_date = payment_date;
	}
	public PayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
