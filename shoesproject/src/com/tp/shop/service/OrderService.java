package com.tp.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.CartDto;
import com.tp.shop.dto.OrderDto;
import com.tp.shop.dto.ProductDto;
import com.tp.shop.mapper.java.CartMapper;
import com.tp.shop.mapper.java.OrderMapper;

@Service
public class OrderService {

	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	CartMapper cartMapper;
	
	
	public int addOrder(OrderDto order) {
		// order정보를 결재하려는 상품의 수에 맞게 반복하여 한개씩 DB에 insert할때 그 정보를 담을 TO객체
		System.out.println("주문되는 상품의 각 개수 :"+order.getPayProdCount());
		List<String> prodNoArr = (ArrayList<String>)order.getPayProdNoArr();
		List<String> countEachProd = order.getPayProdCount();
			orderMapper.addOrder(order);
			System.out.println("orderNo : "+order.getOrderNo());
			HashMap<String, String> orderProd = new HashMap<String, String>();
			orderProd.put("orderNo", Integer.toString(order.getOrderNo()));
			orderProd.put("status", "배송완료");//임의로 넣은 주문 상태값.
			for(int i=0;i<prodNoArr.size();i++) {
				orderProd.put("prodNo", prodNoArr.get(i));
				orderProd.put("countEachProd", countEachProd.get(i));
				orderMapper.addOrderProd(orderProd);
			orderProd.remove("prodNo");
			orderProd.remove("countEachProd");
		}
			// 결제를 한 뒤 카르를 비우는 mapper
		cartMapper.afterOrderDeleteCart(order.getUserId());
		return 1; 
	}


	
	public List<ProductDto> selectProdByCartNoList(List<Integer> cartNoList) {
		List<ProductDto> prodList = new ArrayList<ProductDto>();
		for(int i=0;i<cartNoList.size();i++) {
			System.out.println("조회할 cartNo : " + cartNoList.get(i));
			ProductDto prod = orderMapper.selectProdByCartNoList(cartNoList.get(i));
			System.out.println(prod);
			prodList.add(prod);
		}
		return prodList;
	}
	
	public List<ProductDto> selectProdByProdNoList(List<Integer> prodNoList){
		List<ProductDto> prodList = new ArrayList<ProductDto>();
		
		for(int i=0;i<prodNoList.size();i++) {
			ProductDto prod = orderMapper.selectProdByProdNoList(prodNoList.get(i));
			prodList.add(prod);
			
		}
		
		return prodList;
		
	}
	
	
	
	
	
}
