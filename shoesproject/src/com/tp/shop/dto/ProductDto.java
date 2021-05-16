package com.tp.shop.dto;


public class ProductDto {
	   private int prodNo;
	   private String prodCategory;
	   private String prodName;
	   private int prodPrice;
	   private int prodSize;
	   private String prodColor;
	   private int prodStock;
	   private String prodDescription;
	   private String pictureUrl;
	   
	public ProductDto() {}

	
	
	public ProductDto(int prodNo, String prodCategory, String prodName, int prodPrice, int prodSize, String prodColor,
			int prodStock, String prodDescription, String pictureUrl, String thumbnailImg) {
		super();
		this.prodNo = prodNo;
		this.prodCategory = prodCategory;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodSize = prodSize;
		this.prodColor = prodColor;
		this.prodStock = prodStock;
		this.prodDescription = prodDescription;
		this.pictureUrl = pictureUrl;
	}



	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdSize() {
		return prodSize;
	}

	public void setProdSize(int prodSize) {
		this.prodSize = prodSize;
	}

	public String getProdColor() {
		return prodColor;
	}

	public void setProdColor(String prodColor) {
		this.prodColor = prodColor;
	}

	public int getProdStock() {
		return prodStock;
	}

	public void setProdStock(int prodStock) {
		this.prodStock = prodStock;
	}

	public String getProdDescription() {
		return prodDescription;
	}

	public void setProdDescription(String prodDescription) {
		this.prodDescription = prodDescription;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}



	@Override
	public String toString() {
		return "ProductDto [prodNo=" + prodNo + ", prodCategory=" + prodCategory + ", prodName=" + prodName
				+ ", prodPrice=" + prodPrice + ", prodSize=" + prodSize + ", prodColor=" + prodColor + ", prodStock="
				+ prodStock + ", prodDescription=" + prodDescription + ", pictureUrl=" + pictureUrl + ", thumbnailImg="
				+ "]";
	}

	
}
