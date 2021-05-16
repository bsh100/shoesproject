package com.tp.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tp.shop.dto.CartDto;
import com.tp.shop.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
  
	@Autowired
	CartService cs;
	
	String userId;
	
	
	@RequestMapping(value = "/cartView", method = RequestMethod.GET)
	public String selectCartList(Model m, HttpServletRequest req, HttpSession session) {
		
//		UserDto user = (UserDto) session.getAttribute("asdf");
//		System.out.println(user);
		userId = (String)session.getAttribute("userId");				//user.getUserId();
		System.out.println(userId);
		 
		List<CartDto> cartList = cs.selectCart(userId);
		System.out.println(cartList);
		m.addAttribute("cartList", cartList);
		return "cartView";
	}
	
	// 장바구니 row 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String deleteCartProd(@RequestParam String cartNo, HttpSession session) {
			
			userId = (String)session.getAttribute("userId");
			//System.out.println(prodNo);
			cs.deleteCartProd(cartNo, userId);
			return "redirect:/cart/cartView";
		}
	

		// 선택 삭제
		@RequestMapping(value = "/deleteList", method = RequestMethod.POST)
		@ResponseBody
		public String deleteCartProd(@RequestParam(value = "chBox[]") List<Integer> checkedArr,Model m,HttpSession session) {
			System.out.println(checkedArr);
			userId = (String)session.getAttribute("userId");
				for(int i=0;i<checkedArr.size();i++) {
					cs.deleteCartProd(checkedArr.get(i).toString(), userId);
					System.out.println(checkedArr.get(i).toString());
					System.out.println("삭제완료");
				}

				return "1";
		}
	
	
		//수량 증가
		@RequestMapping(value = "/upCartCount", method=RequestMethod.POST)
		@ResponseBody
		public String upCartCount(@RequestBody Map updateCartInfo, HttpSession session) {

			userId = (String)session.getAttribute("userId"); // 임의의 값. 원래 session에 저장되어 있는 userId를 가져와서 저장해야함.
			String prodName = (String)updateCartInfo.get("prodName");
			String prodColor = (String)updateCartInfo.get("prodColor");
			String prodSize = (String)updateCartInfo.get("prodSize");
			
			String prodNo = Integer.toString(cs.getProdNo(userId, prodName, prodColor, prodSize));
			System.out.println("cartDB에 추가할 상품번호 : " + prodNo);
			
			cs.upCountCartProd(prodNo, userId);
			System.out.println("수량 추가");
			return "d";
		}
	
		// 수량 감소
		@RequestMapping(value = "/downCartCount", method = RequestMethod.POST)
		@ResponseBody
		public String downCartCount(@RequestBody Map updateCartInfo, HttpSession session) {
			
			userId = (String)session.getAttribute("userId"); // 임의의 값. 원래 session에 저장되어 있는 userId를 가져와서 저장해야함.
			String prodName = (String)updateCartInfo.get("prodName");
			String prodColor = (String)updateCartInfo.get("prodColor");
			String prodSize = (String)updateCartInfo.get("prodSize");
			
			String prodNo = Integer.toString(cs.getProdNo(userId, prodName, prodColor, prodSize));
			System.out.println("cartDB에 추가할 상품번호 : " + prodNo);
			
			cs.downCountCartProd(prodNo, userId);
			System.out.println("수랑 감소");
			
			return "d";
		}
	
	
	//장바구니에 담기기능 cartadd 
	@RequestMapping(value = "/addCart", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String insertCart(
			@RequestBody Map<String, Object> cartData,HttpSession session) {
		
		@SuppressWarnings("unchecked")//검증되지 않은 연산자 관련 경고를 표시 안함
		List<Integer> NoList = (ArrayList<Integer>)cartData.get("prodNo");

		@SuppressWarnings("unchecked")//검증되지 않은 연산자 관련 경고를 표시 안함
		List<String> count = (List<String>)cartData.get("count");
		
		userId = (String)session.getAttribute("userId");
//		System.out.println(NoList.get(0));
//		System.out.println(count.get(0));
//		System.out.println(cartData.get("prodNo"));
//		System.out.println(cartData.get("count"));
//		System.out.println(cartData.get("userId"));
		
		for (int i = 0; i < count.size(); i++) {
			
			for (int j = 0; j < Integer.parseInt(count.get(i)); j++) {
				
				cs.insertCart(NoList.get(i), userId);
			}
		}
		return null;
	}
	

}
