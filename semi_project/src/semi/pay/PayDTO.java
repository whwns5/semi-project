package semi.pay;

public class PayDTO {
	private int payment_idx;
	private String member_id;
	private int product_idx;
	private int payment_totalprice;
	private int payment_num;
	private String payment_addr;
	private String payment_tel;
	
	public PayDTO(int payment_idx, String member_id, int product_idx, int payment_totalprice, int payment_num,
			String payment_addr, String payment_tel) {
		super();
		this.payment_idx = payment_idx;
		this.member_id = member_id;
		this.product_idx = product_idx;
		this.payment_totalprice = payment_totalprice;
		this.payment_num = payment_num;
		this.payment_addr = payment_addr;
		this.payment_tel = payment_tel;
	}
	public PayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
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
	@Override
	public String toString() {
		return "PayDTO [payment_idx=" + payment_idx + ", member_id=" + member_id + ", product_idx=" + product_idx
				+ ", payment_totalprice=" + payment_totalprice + ", payment_num=" + payment_num + ", payment_addr="
				+ payment_addr + ", payment_tel=" + payment_tel + "]";
	}
	
	
}
