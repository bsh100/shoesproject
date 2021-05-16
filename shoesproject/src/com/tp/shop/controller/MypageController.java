package com.tp.shop.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.shop.dto.OrderProdDto;
import com.tp.shop.dto.UserDto;
import com.tp.shop.service.UserService;

@Controller
public class MypageController {
	
	@Autowired
	UserService us;
	
	
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping("/mypage/interested")
	public String interested() {
		return "interested";
	}
	
	@RequestMapping("updateAddress")
	public String updateAddressPopUp() {
		return "updateAddress";
	}
	
	@RequestMapping("updateAddress.do")
	public void doUpdateAddress(@RequestParam("totalAddress") String address, @RequestParam("userId") String userId) {
		
		int num = us.updateUserAddress(address,userId);
		
		
	}
	
	@GetMapping("mypage/changePW")
	public String changePW() {
		return "changePassword";
	}
	@PostMapping("mypage/changePW")
	public String changePWdo(HttpServletRequest req, HttpSession session) {
		String password = req.getParameter("password");
		String userId = req.getParameter("userId");
		System.out.println(userId + password);
		us.updateUserPW(password,userId);
		System.out.println("비밀번호 변경 성공");
		session.setAttribute("msg", "성공적으로 비밀번호가 변경되었습니다.");
		session.setAttribute("url", "http://localhost:8090/mypage");
		return "redirect";
	}
	
	@PostMapping("mypage/checkPassword")
	@ResponseBody
	public int checkpw(@RequestBody Map<String, String> idpw) {
		//유저의 아이디에 해당하는 비밀번호가 맞는지 확인
		UserDto user  = us.selectUserByUserId(idpw.get("userId"));
		if(user.getPassword().equals(idpw.get("password"))) {
			return 1;
		}else {
			return 0;
		}
		
		
	}
	
	@RequestMapping("mypage/orderProd")
	public String orderProd(HttpSession session,Model m) {
		
		String userId = (String)session.getAttribute("userId");
		
		List<OrderProdDto> orderProdList = us.getOrderProdListByUserId(userId);
		m.addAttribute("orderProdList", orderProdList);
		return "orderProd";
	}
	
	@RequestMapping("mypage/secession")
	public String userSecession(Model m) {
		
		
	return null;	
	}
	
}
