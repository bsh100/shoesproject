package com.tp.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tp.shop.common.Pager;
import com.tp.shop.dto.NoticeDto;
import com.tp.shop.dto.UserDto;
import com.tp.shop.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private Pager pager;

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String selectAll(Model model, HttpServletRequest request,HttpSession session ) {
		List<NoticeDto> noticeList = noticeService.selectAll();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pager", pager);// 페이저기능을 사용하기위해서 따로 넣어줘야함
		

		pager.init(noticeList, request);
		
		try {

			String userId = (String) session.getAttribute("userId");
			String userType = (String) session.getAttribute("userType");

			/* System.out.println(userType); */
			if (userType.equals("admin")) {
				return "admin/notice/list";
			}
		} catch (NullPointerException e) {
			System.out.println("로그인 안되어있음");
		}

		return "notice/list";

	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam int noticeId, HttpServletRequest request) {
		NoticeDto notice = noticeService.detail(noticeId);
		model.addAttribute("notice", notice);
		
		return "notice/detail";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist(Model model, HttpServletRequest request) {
		return "notice/regist";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(NoticeDto notice, Model model, HttpServletRequest request) {

		noticeService.insert(notice);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "글 작성 성공");
		mav.addObject("url", "/notice/list");
		mav.setViewName("message");
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, NoticeDto notice, HttpServletRequest request) {
		noticeService.update(notice);

		model.addAttribute("msg", "수정 성공");
		model.addAttribute("url", "/notice/detail?noticeId=" + notice.getNoticeId());
		return "/message";

	}

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model, @RequestParam int noticeId) {
		noticeService.delete(noticeId);

		model.addAttribute("url", "/notice/list");
		model.addAttribute("msg", "삭제 성공");
		return "/message";
	}
}
