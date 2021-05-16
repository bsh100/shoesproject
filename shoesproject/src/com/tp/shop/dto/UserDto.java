package com.tp.shop.dto;

public class UserDto {
	private int userNo;
	private String userType;
	private String userId;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	private int money;

	public UserDto() {}

	public UserDto(int userNo, String userType, String userId, String password, String name, String address, String phone,
			String email, int money) {
		super();
		this.userNo = userNo;
		this.userType = userType;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.money = money;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "UserDto [userNo=" + userNo + ", userType=" + userType + ", userId=" + userId + ", password=" + password
				+ ", name=" + name + ", address=" + address + ", phone=" + phone + ", email=" + email + ", money="
				+ money + "]";
	}
	
	
	
}
