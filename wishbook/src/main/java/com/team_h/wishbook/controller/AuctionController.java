package com.team_h.wishbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.team_h.wishbook.domain.Auction;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.service.AuctionService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AuctionController {

	

	@Autowired
	private AuctionService auctionService;

	
	 //경매 목록 확인
    @RequestMapping("/auction/list")
	public ModelAndView getList(HttpServletRequest request) {
	   
    	//adminCheck
    	HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userId");
    	
		List<Auction> list = auctionService.getAuctionList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/auction/auctionList");
		mav.addObject("list", list);
		mav.addObject("userid", user);
		return mav;
	}
	
    
    //경매별 상세 정보 확인
  	@RequestMapping("/auction/info/{auctionId}")
  	public ModelAndView getAuction(@PathVariable int auctionId, HttpServletRequest request) {
  		ModelAndView mav = new ModelAndView();
  		int islogin = 0;
  		Auction a = new Auction();
  		a = auctionService.getAuctionInfo(auctionId);
  		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userId");
		if(user != null) {
			islogin = 1;
		}
  		
  		mav.addObject("auction", a);
  		mav.addObject("userid", user);
  		mav.addObject("islogin", islogin);
  		if(a.getStatus() == 2) { //경매 마감
  			mav.setViewName("/auction/finishAuctionBid");
  			return mav;
  		}else { // 경매 미입찰이거나 진행중
  			mav.setViewName("/auction/auctionInfo");
  			return mav;
  		}
  	
  		
  		

  	}
	
  	
  	
  	
	/* 경매 등록 */
  	@GetMapping("/auction/add")
	public String addAuctionForm(@ModelAttribute("auction") Auction auction) {
		return "/auction/add"; 
	}
	
	
	//경매 등록 시 책 정보 선택
		@RequestMapping("/auction/bookSearch")
		public ModelAndView searchBookinAuction(String title) {
			//title검색해서 bookList 출력
			
			List<Book> bookList = auctionService.getBookInfoByTitle(title);
				
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/auction/searchBook");
			mav.addObject("bookList", bookList);
			mav.addObject("title", title);
			
			return mav;
		}
	//책 정보 가져오기
	@RequestMapping("/auction/add/{bookId}")
	public ModelAndView addBookAuction(int bookId) {
		Book book = auctionService.getBookById(bookId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/auction/add");
		mav.addObject("book", book);
			
		return mav;
	}
		
	@PostMapping("/auction/add")
	public String addAuction(Auction auction){
		auctionService.addAuction(auction);
		System.out.println(auction.getStartPrice());
		return "redirect:/auction/list";
	}
	
	
	
	
	/* 경매 삭제 */
	@RequestMapping("/auction/delete/{auctionId}")
	public String deleteAuction(@PathVariable int auctionId, Model m) {
		auctionService.deleteAuction(auctionId);
		return "redirect:/auction/list";
	}
	
	
	/* 경매 마감기한 수정 */
	@GetMapping("/auction/update/{auctionId}")
	public String updateAuctionForm(@PathVariable int auctionId,Model m){
		//System.out.println("controller 들어옴");
		Auction a = auctionService.getAuctionInfo(auctionId);
		m.addAttribute("auction",a);
		return "/auction/update";
	}
	
	@PostMapping("/auction/update/{auctionId}")
	public String updateAuction(Auction auction) {
		//기존 정보 업데이트
		auctionService.updateAuction(auction);
		return "redirect:/auction/list";
		
	}
	

}
