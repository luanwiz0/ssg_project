package com.team_h.wishbook.controller;

import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.Order;
import com.team_h.wishbook.domain.UsedBook;
import com.team_h.wishbook.service.SellService;
import com.team_h.wishbook.service.UsedBookService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller 
@RequestMapping("/usedBook") // /usedBook url 다 여기로 들어옴 
public class UsedBookController {    //중고책 관련 컨트롤러
	
	@Autowired
	private UsedBookService usedBookService;
	
	@Autowired
	private SellService sellService;
	
	//중고책 add하는 페이지로 이동 (GET) //GET 메소드는 데이터를 변경하지 않는 경우 (select)
	@GetMapping("/add")
	public String uploadUsedBook() {
		  return "/usedBook/addForm"; 
	}
	
	//add할 때 책 정보 가져오기
	@PostMapping("/add")
	public ModelAndView uploadBookUsedBook(int bookId) {
		System.out.println(bookId);
		Book book = usedBookService.getBookById(bookId);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/addForm");
		mav.addObject("book", book);
					
		return mav;
	}
			
	//중고책 add하기 (POST) //POST 메소드는 데이터가 변경될 경우 (insert, delete, update)
	@PostMapping("/add.do") // addForm에서 사용자가 submit버튼을 눌러서 데이터가 보내졌을때
	public String uploadUsedBook(HttpServletRequest request, UsedBook usedBook){
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		usedBook.setUserId(userId);
		usedBookService.addUsedBook(usedBook);
	
		return "redirect:/usedBook/list";
	}
		
	//공동구매 등록 시 책 정보 선택
	@PostMapping("/search")
	public ModelAndView uploadBookToUsedBook(String title) {
		//title검색해서 bookList 출력
		List<Book> bookList = usedBookService.searchBookByTitle(title);
					
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/searchBook");
		mav.addObject("bookList", bookList);
		mav.addObject("title", title);
				
		return mav;
	}
		
	//책 수정
	@GetMapping("/update/{usedBookId}")
	public String updateUsedBook(@PathVariable int usedBookId, Model m){
		UsedBook usedBook = usedBookService.getUsedBookInfo(usedBookId);
		m.addAttribute("usedBook",usedBook);
		//return "redirect:/usedBook/update.do";
		//System.out.println(usedBook.getBookStatus());
	return "/usedBook/updateForm";
	}
	
	@PostMapping("/update.do")
	public String updateBook(@RequestParam int usedBookId, UsedBook b) {
		//기존 정보 업데이트
		usedBookService.updateUsedBook(b);
		
		/*
		 * ModelAndView mav = new ModelAndView(); mav.addObject("usedBook",b);
		 * System.out.println(b.getBookStatus());
		 */
		
		return "redirect:/usedBook/list";	
	}
		
	//중고책 delete 하기
	@RequestMapping("/delete/{usedBookId}")
	public String deleteUsedBook(@PathVariable int usedBookId) {
		System.out.print("딜리트 컨트롤러 들어옴");
		//user가 자신이 등록한 중고거래 물품을 삭제한다.
		usedBookService.deleteUsedBook(usedBookId);
		// 이후 목록 페이지로 redirection
		return "redirect:/usedBook/list";
	}
		
	//title로 중고책 찾기 
	@RequestMapping("/searchName")
	public ModelAndView SearchUsedBookName(@RequestParam String title) {
		//usedBook 리스트에, 서비스에서 title로 검색한 데이터를 넣어준다.
		List<UsedBook> usedBookList = usedBookService.searchUsedBookName(title);
		
		//modelAndView 객체를 만들어서 이름을 설정한다.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/search");
		
		mav.addObject("usedBookList", usedBookList);
		return mav;
	}
	
	//userId로 중고책 가져오기 (자신이 등록한 중고책 목록)
	@RequestMapping("/userUsedBookList")
	public ModelAndView getUsedBookByUserId(HttpServletRequest request) {
			
		HttpSession session = request.getSession();  //세션연결 
		String userId = ((String) session.getAttribute("userId")); //세션에서 현재 session에 등록된 ID 얻음
			
		//usedBook 리스트에, 서비스에서 userId로 검색한 데이터를 넣어준다.
		List<UsedBook> usedBookList = usedBookService.getUsedBookByUserId(userId);
					
		//modelAndView 객체를 만들어서 이름을 설정한다.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/userUsedBookList");
					
		//if(usedBook != null)
		mav.addObject("usedBookList", usedBookList);
		return mav;
	}
		
	//모든 중고책 리스트 가져오기
	@RequestMapping("/list")
	public ModelAndView getUsedBookList() {
		//usedBook 리스트를 전체 다 가져온다.
		System.out.println("getUsedBookList 컨트롤러 들어옴");
		
		List<UsedBook> usedBookList = usedBookService.getUsedBookList();
		
		
		//modelAndView 객체를 만들어서 이름을 설정한다.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/usedBookList");
		
		//if(usedBook != null)
		mav.addObject("usedBookList", usedBookList);
		//mav.addObject("bookList", bookList);
		return mav;
	}
	
	//bookId로 검색해서 상세정보 가져오기
	@RequestMapping("/info/{usedBookId}")
	//@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView getUsedBookInfo(@PathVariable int usedBookId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/usedBookInfo");
		
		//중고거래 상품의 상세페이지를 보여준다. 
		UsedBook usedBook = usedBookService.getUsedBookInfo(usedBookId);
		Book book = usedBookService.getBookById(usedBook.getBookId());
		
		//info페이지를 요청할 때 현재 session의 아이디를 불러와서, 비교 후 같으면 1, 다르면 0을 반환한다. 
		HttpSession session = request.getSession();  //세션연결 
		String userId = ((String) session.getAttribute("userId"));
		
		//System.out.println("bookID"+book.getBookId());
		
		mav.addObject("usedBook", usedBook);    //중고책 하나
		mav.addObject("book", book);
		
		if(userId.equals(usedBook.getUserId())) { //저장된 값이랑 현재 userId랑 같으면 (판매자랑 현재 창 연 사람이랑 같다)
			mav.addObject("bool",1);
		}
	    else {
			mav.addObject("bool",0);  //다르면 
		}
		
		return mav;
	}
	
	//userInfo 화면에서 내 중고책 구매내역 볼 수 있는거
	@RequestMapping("/orderList")
	public ModelAndView getOrderList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
				
		//List<Order> orderList = sellService.getUserOrderListByKind("중고책",userId);
		List<UsedBook> usedBookPrice = usedBookService.getUserUsedBookOrderDiscountPrice(userId);
		
		//System.out.println(usedBookPrice.get(0).getImageUrl());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/usedBook/usedBookOrderList");
		//mav.addObject("userUsedBookList", orderList);
		
		mav.addObject("usedBookList", usedBookPrice);
		
		return mav;
		
	}

}
