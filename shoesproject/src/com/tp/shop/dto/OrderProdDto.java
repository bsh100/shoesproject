package com.tp.shop.dto;

import java.time.LocalDateTime;

public class OrderProdDto {

	String pictureUrl;
	String prodName;
	String prodSize;
	String prodColor;
	String regDate;
	String orderNo;
	String orderStatus;
	String count;
	String prodPrice;
	
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getpictureUrl() {
		return pictureUrl;
	}
	public void setpictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdSize() {
		return prodSize;
	}
	public void setProdSize(String prodSize) {
		this.prodSize = prodSize;
	}
	public String getProdColor() {
		return prodColor;
	}
	public void setProdColor(String prodColor) {
		this.prodColor = prodColor;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "OrderProdDto [pictureUrl=" + pictureUrl + ", prodName=" + prodName + ", prodSize=" + prodSize + ", prodColor="
				+ prodColor + ", regDate=" + regDate + ", orderNo=" + orderNo + ", orderStatus=" + orderStatus + "]";
	}
	
	
	
	
	
}
