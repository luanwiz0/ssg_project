package com.team_h.wishbook.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.GroupPurchase;
import com.team_h.wishbook.service.GroupPurchaseService;
import com.team_h.wishbook.service.SellService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/groupPurchase")
public class GroupPurchaseController {
	@Autowired
	private GroupPurchaseService groupPurchaseService;
	@Autowired
	private SellService sellService;
	
	//공동구매 리스트
	@RequestMapping("/list")
	public ModelAndView getGroupPurchaseList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		List<GroupPurchase> groupPurchaseList = groupPurchaseService.getGroupPurchaseList();
		
		//status 설정
		groupPurchaseService.setStatusGroupPurchase(groupPurchaseList); 
		groupPurchaseList = groupPurchaseService.getGroupPurchaseList();
		
		//price 설정
		groupPurchaseList = groupPurchaseService.setPriceGroupPurchase(groupPurchaseList); 
		
		List<GroupPurchase> end_groupPurchaseList = new ArrayList<>();  // 기간지난 공동구매
		List<GroupPurchase> ongoing_groupPurchaseList = new ArrayList<>();  //진행중인 공동구매
		ModelAndView mav = new ModelAndView();
		
		for(int i=0; i<groupPurchaseList.size(); i++) {
			if(groupPurchaseList.get(i).getStatus().equals("end")) {
				end_groupPurchaseList.add(groupPurchaseList.get(i));
			}
			else if(groupPurchaseList.get(i).getStatus().equals("ongoing")) {
				ongoing_groupPurchaseList.add(groupPurchaseList.get(i));
				
				//가입한 회원
				if(userId != null && !userId.equals("admin")) {
					//[신청]cart(groupId)에 groupPuchaselist(groupId)가 없으면 null이면 -> 신청버튼 1
					Integer CartId = groupPurchaseService.getCartGroupIdById(userId, groupPurchaseList.get(i).getGroupId());
					Integer GroupItemId = groupPurchaseService.getGroupItemIdById(userId, groupPurchaseList.get(i).getGroupId());
					/*if(CartGroupId == null) {
						groupPurchaseList.get(i).setApply(1);
					}
					//[취소]있고, grouporderlist에 groupid가 없으면 -> 취소 
					else if(CartGroupId != null && GroupItemId == null) {
						groupPurchaseList.get(i).setApply(0);
					}
					//[신청완료]있고, 있으면 -> 신청완료 2
					else if(CartGroupId != null && GroupItemId != null) {
						groupPurchaseList.get(i).setApply(2);
					}*/
					
					//Integer GroupItemId = groupPurchaseService.getGroupItemIdById(userId, groupPurchaseList.get(i).getGroupId());
					if(GroupItemId == null) {
						if(CartId == null) {
							groupPurchaseList.get(i).setApply(1);
						}
						else {
							groupPurchaseList.get(i).setApply(0);
							mav.addObject("cartId", CartId);
						}
					}
					else
						groupPurchaseList.get(i).setApply(2);
				}
			}
		}
				
		
		mav.setViewName("/groupPurchase/groupPurchaseList");
		mav.addObject("end_groupPurchaseList", end_groupPurchaseList);
		mav.addObject("ongoing_groupPurchaseList", ongoing_groupPurchaseList);
				
		
		return mav;
	}
	
	//공동구매 수정 페이지로 이동 (관리자)
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView GroupPurchaseinfo(@RequestParam ("groupId") int groupId, 
											@RequestParam ("price") int price) {
		GroupPurchase groupPurchase = groupPurchaseService.getGroupPurchaseById(groupId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/updateForm");
		mav.addObject("groupPurchase", groupPurchase);
		mav.addObject("discountRate", groupPurchase.getDiscountRate());
		mav.addObject("price", price);
		
		return mav;
		
	}
	
	//공동구매 수정 (관리자)
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updateGroupPurchase(GroupPurchase groupPurchase) {
		groupPurchaseService.updateGroupPurchase(groupPurchase);
		
		return "redirect:/groupPurchase/list";
	}
	
	//공동구매 삭제 (관리자)
	@RequestMapping(value = "/delete")
	public String deleteGroupPurchase(@RequestParam ("groupId") int groupId) {
		groupPurchaseService.deleteGroupPurchaseById(groupId);
		return "redirect:/groupPurchase/list";
	}
	
	//공동구매 신청한 멤버리스트 확인 (관리자)
	@RequestMapping(value = "/memberList", method = RequestMethod.POST)
	public ModelAndView getApplierList(@RequestParam ("groupId") int groupId) {
		List<Account> memberList = groupPurchaseService.getMemberListByGroupId(groupId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/memberList");
		mav.addObject("memberList", memberList);
		
		return mav;
	}//공동구매 등록 페이지로 이동 (관리자)
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String uploadGroupPurchase() {
		return "/groupPurchase/addForm";
	}
	
	//책 정보 가져오기
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView uploadBookGroupPurchase(int bookId) {
		System.out.println(bookId);
		Book book = groupPurchaseService.getBookById(bookId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/addForm");
		mav.addObject("book", book);
			
		return mav;
	}
	
	//공동구매 등록 (관리자)
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public String uploadGroupPurchase(GroupPurchase groupPurchase) {
		groupPurchaseService.addGroupPurchase(groupPurchase);
		
		return "redirect:/groupPurchase/list";
	}
	
	//공동구매 등록 시 책 정보 선택
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView uploadGroupPurchase(String title) {
		//title검색해서 bookList 출력
		List<Book> bookList = groupPurchaseService.searchBookByTitle(title);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/searchBook");
		mav.addObject("bookList", bookList);
		mav.addObject("title", title);
		
		return mav;
	}
	
	//할인율 설정
	@RequestMapping(value = "/addFormDiscountRate", method = RequestMethod.POST)
	public ModelAndView addFormdiscountRate(int bookId, int discountRate) {
		Book book = groupPurchaseService.getBookById(bookId);
		int price = groupPurchaseService.getPriceBydiscountRate(discountRate, book.getPrice());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/addForm");
		mav.addObject("book", book);
		mav.addObject("price", price);
		mav.addObject("discountRate", discountRate);
			
		return mav;
	}
	
	//할인율 설정
	@RequestMapping(value = "/updateFormDiscountRate", method = RequestMethod.POST)
	public ModelAndView updateFormdiscountRate(int groupId, int discountRate) {
		GroupPurchase groupPurchase = groupPurchaseService.getGroupPurchaseById(groupId);
		int price = groupPurchaseService.getPriceBydiscountRate(discountRate, groupPurchase.getBookPrice());
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/updateForm");
		mav.addObject("groupPurchase", groupPurchase);
		mav.addObject("discountRate", discountRate);
		mav.addObject("price", price);
				
		return mav;
	}
	
	//사용자가 자신의 공동구매 목록 확인
	@RequestMapping("/userGroupPurchaseList")
	public ModelAndView userGroupPurchaseList (HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		List<GroupPurchase> userOrderList = new ArrayList<>(); 
		List<Integer> groupIdList = groupPurchaseService.getGroupItemIdByUserId(userId);
		for(int i = 0; i < groupIdList.size(); i++) {
			userOrderList.add(groupPurchaseService.getGroupPurchaseById(groupIdList.get(i)));
		}
		
		//price 설정
		userOrderList = groupPurchaseService.setPriceGroupPurchase(userOrderList); 
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/groupPurchase/groupOrderList");
		mav.addObject("userOrderList", userOrderList);
		
		return mav;
	}
	
	//--------------------------------------
	//사용자가 공동구매 신청
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String applyGroupPurchase(HttpServletRequest request, @RequestParam ("groupId") int groupId) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		groupPurchaseService.registerGroupPurchase(userId, groupId);
		groupPurchaseService.plusCustomerNum(groupId);
		
		return "redirect:/groupPurchase/userGroupPurchaseList";
	}
	
	//사용자가 공동구매 취소
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String cancelGroupPurchase(HttpServletRequest request, @RequestParam ("groupId") int groupId) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		groupPurchaseService.cancelGroupPurchase(userId, groupId);
		groupPurchaseService.minusCustomerNum(groupId);
		
		return "redirect:/groupPurchase/userGroupPurchaseList";
	}
	
	@RequestMapping(value = "/list_cancel", method = RequestMethod.POST)
	public String list_cancelGroupPurchase(HttpServletRequest request, @RequestParam ("groupId") int groupId) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		groupPurchaseService.cancelGroupPurchase(userId, groupId);
		groupPurchaseService.minusCustomerNum(groupId);
		
		return "redirect:/groupPurchase/list";
	}
	
	// 중복 신청 시 오류 페이지로 이동
		@RequestMapping("/existUser")
		public ModelAndView existUserError() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/groupPurchase/existUser");
			return mav;
		}

}