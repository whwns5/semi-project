package semi.qna;

import java.sql.Date;

public class QnaDTO {
	/** Q&A 아이디 (PK) */
	private int qna_idx;
	/** 회원 아이디 (PK) */
	private String member_id;
	/** Q&A 제목 */
	private String qna_subject;
	/** Q&A 내용 */
	private String qna_content;
	/** Q&A 작성일 */
	private Date qna_regdate;
	private int qna_ref;
	private int qna_lev;
	private int qna_sunbun;
	
	public QnaDTO() {
		super();
	}

	public QnaDTO(int qna_idx, String member_id, String qna_subject, String qna_content, Date qna_regdate, int qna_ref,
			int qna_lev, int qna_sunbun) {
		super();
		this.qna_idx = qna_idx;
		this.member_id = member_id;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
		this.qna_ref = qna_ref;
		this.qna_lev = qna_lev;
		this.qna_sunbun = qna_sunbun;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public int getQna_ref() {
		return qna_ref;
	}

	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}

	public int getQna_lev() {
		return qna_lev;
	}

	public void setQna_lev(int qna_lev) {
		this.qna_lev = qna_lev;
	}

	public int getQna_sunbun() {
		return qna_sunbun;
	}

	public void setQna_sunbun(int qna_sunbun) {
		this.qna_sunbun = qna_sunbun;
	}
}
