package com.tp.shop.mapper.java;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tp.shop.dto.OrderDto;
import com.tp.shop.dto.ProductDto;

public interface OrderMapper {

	int addOrder(OrderDto order);

	ProductDto selectProdByCartNoList(int cartNo);

	void addOrderProd(HashMap<String, String> orderProd);
	
	int updateUserMoney(OrderDto order);
	
	int insertAccountInfo(OrderDto order);
	
	ProductDto selectProdByProdNoList(Integer prodNo);

}
