package com.tp.shop.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tp.shop.dto.LoginMessege;
import com.tp.shop.dto.UserDto;
import com.tp.shop.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService us;
	
	
	@PostMapping("/logincheck")
	@ResponseBody
	public LoginMessege loginCheck(@RequestBody UserDto user, LoginMessege messege, HttpSession session) {
		String userId = user.getUserId();
		String password = user.getPassword();
		System.out.println("서버로 넘겨받은 데이터 값 : "+userId+","+password);
		//받은 id,pw 값 중 id값 이용해서 유저 조회
		int num = us.loginChecking(userId,password,session);
		if(num==0){messege.setMessege("존재하지 않는 아이디입니다.");
		}else if(num==1) {messege.setMessege("비밀번호가 일치하지 않습니다.");
		}else if(num==2) {messege.setMessege(userId+"님, 로그인 성공하셨습니다.");
		}
		
		return messege;
	}
	
	@PostMapping("/getUserInfo")
	@ResponseBody
	public Map<String, String> getUserInfomation(@RequestBody Map<String, String> userInfo){
		try {
			
		UserDto user = us.selectUserByUserId(userInfo.get("userId"));
		
		userInfo.put("password", user.getPassword());
		userInfo.put("name", user.getName());
		userInfo.put("phone", user.getPhone());
		userInfo.put("email", user.getEmail());
		userInfo.put("address", user.getAddress());
		}catch(NullPointerException e) {
			System.out.println("유저가 로그인 상태가 아님");
		}
		
		
		return userInfo;
	}
}
