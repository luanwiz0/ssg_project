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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.CartItem;
import com.team_h.wishbook.domain.Order;
import com.team_h.wishbook.service.AccountService;
import com.team_h.wishbook.service.GroupPurchaseService;
import com.team_h.wishbook.service.SellService;

@Controller
// @SessionAttributes("memberId")  // 세션에 저장된 사용자 아이디 정보
@SessionAttributes("orderInfo")
public class SellController {
	
	 @Autowired
	 private SellService sellService;
	 @Autowired
	 private AccountService accountService;
	 @Autowired
	 private GroupPurchaseService groupPurchaseService;
	
	// --------------------------  장바구니  -------------------------------------
	
	// 장바구니 정보 불러오기
	@RequestMapping("/cart/list")
	public ModelAndView getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");
		
		ModelAndView mav = new ModelAndView();
		List<CartItem> itemList = sellService.getCartItemList(userId);
		mav.addObject("itemList", itemList);
		
		// cart 관련 view 페이지들을 폴더에 넣어서 관리할 경우
		mav.setViewName("/payment/cart");
		
		return mav;
	}
	
	// 장바구니 물품 추가(상품 상세정보 페이지에서 장바구니에 담기 버튼 클릭)
	@RequestMapping("/cart/add")
	 public String addCartItems(HttpServletRequest request, @RequestParam("bookId") int itemId, @RequestParam("quantity") int quantity, 
	            @RequestParam("price") int price, @RequestParam ("kind") String kind, @RequestParam ("groupId") int groupId) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");
	    System.out.print(userId+ itemId+ quantity+ price+ kind+ groupId);
	    sellService.addCartItems(userId, itemId, quantity, price, kind, groupId);
	    
	    return "redirect:/cart/list";
	}
	
	
	// 장바구니 상품 정보 수정
	@RequestMapping("/cart/update")
	public String updateCartItems(@RequestParam("cartItemId") int cartItemId, @RequestParam("quantity") int quantity) {
		System.out.println("calling update");
		// 들어온 정보를 토대로 정보 수정 - 서비스 레이어에 정보 넘겨줌
		sellService.updateCartItems(cartItemId, quantity);
		
		// 이후 목록 페이지로 redirection
		return "redirect:/cart/list";
	}
	
	// 장바구니 상품 삭제
	@RequestMapping("/cart/delete")
	public String deleteCartItems(@RequestParam("cartItemId") int cartItemId) {
		
		sellService.deleteCartItems(cartItemId);
		
		return "redirect:/cart/list";
	}
	
	// ---------------------------------  주문  --------------------------------
	
	
	// 결제 폼 초기화
	@ModelAttribute("orderInfo")
	public OrderInfo formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) { // GET request일 경우
			OrderInfo orderInfo = new OrderInfo(); // command 객체 생성
			orderInfo.setCardType("동덕카드"); // 카드사 기본값
			
			return orderInfo;
		}
		else {
			return new OrderInfo();
		}
	}
	
	// 결제 페이지로 이동
	@GetMapping("/order/payment")
	public String payment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
	    OrderInfo orderInfo = (OrderInfo) session.getAttribute("orderInfo");
	    orderInfo.setItemList(sellService.getCartItemList(userId));
	    
	    Account userInfo = accountService.getUserInfo(userId); // 사용자 정보
		orderInfo.setUserTel(userInfo.getPhone());
		orderInfo.setAddress(userInfo.getAddress());
		orderInfo.setPoint(userInfo.getPoint());
	    
	    session.setAttribute("orderInfo", orderInfo);
		return "/payment/payment";
	}
	
	
	// 결제 진행
	@PostMapping("/order/add")
	public String addOrder(HttpServletRequest request, @ModelAttribute("orderInfo") OrderInfo orderInfo) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");
	    
	    for(CartItem item : orderInfo.getItemList()) {
	    	if(item.getGroupId() != 0) {
	    		groupPurchaseService.registerGroupPurchase(userId, item.getGroupId());
	    		groupPurchaseService.plusCustomerNum(item.getGroupId());
	    	}
	    }
	    
		// 하나씩 돌면서 결제목록에 추가하기
		sellService.addOrder(orderInfo, userId);
		
		// return "/main.jsp";
		return "redirect:/order/list";
	}
	
	// ------------------- 주문 확인 -----------------------------
	
	// 결제목록 확인
	@RequestMapping("/order/list")
	public ModelAndView getUserOrderList(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    String userId = (String)session.getAttribute("userId");
		
		ModelAndView mav = new ModelAndView();
		// 서비스 클래스로 넘겨줄 때 세션에 있는 아이디 정보 넘겨주기
		List<Order> orderList = sellService.getUserOrderList(userId);
				
		// 리스트로 가져온 목록을 mav 객체에 넣기
		mav.addObject("orderList", orderList);
		mav.setViewName("/payment/userOrderList");
		
		return mav;
	}
	
	// 전체 회원 결제목록 확인
	@RequestMapping("/order/allList")
	public ModelAndView getAllOrderList() {
		ModelAndView mav = new ModelAndView();
	
		List<Order> orderList = sellService.getAllOrderList();
		mav.addObject("orderList", orderList);
		mav.setViewName("전체 회원 결제목록 뷰 이름");
		
		return mav;
	}

}