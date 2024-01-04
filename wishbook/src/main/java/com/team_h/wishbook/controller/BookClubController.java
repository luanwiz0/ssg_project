package com.team_h.wishbook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.BookClub;
import com.team_h.wishbook.service.BookClubService;
import com.team_h.wishbook.service.BookService;

@Controller
@RequestMapping("/bookClub")
public class BookClubController {
	
	@Autowired
	private BookClubService bookClubService;
	@Autowired
	private BookService bookService;
	
	// 목록 확인
	@RequestMapping("/list")
	public ModelAndView getBookClubList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", bookClubService.getBookClubList());
		mav.setViewName("/bookClub/bookClubList");
		return mav;
	}
	
	// 추가 폼
	@GetMapping("/add")
	public ModelAndView bookClubForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookClubInfo", new BookClubInfo());
		mav.setViewName("/bookClub/addForm");
		
		return mav;
	}
	
	// 책 정보 선택
	@RequestMapping("/bookSearch")
	public ModelAndView searchBook(@RequestParam String title) {
		//title검색해서 bookList 출력
		List<Book> bookList = bookService.searchBookByTitle(title);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bookClub/searchBook");
		mav.addObject("bookList", bookList);
		mav.addObject("title", title);
		
		return mav;
	}
	
	// 책 정보 삽입
	@RequestMapping("/addBook")
	public ModelAndView addBook(@RequestParam int bookId) {
		ModelAndView mav = new ModelAndView();
		
		BookClubInfo bookClubInfo = new BookClubInfo();
		bookClubInfo.setBookId(bookId);
		String title = bookService.getBookInfo(bookId).getTitle();
		
		mav.addObject("bookClubInfo", bookClubInfo);
		mav.addObject("title", title);
		mav.setViewName("/bookClub/addForm");
		return mav;
	}
	
	
	// 추가
	@PostMapping("/add")
	public String addBookClub(HttpServletRequest request, @ModelAttribute("bookClubInfo") BookClubInfo bookClubInfo) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");

		bookClubService.addBookClub(bookClubInfo, userId);
		
		return "redirect:/bookClub/list";
	}

	// 수정 폼
	@GetMapping("/update")
	public ModelAndView updateForm(@RequestParam int clubId) {
		ModelAndView mav = new ModelAndView();
		
		BookClubInfo bookClubInfo = new BookClubInfo();
		BookClub bookClub = bookClubService.getBookClub(clubId);
		
		bookClubInfo.setClubId(bookClub.getClubId());
		bookClubInfo.setClubName(bookClub.getClubName());
		bookClubInfo.setDescription(bookClub.getDescription());
		bookClubInfo.setMaxNum(bookClub.getMaxNum());
		bookClubInfo.setDay(bookClub.getDay());
		bookClubInfo.setDayVal(bookClubInfo.getDayStr()[bookClub.getDay()]);
		bookClubInfo.setStartTime(bookClub.getStartTime());
		bookClubInfo.setHour(bookClub.getHour());
		bookClubInfo.setAddress(bookClub.getAddress());
		bookClubInfo.setBookId(bookClub.getBookId());
		
		mav.addObject("bookClubInfo", bookClubInfo);
		mav.setViewName("bookClub/updateForm");
		
		return mav;
	}
	
	// 수정
	@PostMapping("/update")
	public String updateBookClub(@ModelAttribute BookClubInfo bookClubInfo) {
		bookClubService.updateBookClub(bookClubInfo);
		return "redirect:/bookClub/list";
	}
	
	// 삭제
	@RequestMapping("/delete")
	public String deleteBookClub(@RequestParam("clubId") int bookClubId) {
		bookClubService.deleteBookClub(bookClubId);
		
		return "redirect:/bookClub/list";
	}
	
	
	// 신청
	@RequestMapping("/register")
	public String registerBookClub(HttpServletRequest request, @RequestParam("clubId") int bookClubId) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");
	    
	    List<Account> userList = bookClubService.getUserList(bookClubId);
	    for(Account user : userList) {
	    	if(user.getUserId().equals(userId))
	    		return "redirect:/bookClub/existUser";
	    }

		bookClubService.registerBookClub(bookClubId, userId);
		
		return "redirect:/bookClub/list";
	}
	
	// 중복 신청 시 오류 페이지로 이동
	@RequestMapping("/existUser")
	public ModelAndView existUserError() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bookClub/existUser");
		return mav;
	}
	
	// 취소
	@RequestMapping("/cancel")
	public String cancelBookClub(HttpServletRequest request, @RequestParam("clubId") int bookClubId) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");

		bookClubService.cancelBookClub(bookClubId, userId);
		return "redirect:/bookClub/list";
	}
	
	// 회원 목록 확인
	@RequestMapping("/userList")
	public ModelAndView getBookClubUserList(@RequestParam("clubId") int bookClubId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userList", bookClubService.getUserList(bookClubId));
		mav.setViewName("/bookClub/bookClubUserList");
		return mav;
	}
	
	
}