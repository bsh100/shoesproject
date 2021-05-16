package com.tp.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;
import com.tp.shop.service.CustomerService;

@Controller
public class ListController {

//	@Autowired
//	ListService ls;
	
	@Autowired
	CustomerService customerservice;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest req, Model m,
		  @RequestParam(required = false, defaultValue = "1") int page,
  		  @RequestParam(required = false, defaultValue = "1") int range,
  		  @RequestParam(required = false, defaultValue = "Name") String searchType,
  		  @RequestParam(required = false) String keyword,
  		  @ModelAttribute("search") Search search
			) {
		String cate = req.getParameter("cate");
		
		m.addAttribute("search", search);
  	    search.setSearchType(searchType);
  	    search.setKeyword(keyword);
		 
  	    int listCnt = customerservice.listCount(search);
  	    
  	  	search.pageInfo(page, range, listCnt);
		
		m.addAttribute("pagination", search);	
		m.addAttribute("list", customerservice.customerCategoryList(search));
		return "list";
	}
	
	
	
	
}
