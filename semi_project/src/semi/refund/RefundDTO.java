package semi.refund;

import java.sql.Date;

public class RefundDTO {

	private int refund_idx;
	private String member_id;
	private int product_idx;
	private int payment_idx;
	private String refund_subject;
	private String refund_content;
	private Date refund_date;
	public RefundDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RefundDTO(int refund_idx, String member_id, int product_idx, int payment_idx, String refund_subject,
			String refund_content, Date refund_date) {
		super();
		this.refund_idx = refund_idx;
		this.member_id = member_id;
		this.product_idx = product_idx;
		this.payment_idx = payment_idx;
		this.refund_subject = refund_subject;
		this.refund_content = refund_content;
		this.refund_date = refund_date;
	}
	@Override
	public String toString() {
		return "RefundDTO [refund_idx=" + refund_idx + ", member_id=" + member_id + ", product_idx=" + product_idx
				+ ", payment_idx=" + payment_idx + ", refund_subject=" + refund_subject + ", refund_content="
				+ refund_content + ", refund_date=" + refund_date + "]";
	}
	public int getRefund_idx() {
		return refund_idx;
	}
	public void setRefund_idx(int refund_idx) {
		this.refund_idx = refund_idx;
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
	public int getPayment_idx() {
		return payment_idx;
	}
	public void setPayment_idx(int payment_idx) {
		this.payment_idx = payment_idx;
	}
	public String getRefund_subject() {
		return refund_subject;
	}
	public void setRefund_subject(String refund_subject) {
		this.refund_subject = refund_subject;
	}
	public String getRefund_content() {
		return refund_content;
	}
	public void setRefund_content(String refund_content) {
		this.refund_content = refund_content;
	}
	public Date getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}
	
	
}
