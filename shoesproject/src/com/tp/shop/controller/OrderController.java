package com.tp.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.shop.dto.OrderDto;
import com.tp.shop.dto.ProductDto;
import com.tp.shop.service.CartService;
import com.tp.shop.service.OrderService;

@Controller
@RequestMapping("/")
public class OrderController {

	
	

	@Autowired
	OrderService os;
	@Autowired
	CartService cs;
	
	String userId;
	
	@RequestMapping("/order")
	public String order() {
		return "order";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/order/atProdDetail", method = RequestMethod.POST)
	@ResponseBody
	public String selectCartOder(Model m,@RequestBody Map<String, Object> abc, HttpSession session,HttpServletResponse response) {
		String msg ="";
		userId = (String)session.getAttribute("userId");
		
		List<Integer> prodNoList = (List<Integer>)abc.get("prodNo");
		List<ProductDto> prodList = os.selectProdByProdNoList(prodNoList);
		List<String> countList = (List<String>)abc.get("count");
		
		for (int i = 0; i < prodList.size(); i++) {
			// 재고가 충분하지 않은 조건
			System.out.println("stock : " + prodList.get(i).getProdStock());
			System.out.println("needProdCount : " + countList.get(i));
			
			if (prodList.get(i).getProdStock() - Integer.parseInt(countList.get(i)) < 0) {
				// 메세지에 문자열을 추가하는
				msg += prodList.get(i).getProdName() + prodList.get(i).getProdColor() + prodList.get(i).getProdSize()
						+ " 상품의 재고가 부족합니다.";

			}

		}
		if(msg.equals("")) {
			session.setAttribute("prodList", prodList);
			session.setAttribute("cartCountList", countList);
		}
		System.out.println(msg);
		return msg;
	}
	
	@RequestMapping("/order/atCartView")
	@ResponseBody
	public String cartNoToProdInfo(@RequestParam("cartNoArr[]") List<Integer> cartNoList, @RequestParam("cartCountArr[]") List<Integer> cartCountList, HttpSession session) {
		System.out.println(cartNoList);
		System.out.println(cartCountList);
		List<ProductDto> prodList = os.selectProdByCartNoList(cartNoList);
		
		String msg = "";
		
		for(int i=0;i<prodList.size();i++) {
				// 재고가 충분하지 않은 조건
			System.out.println("stock : "+prodList.get(i).getProdStock());
			System.out.println("needProdCount : " +cartCountList.get(i));
			if((prodList.get(i).getProdStock() - cartCountList.get(i)) < 0) {
				// 메세지에 문자열을 추가하는 
				msg += prodList.get(i).getProdName()+prodList.get(i).getProdColor()+prodList.get(i).getProdSize()+" 상품의 재고가 부족합니다./n";
				
			}
			
		}
		
		if(msg.equals("")) {
			session.setAttribute("prodList", prodList);
			session.setAttribute("cartCountList", cartCountList);
		}
		System.out.println(msg);
		return msg;
	}
	
	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	@ResponseBody
	public int addOrder(@RequestBody OrderDto order,HttpSession session) {
		
		System.out.println("받은 주문 정보 : "+order);
		
		session.removeAttribute("prodList");
		session.removeAttribute("cartCountList");
		
		int x = os.addOrder(order);
		return x;
	}
	
	@RequestMapping("/orderResult")
	public String goOrderResult() {
		return "orderResult";
	}
}

