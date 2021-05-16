package com.tp.shop.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.tp.shop.dto.OrderProdDto;
import com.tp.shop.dto.UserDto;
import com.tp.shop.mapper.java.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper um;

	@Override
	public int loginChecking(String userId,String password,HttpSession session) {
		// 조회할때 주의할 점. 반환타입은 유저객체 하나 입니다. 무심코 DB에 userId를 중복으로 등록하지 않았는지 확인하세요. 회원가입할때 아이디중복을 거를 것 입니다.
		System.out.println(userId+" <- select 할 유저아이디");
		UserDto user = null;
		

		try{
			user = um.selectUserById(userId);
		System.out.println("조회된 아이디"+ user);
		// 만약 조회된 계정이 없다면 에러메세지 : 존재하는 아이디가 없습니다 .
		// 만약 조회된 계정의 비밀번호와 입력받은 비밀번호가 일치하지 않는다면 에러메세지 : 비밀번호가 일치하지 않습니다.
		if(!user.equals(null)) {
			
			if(user.getUserNo() != 0 && user.getPassword().equals(password)) {
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userType", user.getUserType());
				return 2;	// 로그인 성공
			}
			
			if(user.getUserNo() != 0 && !user.getPassword().equals(password)) {
				return 1; // 비밀번호가 일치하지 않습니다. 
			}
			
		}
		}catch(NullPointerException e){
			System.out.println("조회된 아이디가 없음.");
		}
		return 0;
		
		// 아이디없음 : 0 , 비밀번호 틀림 : 1 , 로그인 성공 : 2
	}

	@Override
	public int insertUser(UserDto user) {
		
		int newId = um.insertUser(user);// 새로 추가된 계정의 user_no ( id )
		
		return newId;
	}

	@Override
	public int duplicationIdCheck(String checkId) {
		UserDto user = null;
		try {
			user = um.selectUserById(checkId);
			if(!user.equals(null)) {
				return 1;
			}
		}catch(NullPointerException e) {
			System.out.println("조회없음");
		}
		return 0;
	}

	@Override
	public UserDto selectUserByUserId(String userId) {
		return um.selectUserById(userId);
	}

	@Override
	public int updateUserAddress(String address, String userId) {
			int num = um.updateUserAddress(address,userId);
			System.out.println(num);
		return 0;
	}

	@Override
	public void updateUserPW(String password, String userId) {
		HashMap<String, String> forUpdatePW = new HashMap<String, String>();
		forUpdatePW.put("userId", userId);
		forUpdatePW.put("password", password);
		um.updateUserPW(forUpdatePW);
	}

	@Override
	public List<OrderProdDto> getOrderProdListByUserId(String userId) {

		return um.getOrderProdListByUserId(userId);
	}

}
