package com.tp.shop.dto;

import java.sql.Date;
import java.util.List;

public class OrderDto {

	private int orderNo;
	private String userId;
	private int prodNo;
	private String respName;
	private String respAddress;
	private String respPhone;
	private Date regDate;
	private String userName;
	private String respMsg;
	private List<String> payProdNoArr;
	private List<String> payProdCount;

	private int totalPrice;
	
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setgetTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	
	@Override
	public String toString() {
		return "OrderDto [orderNo=" + orderNo + ", userId=" + userId + ", prodNo=" + prodNo + ", respName=" + respName
				+ ", respAddress=" + respAddress + ", respPhone=" + respPhone + ", regDate=" + regDate + ", userName="
				+ userName + ", respMsg=" + respMsg + ", payProdNoArr=" + payProdNoArr + "]";
	}
	
	
	public List<String> getPayProdCount() {
		return payProdCount;
	}


	public void setPayProdCount(List<String> payProdCount) {
		this.payProdCount = payProdCount;
	}


	public List<String> getPayProdNoArr() {
		return payProdNoArr;
	}

	public void setPayProdNoArr(List<String> payProdNoArr) {
		this.payProdNoArr = payProdNoArr;
	}

	public String getRespMsg() {
		return respMsg;
	}
	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	public String getRespName() {
		return respName;
	}
	public void setRespName(String respName) {
		this.respName = respName;
	}
	public String getRespAddress() {
		return respAddress;
	}
	public void setRespAddress(String respAddress) {
		this.respAddress = respAddress;
	}
	public String getRespPhone() {
		return respPhone;
	}
	public void setRespPhone(String respPhone) {
		this.respPhone = respPhone;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
