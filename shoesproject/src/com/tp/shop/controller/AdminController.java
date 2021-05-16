package com.tp.shop.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tp.shop.common.Pager;
import com.tp.shop.dto.NoticeDto;
import com.tp.shop.dto.Pagination;
import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.QnaDto;
import com.tp.shop.dto.Search;
import com.tp.shop.notice.NoticeService;
import com.tp.shop.qna.QnaService;
import com.tp.shop.service.AdminService;
import com.tp.shop.service.AdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

   @Autowired
   AdminService adminservice;
   
   @Autowired
   QnaService qnaservice;
   
   @Autowired
   NoticeService noticeService;
   
   @Autowired
   Pager pager;
   
   @RequestMapping(value="/insert", method = RequestMethod.GET)
   public String write() {
      return "productWrite";
   }
   
   //상품등록
      @RequestMapping(value="/insert", method = RequestMethod.POST)
      public String insert(ProductDto dto, MultipartFile file) {
         
         String path = "C:\\Users\\최병준\\git\\TeamPJ\\TeamProject\\WebContent\\WEB-INF\\view\\images";
         
         if(!file.isEmpty()) {

            File f = new File(path, file.getOriginalFilename());
            try {
               f.mkdirs();
               
               file.transferTo(f);
            } catch (Exception e) {
               e.printStackTrace();
            }
            dto.setPictureUrl(file.getOriginalFilename());
            adminservice.insertProduct(dto);
         }
         return "redirect:/admin/list";
      }

      //상품 리스트 뽑기
      @RequestMapping("/list")
      public ModelAndView listProduct(ModelAndView mav,
    		  @RequestParam(required = false, defaultValue = "1") int page,
    		  @RequestParam(required = false, defaultValue = "1") int range,
    		  @RequestParam(required = false, defaultValue = "Name") String searchType,
    		  @RequestParam(required = false) String keyword,
    		  @ModelAttribute("search") Search search
    		  ){
    	 
    	  mav.addObject("search", search);
    	  search.setSearchType(searchType);
    	  search.setKeyword(keyword);
    	  
    	  
//    	 Pagination pagination = new Pagination();
//    	 pagination.pageInfo(page, range, listCnt);
    	  
    	  int listCnt = adminservice.listCount(search);
    	 
    	 search.pageInfo(page, range, listCnt);
    	 
         mav.setViewName("productList");
         mav.addObject("pagination", search);
         mav.addObject("list", adminservice.listProduct(search));
         return mav;
      }
      
      //상품 수정 리스트
      @GetMapping("/updateList/{prodName}")
      public ModelAndView updateList(
            ModelAndView mav, @PathVariable("prodName") String ProdName) {
         mav.setViewName("productUpdateList");
         mav.addObject("updateList", adminservice.updateList(ProdName));
         return mav;
      }
      
      //상품 수정 페이지 매핑
      @RequestMapping("/update/{prodNo}")
      public ModelAndView updateProduct(
            ModelAndView mav, @PathVariable("prodNo") int prodNo) {
         mav.setViewName("productUpdate");
         mav.addObject("dto", adminservice.selectByNo(prodNo));
         return mav;
      }
      //상품 수정 처리
      @RequestMapping("/update")
      public String update(ProductDto dto, MultipartFile file) {
         
         System.out.println(dto.getProdNo());
         String path = "C:\\Users\\최병준\\git\\TeamPJ\\TeamProject\\WebContent\\WEB-INF\\view\\images";
         
         if(!file.isEmpty()) {
            File f = new File(path, file.getOriginalFilename());
            try {
               f.mkdirs();
               file.transferTo(f);
            } catch (Exception e) {
               e.printStackTrace();
            }
            dto.setPictureUrl(file.getOriginalFilename());
            adminservice.updateProduct(dto);
         //첨부파일이 변경이 되지 않을경우
         }else {
            //기존의 파일명
            ProductDto dto2 = adminservice.selectByNo(dto.getProdNo());
            dto.setPictureUrl(dto2.getPictureUrl());
            System.out.println(dto2);
            adminservice.updateProduct(dto);
         }
         return "   redirect:/admin/list";
      }
      
      @RequestMapping("/delete")
      public String deleteProduct(int prodNo) {
         adminservice.deleteProduct(prodNo);
         return "redirect:/admin/list";
      }
      
      
      //상세페이지
      @GetMapping("/detail/{prodName}")
      public ModelAndView detailProduct(
            ModelAndView mav, @PathVariable(name = "prodName") String prodName) {
         
         
         mav.setViewName("productDetail");
         mav.addObject("dto", adminservice.selectByName(prodName));
         mav.addObject("colorsize", adminservice.productColorSize(prodName));
         return mav;
      }
      
      //상세페이지 컬러 이름을 통해 조회하고 사이즈 가져오기
      @GetMapping(value = "/getSize")
      @ResponseBody
      public List<Integer> getSize(@RequestParam("color") String color, @RequestParam("prodName") String prodName,Model m){
         
//         System.out.println(color+prodName);
         List<Integer> size = adminservice.getProdSizeByColor(color,prodName);
//         System.out.println(size);
         return size;
      }
      
      //상세페이지 장바구니로 넘겨줄 prodNo 값 가져오기
      @GetMapping(value = "/getNo")
      @ResponseBody
      public int getProdNo(
            @RequestParam("prodName") String name, 
            @RequestParam("prodColor") List<String> color,
            @RequestParam("prodSize") List<String> size) {
//         System.out.println(name);
//         System.out.println(color.get(0));
//         System.out.println(size.get(0));
         int prodNo = adminservice.getProdNo(name, color.get(0), size.get(0));
         
         return prodNo;
      }
      
      @PostMapping(value="/addCart", produces = "text/html; charset=utf-8")
      @ResponseBody
      public String addCart(ProductDto dto) {
         String prodName = dto.getProdName();
         String prodColor = dto.getProdColor();
         int prodSize = dto.getProdSize();
         adminservice.productNo(prodName, prodColor, prodSize);
         return "전송완료!";
      }
   
   //qna list
      @RequestMapping(value="/qna/list", method=RequestMethod.GET)
      public String selectAll(Model model, HttpServletRequest request) {
         List qnaList = qnaservice.selectAll();
         model.addAttribute("qnaList", qnaList);
         model.addAttribute("pager", pager);//이거 넣기!!!
         
         pager.init(qnaList, request);
         
         return "admin/qna/list";
      }
      //qna 상세보기
      @RequestMapping(value="/qna/detail", method=RequestMethod.GET)
      public String detail(Model model,@RequestParam int qnaNo,HttpServletRequest request) {   
         QnaDto qna=qnaservice.detail(qnaNo);
         model.addAttribute("qna", qna);
         return "admin/qna/detail";
      }

      //qna 등록
      @RequestMapping(value="/qna/regist", method= RequestMethod.GET)
      public String insert(Model model, HttpServletRequest request) {
         return "admin/qna/regist";
      }
      
       //qna 등록
      @RequestMapping(value="/qna/insert", method=RequestMethod.POST)
      public ModelAndView insert(QnaDto qna,Model model, HttpServletRequest request) {
         qnaservice.insert(qna);
         System.out.println(qna.getQnaTitle());
         System.out.println(qna.getQnaWriter());
         System.out.println(qna.getQnaContent());
         ModelAndView mav = new ModelAndView();
         mav.addObject("url", "/admin/qna/list");
         mav.addObject("msg", "글 등록 성공");
         mav.setViewName("/message");
         return mav;
      }
      
      //qna 수정
      @RequestMapping(value="/qna/update", method= RequestMethod.POST)
      public String update(Model model,QnaDto qna, HttpServletRequest request) {
         qnaservice.update(qna);
         
         model.addAttribute("msg", "수정 성공");
         model.addAttribute("url", "/qna/detail?qnaNo="+qna.getQnaNo());
         return "/message";

      }
      
      //qna 삭제
      @RequestMapping(value="/qna/del", method=RequestMethod.GET)
      public String delete(HttpServletRequest request, Model model,@RequestParam int qnaNo) {
         qnaservice.delete(qnaNo);
         
         model.addAttribute("url", "/qna/list");
         model.addAttribute("msg", "삭제 성공");
         return "/message";
      }
      
        //게시판 리스트
      @RequestMapping(value="/notice/list", method=RequestMethod.GET)
      public String noticeSelectAll(Model model, HttpServletRequest request) {
         List noticeList = noticeService.selectAll();
         model.addAttribute("noticeList", noticeList);
         model.addAttribute("pager", pager);
         
         pager.init(noticeList, request);
         
         return "admin/notice/list";
      }
      
      //게시글 상세보기
      @RequestMapping(value="/notice/detail", method=RequestMethod.GET)
      public String noticeDetail(Model model,@RequestParam int noticeId,HttpServletRequest request) {   
         NoticeDto notice=noticeService.detail(noticeId);
         model.addAttribute("notice", notice);
         return "admin/notice/detail";
      }

      //게시글 등록
      @RequestMapping(value="/notice/regist", method= RequestMethod.GET)
      public String noticeInsert(Model model, HttpServletRequest request) {
         return "admin/notice/regist";
      }
      
      //게시글 등록
      @RequestMapping(value="/notice/insert", method=RequestMethod.POST)
      public ModelAndView noticeInsert(NoticeDto notice,Model model, HttpServletRequest request) {
         noticeService.insert(notice);
         
         ModelAndView mav = new ModelAndView();
         mav.addObject("url", "/admin/notice/list");
         mav.addObject("msg", "글 등록 성공");
         mav.setViewName("/message");
         return mav;
      }
      
      //게시글 업데이트
      @RequestMapping(value="/notice/update", method= RequestMethod.POST)
      public String noticeUpdate(Model model,NoticeDto notice, HttpServletRequest request) {
         noticeService.update(notice);
         
         model.addAttribute("msg", "수정 성공");
         model.addAttribute("url", "/notice/detail?noticeId="+notice.getNoticeId());
         return "/message";

      }
      
      //게시글 삭제
      @RequestMapping(value="/notice/del", method=RequestMethod.GET)
      public String noticeDelete(HttpServletRequest request, Model model,@RequestParam int noticeId) {
         noticeService.delete(noticeId);
         
         model.addAttribute("url", "/notice/list");
         model.addAttribute("msg", "삭제 성공");
         return "/message";
      }
   
   
}