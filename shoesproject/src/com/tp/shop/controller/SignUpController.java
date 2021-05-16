package com.tp.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.shop.dto.UserDto;
import com.tp.shop.service.UserService;

@Controller
@RequestMapping("/signup")
public class SignUpController {

	@Autowired
	UserService us;
	
	@GetMapping
	public String gosignup() {
		return "signup";
	}
	@PostMapping
	public void insertUser(@RequestBody UserDto user,HttpSession session) {
		us.insertUser(user);
		System.out.println("회원가입성공");
		us.loginChecking(user.getUserId(), user.getPassword(), session);
		System.out.println(session.getAttribute("userId"));
	}
	
	@GetMapping(value = "/duplicateCheck", produces = "application/text; charset=utf8")
	@ResponseBody
	public String duplicationCheck(@RequestParam("checkId") String checkId) {
		System.out.println(checkId);
		int x = us.duplicationIdCheck(checkId);
		String msg = null;
		if(x==1) {
			msg = "이미 존재하는 아이디입니다.";
;		}else if(x==0) {
			msg = "사용 가능한 아이디입니다.";
		}
		return msg;
	}
	
	
}
