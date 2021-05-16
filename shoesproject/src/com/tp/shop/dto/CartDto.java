package com.tp.shop.dto;

public class CartDto {

	private int cartNo;
	private String userId;
	private int prodNo;
	private int count;
	private String pictureUrl;
	
	
	
	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	private String prodName;
	private int prodSize;
	private String prodColor;
	private int prodPrice;
	
	
	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
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

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public CartDto() {
		this.count=1;
		}
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	@Override
	public String toString() {
		return "CartDto [cartNo=" + cartNo + ", userId=" + userId + ", prodNo=" + prodNo + ", count=" + count
				+ ", prodName=" + prodName + ", prodSize=" + prodSize + ", prodColor=" + prodColor + ", prodPrice="
				+ prodPrice + "]";
	}
	
	
}
