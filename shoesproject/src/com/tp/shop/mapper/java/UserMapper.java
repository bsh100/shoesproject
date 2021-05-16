package com.tp.shop.mapper.java;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tp.shop.dto.OrderProdDto;
import com.tp.shop.dto.UserDto;

public interface UserMapper {
	
	UserDto selectUserById(String userId);

	int insertUser(UserDto user);

	int updateUserAddress(@Param("address")String address, @Param("userId")String userId);

	void updateUserPW(HashMap<String, String> forUpdatePW);

	List<OrderProdDto> getOrderProdListByUserId(String userId);

}
