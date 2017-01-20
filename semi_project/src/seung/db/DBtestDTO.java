package seung.db;

public class DBtestDTO {

	private int idx;
	private String name;
	private String email;
	private String dept;
	public DBtestDTO(){
		System.out.println("DTO");
	}
	public DBtestDTO(int idx, String name, String email, String dept) {
		super();
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.dept = dept;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	
	
}
