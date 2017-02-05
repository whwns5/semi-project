package semi.product;

public class ProductPageDTO {
	/** 보여줄 리스트 수 */
	private int listSize;
	private String sortName;
	/** 필터링 컬럼 */
	private String sortColumn;
	/** 필터링 타입 */
	private String sortOrderByType;

	public ProductPageDTO() {
		super();
		this.listSize = 8;
		this.sortName = "new";
		this.sortColumn = "product_regdate";
		this.sortOrderByType = "DESC";
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
		if(sortName.equals("new")){
			this.sortColumn = "product_regdate";
			this.sortOrderByType = "DESC";
		} /*else if (sortName.equals("best")) {
			this.sortColumn = "";
			this.sortOrderByType = "";
		}*/ else if (sortName.equals("highprice")) {
			this.sortColumn = "product_price";
			this.sortOrderByType = "DESC";
		} else if (sortName.equals("lowprice")) {
			this.sortColumn = "product_price";
			this.sortOrderByType = "ASC";
		}
	}

	public String getSortColumn() {
		return sortColumn;
	}

	public String getSortOrderByType() {
		return sortOrderByType;
	}
	
}
