package semi.member;

import java.sql.*;

public class MemberDTO {
	
	/**회원 인덱스*/private String member_idx;
	/**회원 아이디*/private String member_id;
	/**회원 타입*/private String member_type;
	/**회원 이름*/private String member_name;
	/**회원 패스워드*/private String member_pwd;
	/**회원 생일*/private Date member_birthday;
	/**회원 성별*/private String member_sex;
	/**회원 이메일*/private String member_email;
	/**회원 전화번호*/private String member_tel;
	/**회원 주소*/private String member_addr;
	/**회원 쿠폰*/private String member_coupon;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String member_idx, String member_id, String member_type, String member_name, String member_pwd,
			Date member_birthday, String member_sex, String member_email, String member_tel, String member_addr,
			String member_coupon) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_type = member_type;
		this.member_name = member_name;
		this.member_pwd = member_pwd;
		this.member_birthday = member_birthday;
		this.member_sex = member_sex;
		this.member_email = member_email;
		this.member_tel = member_tel;
		this.member_addr = member_addr;
		this.member_coupon = member_coupon;
	}

	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public Date getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}

	public String getMember_sex() {
		return member_sex;
	}

	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_coupon() {
		return member_coupon;
	}

	public void setMember_coupon(String member_coupon) {
		this.member_coupon = member_coupon;
	}
	
	
}












