package com.tp.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {

	@RequestMapping("/redirect")
	public String redirect() {
		return "redirect";
	}
	
}
