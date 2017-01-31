package productForCartTest;

public class Product {
	private int pid;			
	private String pcategory1;	
	private String pcategory2; 	
	private String pname;		
	private int pprice;			
	private String pmaden;		
	private String pmodel;		
	private String pbrand;		
	private int pmaxbuy;		
	private String petc;		
	private String psearch;		
	private String pvalidation;	
	private String pttype;		
	private String ptptype;		 
	private String pbimgsrc;	
	private String psimgsrc;	
	private String pdetail;		
	private long pdate;			
	private String user;	
	private int count;
	
	
	public Product(int pid, String pcategory1, String pcategory2, String pname, int pprice, String pmaden,
			String pmodel, String pbrand, int pmaxbuy, String petc, String psearch, String pvalidation, String pttype,
			String ptptype, String pbimgsrc, String psimgsrc, String pdetail, long pdate, String user, int count) {
		super();
		this.pid = pid;
		this.pcategory1 = pcategory1;
		this.pcategory2 = pcategory2;
		this.pname = pname;
		this.pprice = pprice;
		this.pmaden = pmaden;
		this.pmodel = pmodel;
		this.pbrand = pbrand;
		this.pmaxbuy = pmaxbuy;
		this.petc = petc;
		this.psearch = psearch;
		this.pvalidation = pvalidation;
		this.pttype = pttype;
		this.ptptype = ptptype;
		this.pbimgsrc = pbimgsrc;
		this.psimgsrc = psimgsrc;
		this.pdetail = pdetail;
		this.pdate = pdate;
		this.user = user;
		this.count = count;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPcategory1() {
		return pcategory1;
	}
	public void setPcategory1(String pcategory1) {
		this.pcategory1 = pcategory1;
	}
	public String getPcategory2() {
		return pcategory2;
	}
	public void setPcategory2(String pcategory2) {
		this.pcategory2 = pcategory2;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPmaden() {
		return pmaden;
	}
	public void setPmaden(String pmaden) {
		this.pmaden = pmaden;
	}
	public String getPmodel() {
		return pmodel;
	}
	public void setPmodel(String pmodel) {
		this.pmodel = pmodel;
	}
	public String getPbrand() {
		return pbrand;
	}
	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}
	public int getPmaxbuy() {
		return pmaxbuy;
	}
	public void setPmaxbuy(int pmaxbuy) {
		this.pmaxbuy = pmaxbuy;
	}
	public String getPetc() {
		return petc;
	}
	public void setPetc(String petc) {
		this.petc = petc;
	}
	public String getPsearch() {
		return psearch;
	}
	public void setPsearch(String psearch) {
		this.psearch = psearch;
	}
	public String getPvalidation() {
		return pvalidation;
	}
	public void setPvalidation(String pvalidation) {
		this.pvalidation = pvalidation;
	}
	public String getPttype() {
		return pttype;
	}
	public void setPttype(String pttype) {
		this.pttype = pttype;
	}
	public String getPtptype() {
		return ptptype;
	}
	public void setPtptype(String ptptype) {
		this.ptptype = ptptype;
	}
	public String getPbimgsrc() {
		return pbimgsrc;
	}
	public void setPbimgsrc(String pbimgsrc) {
		this.pbimgsrc = pbimgsrc;
	}
	public String getPsimgsrc() {
		return psimgsrc;
	}
	public void setPsimgsrc(String psimgsrc) {
		this.psimgsrc = psimgsrc;
	}
	public String getPdetail() {
		return pdetail;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	public long getPdate() {
		return pdate;
	}
	public void setPdate(long pdate) {
		this.pdate = pdate;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}			
}
