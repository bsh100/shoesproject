package com.tp.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService ms;
	
	
	
	@RequestMapping("/main")
	public String main(Model m,HttpSession session) {
		List<ProductDto> bestProdList = ms.getBestProdList();
		System.out.println(bestProdList);
		//best5 상품 조회 , 카테고리 조회
		m.addAttribute("bestProdList",bestProdList);
		if(session.getAttribute("cate")==null) {
		List<String> cate = ms.getCate();
		session.setAttribute("cate", cate);
		}
		return "main";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "logout";
	}
	
	
}
