package com.tp.shop.mapper.java;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tp.shop.dto.CartDto;

public interface CartMapper {
	
	

	// 장바구니 조회
		public List<CartDto> selectCart(String userId);
		
		// 장바구니 우측 해당 ROW 삭제버튼
		public void deleteCartProd(HashMap<String, String> deleteRow);
		

		public Integer getCount(HashMap<String,String> produser);

		public int getProdNo(HashMap<String,String> InfoforProd);

		public void insertCartProd(HashMap<String, String> insertInfo);

		public void deleteProdCart(HashMap<String, String> deleteInfo);

		public int selectProdNoByCartNo(String cartNo);

		public void insertCart(@Param("prodNo")int prodNo, @Param("userId") String userId );
		
		public void afterOrderDeleteCart(String userId);
}
