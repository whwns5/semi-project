package semi.session;

public class sessionProductDTO {
	/** 상품 idx */
	private int product_idx;
	/** 상품 명 */
	private String product_name;
	/** 상품 코드 */
	private String product_code;
	/** 상품 색상 */
	private String product_color;
	/** 상품 대분류 카테고리 명 */
	private String lcid;
	/** 상품 소분류 카테고리 명 */
	private String scid;

	public sessionProductDTO() {
		super();
	}

	public sessionProductDTO(int product_idx, String product_name, String product_code, String product_color,
			String lcid, String scid) {
		super();
		this.product_idx = product_idx;
		this.product_name = product_name;
		this.product_code = product_code;
		this.product_color = product_color;
		this.lcid = lcid;
		this.scid = scid;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
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

	public String getLcid() {
		return lcid;
	}

	public void setLcid(String lcid) {
		this.lcid = lcid;
	}

	public String getScid() {
		return scid;
	}

	public void setScid(String scid) {
		this.scid = scid;
	}

	@Override
	public String toString() {
		return "sessionProductDTO [product_idx=" + product_idx + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_color=" + product_color + ", lcid=" + lcid + ", scid=" + scid + "]";
	}

	

}
