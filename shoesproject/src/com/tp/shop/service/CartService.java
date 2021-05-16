package com.tp.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.CartDto;
import com.tp.shop.mapper.java.CartMapper;

@Service
public class CartService {

	@Autowired
	CartMapper cartMapper;
	
	
	public List<CartDto> selectCart(String userId){
		// 중복을 제거한 유저의 장바구니 상품리스트를 받는다.
		List<CartDto> noDupl = cartMapper.selectCart(userId);
		// 그 상품들의 상품 아이디를 받을 리스트를 생성한다.
		List<Integer> prodId = new ArrayList<Integer>();
		// 파라미터롤 넣어줄 hashmap생성
		HashMap<String, String> produser = new HashMap<String,String>();
		// 상품의 아이디를 추출한다.
		
		produser.put("userId", userId);
		
		
		for(int i=0;i<noDupl.size();i++) {
			
			String pn = Integer.toString(noDupl.get(i).getProdNo());
			produser.put("prodNo", pn);
			Integer count = cartMapper.getCount(produser);
			//System.out.println(count);
			noDupl.get(i).setCount(count);
			//System.out.println(noDupl.get(i).getProdName()+"상품이 장바구니에 담긴 수량  : " + noDupl.get(i).getCount());
			produser.remove("prodNo");
		}
		
		return noDupl; 
	}
	
	public void deleteCartProd(String cartNo, String userId) {
		HashMap<String, String> deleteRow = new HashMap<String, String>();
		System.out.println("asdf"+cartNo);
		String prodNo = Integer.toString(cartMapper.selectProdNoByCartNo(cartNo));
		System.out.println("해당유저의 장바구니중 삭제할 상품의 번호 : "+prodNo);
		deleteRow.put("prodNo", prodNo);
		deleteRow.put("userId",	userId);
		cartMapper.deleteCartProd(deleteRow);
	}
	

	public int getProdNo(String userId, String prodName, String prodColor, String prodSize) {
		HashMap<String, String> InfoforProd = new HashMap<String, String>();
		InfoforProd.put("userId", userId);
		InfoforProd.put("prodName", prodName);
		InfoforProd.put("prodColor", prodColor);
		InfoforProd.put("prodSize", prodSize);
		return cartMapper.getProdNo(InfoforProd);
	}

	public void upCountCartProd(String prodNo, String userId) {
		HashMap<String, String> insertInfo = new HashMap<String, String>();
		insertInfo.put("prodNo", prodNo);
		insertInfo.put("userId", userId);
		
		cartMapper.insertCartProd(insertInfo);
			// 카트에 담긴 상품의 수량을 ++
		
	}

	public void insertCart(int prodNo, String userId) {
		
		cartMapper.insertCart(prodNo, userId);
			// 카트에 담긴 상품의 수량을 ++
		
	}

	public void downCountCartProd(String prodNo, String userId) {
		HashMap<String, String> deleteInfo = new HashMap<String, String>();
		deleteInfo.put("prodNo", prodNo);
		deleteInfo.put("userId", userId);
		
		cartMapper.deleteProdCart(deleteInfo);
		// 카트에 담긴 상품의 수량을 --
		
	}
}
