package com.tp.shop.aspect;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

public class MyAspect {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletResponse response;
	
	
	
	public void before() {
		System.out.println(".");
	}
	
	public void after() {
		System.out.println(".");
	}
	
	public void afterReturnning(String returnURL) {
		System.out.println("This is afterReturning Cross Cutting Method : " + returnURL);
		String userId = (String)session.getAttribute("userId");
		if(userId == null) {
			System.out.println("null!");
			try {
				session.setAttribute("url", "http://localhost:8090/login");
				session.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				response.sendRedirect("http://localhost:8090/redirect");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void afterThorowing(Throwable th) {
		System.out.println("This is afterThorowing Cross Cutting Method");
		th.printStackTrace();
	}
	
}
