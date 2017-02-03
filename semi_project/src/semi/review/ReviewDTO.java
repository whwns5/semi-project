package semi.review;

import java.sql.Date;

public class ReviewDTO {
	/** 리뷰 idx (PK) */
	private int review_idx;
	/** 상품 아이디 */
	private int product_idx;
	/** 회원 아이디 */
	private String member_id;
	/** 리뷰 제목 */
	private String review_subject;
	/** 리뷰 내용 */
	private String review_content;
	/** 리뷰 작성일 */
	private Date review_regdate;
	/** 리뷰 등급 */
	private int review_grade;
	/** 리뷰 첨부이미지 */
	private String review_img;
	private int review_ref;
	private int review_lev;
	private int review_sunbun;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int review_idx, int product_idx, String member_id, String review_subject, String review_content,
			Date review_regdate, int review_grade, String review_img, int review_ref, int review_lev,
			int review_sunbun) {
		super();
		this.review_idx = review_idx;
		this.product_idx = product_idx;
		this.member_id = member_id;
		this.review_subject = review_subject;
		this.review_content = review_content;
		this.review_regdate = review_regdate;
		this.review_grade = review_grade;
		this.review_img = review_img;
		this.review_ref = review_ref;
		this.review_lev = review_lev;
		this.review_sunbun = review_sunbun;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReview_subject() {
		return review_subject;
	}

	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}

	public int getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public int getReview_ref() {
		return review_ref;
	}

	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}

	public int getReview_lev() {
		return review_lev;
	}

	public void setReview_lev(int review_lev) {
		this.review_lev = review_lev;
	}

	public int getReview_sunbun() {
		return review_sunbun;
	}

	public void setReview_sunbun(int review_sunbun) {
		this.review_sunbun = review_sunbun;
	}
}
