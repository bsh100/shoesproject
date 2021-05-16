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
import com.tp.shop.dto.QnaDto;
import com.tp.shop.dto.UserDto;
import com.tp.shop.qna.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private Pager pager;// 앞쪽에 페이징을 빈으로 등록하고 여러번 재사용할수잇게 해줌

	@Autowired
	private QnaService qnaService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String selectAll(Model model, HttpServletRequest request,HttpSession session) {
		List<QnaDto> qnaList = qnaService.selectAll();
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pager", pager);// 페이저기능을 사용하기위해서 따로 넣어줘야함

		pager.init(qnaList, request);
		
		try {

			String userId = (String) session.getAttribute("userId");
			String userType = (String) session.getAttribute("userType");

			/* System.out.println(userType); */
			if (userType.equals("admin")) {
				return "admin/qna/list";
			}
		} catch (NullPointerException e) {
			System.out.println("로그인 안되어있음");
		}

		return "qna/list";// /web-inf/view/qna/list.jsp
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam int qnaNo, HttpServletRequest request,HttpSession session) {
		QnaDto qna = qnaService.detail(qnaNo);
		model.addAttribute("qna", qna);
		try {

			String userId = (String) session.getAttribute("userId");
			String userType = (String) session.getAttribute("userType");

			System.out.println(userType);
			if (userType.equals("admin")) {
				return "admin/qna/detail";
			}
		} catch (NullPointerException e) {
			System.out.println("로그인 안되어있음");
		}
		return "qna/detail";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist(Model model, HttpServletRequest request) {
		return "qna/regist";
	}

	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public ModelAndView insert(QnaDto qna, Model model, HttpServletRequest request) {
		/* System.out.println(qna); */
		qnaService.insert(qna);
		/* System.out.println("s"); */
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","글 작성 성공");
		mav.addObject("url","/qna/list");
		mav.setViewName("message");
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, QnaDto qna, HttpServletRequest request) {
		qnaService.update(qna);

		model.addAttribute("msg", "수정 성공");
		model.addAttribute("url", "/qna/detail?qnaNo="+qna.getQnaNo());
		return "/message";

	}

	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model, @RequestParam int qnaNo) {
		qnaService.delete(qnaNo);

		model.addAttribute("url", "/qna/list");
		model.addAttribute("msg", "삭제 성공");
		return "/message";
	}
	
	@RequestMapping(value= "/reply", method=RequestMethod.POST)
	   public String adminCsLists(HttpServletRequest request, Model model, int qnaNo) {
			QnaDto qna=qnaService.detail(qnaNo);
			model.addAttribute("qna", qna);
			return "admin/qna/reply";
	   }
	   
	   @RequestMapping(value="/reply/regist", method=RequestMethod.POST)
		public ModelAndView reply(QnaDto qna,Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("userId");
			qna.setQnaWriter(userId);
			qnaService.reply(qna);	
//			qnaService.updateRank(qna);
			ModelAndView mav = new ModelAndView();
			mav.addObject("url", "/admin/qna/list");
			mav.addObject("msg", "글 등록 성공");
			mav.setViewName("/message");
			return mav;
		}
	}


