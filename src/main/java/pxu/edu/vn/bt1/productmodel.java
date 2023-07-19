package pxu.edu.vn.bt1;

public class productmodel {
	private int productID;
	private String productName;

	public productmodel() {
		super();
	}

	public productmodel(int productID, String productName) {
		super();
		this.productID = productID;
		this.productName = productName;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "productmodel [productID=" + productID + ", productName=" + productName + "]";
	}

}
