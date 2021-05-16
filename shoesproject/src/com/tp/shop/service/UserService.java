package com.tp.shop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.tp.shop.dto.OrderProdDto;
import com.tp.shop.dto.UserDto;

public interface UserService {

	int loginChecking(String userId,String password, HttpSession session);

	int insertUser(UserDto user);

	int duplicationIdCheck(String checkId);

	UserDto selectUserByUserId(String userId);

	int updateUserAddress(String address, String userId);

	void updateUserPW(String password, String userId);

	List<OrderProdDto> getOrderProdListByUserId(String userId);


	
	
}
