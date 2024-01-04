package com.team_h.wishbook.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_h.wishbook.domain.Auction;
import com.team_h.wishbook.service.AuctionService;
import com.team_h.wishbook.service.SellService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AuctionBidController {

	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private SellService sellService;

	// 경매 입찰 페이지
	@GetMapping("/auction/apply/{auctionId}")
	public String applyAuctionBidForm(@PathVariable int auctionId, Model m) {
		Auction a = auctionService.getAuctionInfo(auctionId);
		m.addAttribute("auction", a);
		return "/auction/applyAuctionBid";
	}

	@PostMapping("/auction/apply/{auctionId}")
	public String applyAuctionBid(HttpServletRequest request, Auction a) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		a.setUserId(userId);
		auctionService.applyAuctionBid(a);

		return "redirect:/auction/completeAuctionBid/{auctionId}";
	}
	
	//경매 입찰 - 확인 페이지
	@GetMapping("/auction/completeAuctionBid/{auctionId}")
	public String completeAuctionBidConfirm(@PathVariable int auctionId, Model m) {
		Auction a = auctionService.getAuctionInfo(auctionId); 

	
		
		m.addAttribute("auction", a);
		return "/auction/completeAuctionBid";
	}
	@PostMapping("/auction/completeAuctionBid/{auctionId}")
	public String completeAuctionBid(@PathVariable int auctionId, Model m) {
		Auction a = auctionService.getAuctionInfo(auctionId); 
		m.addAttribute("auction", a);
		return "redirect:/auction/info/{auctionId}";
	}
	
	
	// 경매 입찰 마감
	@RequestMapping("/auction/finishAuctioBid/{auctionId}")
  	public ModelAndView finishAuction(@PathVariable int auctionId) {
  		ModelAndView mav = new ModelAndView();
  		
  		mav.setViewName("/auction/finishAuctionBid");
  
  		Auction a = auctionService.getAuctionInfo(auctionId);
   		auctionService.updateAuctionStatus(a.getCurrPrice(),auctionId);
   		if(a.getUserId()!=null) {
 
  		sellService.addCartItems(a.getUserId(), a.getBookId(), 1, a.getFinalPrice(),"경매도서",0);

		//사용자 이름 가리기
		String userId = a.getUserId();
		char[] userIdArr = userId.toCharArray(); //문자열->문자열 배열
		String hiddenUserId = "";
		int i = 0;
		for(char u:userIdArr) {
			if(i == 0 || i ==userIdArr.length-2 || i == userIdArr.length-1) {
				hiddenUserId = hiddenUserId + userIdArr[i]; 
			}
		}
		
		
		
		System.out.println(hiddenUserId);
  		mav.addObject("hiddenUserId",hiddenUserId);
  		
  		
  		mav.addObject("auction", a);
   		}
  		
  		return mav;
  	}
	
	 

}
