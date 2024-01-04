package com.team_h.wishbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team_h.wishbook.controller.OrderInfo;
import com.team_h.wishbook.dao.AccountDao;
import com.team_h.wishbook.dao.SellDao;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.CartItem;
import com.team_h.wishbook.domain.Grade;
import com.team_h.wishbook.domain.Order;

@Service
public class SellService {
	
//	// 시험용 임시 데이터
//		private List<CartItem> itemList = new ArrayList<>(Arrays.asList(new CartItem(1, 1, "aaa", 1, 100, "aaa"), 
//			new CartItem(2, 2, "bbb", 2, 100, "bbb"),  new CartItem(3, 3, "ccc", 3, 100, "ccc")));
//		private int nextCartId = 4;
//		private List<Order> orderList = new ArrayList<>();
//		private int nextOrderId = 1;
		
	@Autowired
	private SellDao sellDao;
	@Autowired
	private AccountDao accountDao;

	// 장바구니 목록 조회
	public List<CartItem> getCartItemList(String memberId){
		return sellDao.getCartItemList(memberId);
	}
	
	// 장바구니 상품 추가
	public void addCartItems(String userId, int itemId, int quantity, int price, String kind, int groupId) {
		CartItem cartItem = new CartItem();
		cartItem.setBookId(itemId);
		cartItem.setQuantity(quantity);
		cartItem.setPrice(price * quantity);
		cartItem.setUserId(userId);
		cartItem.setKind(kind);
		cartItem.setGroupId(groupId);

		sellDao.addCartItems(cartItem);
	}
	
	// 장바구니 상품 개수 수정
	public void updateCartItems(int cartItemId, int quantity) {
//		CartItem item = itemList.get(cartItemId);
//		item.setQuantity(quantity);
//		itemList.set(cartItemId, item);
		CartItem cartItem = sellDao.getCartItem(cartItemId);
		int price = cartItem.getPrice();
		int updatePrice = (price / cartItem.getQuantity()) * quantity; 
		sellDao.updateCartItemQuantity(cartItemId, quantity, updatePrice);
	}
	
	// 장바구니 상품 삭제
	public void deleteCartItems(int cartItemId) {
//		itemList.remove(cartItemId);
		sellDao.deleteCartItems(cartItemId);
	}
	
	// 주문 진행
	@Transactional
	public void addOrder(OrderInfo orderInfo, String userId) {
		int priceSum = 0;
		int[] cartId = new int[orderInfo.getItemList().size()];
		int i = 0;
		
		for(CartItem item : orderInfo.getItemList()) {
			Order order = new Order();
			order.setUserId(userId);
			order.setUserTel(orderInfo.getUserTel());
			order.setAddress(orderInfo.getAddress());
			order.setCardType(orderInfo.getCardType());
			order.setCardNum(orderInfo.getCardNum());
			order.setBookId(item.getBookId());
			order.setTotalPrice(item.getPrice());
			order.setQuantity(item.getQuantity());
			if(item.getKind() != null)
				order.setKind(item.getKind());
			else order.setKind(null);
			
			priceSum += item.getPrice();
			cartId[i] = item.getCartId();
			i++;
			
			//orderList.add(order);
			sellDao.addOrder(order);
		}
		
		// 포인트 적립
		Account user = accountDao.getUserInfo(userId);
		Grade grade = sellDao.getGradeInfo(user.getGradeId());
		int point = priceSum / 100 * grade.getPointRate();
		sellDao.plusPoint(point, userId);
		
		System.out.println(priceSum);
		
		// 누적 구매금액 반영
		sellDao.plusPurchaseAmount(user.getPurchaseAmount() + priceSum, userId);
		// 누적 구매금액에 따른 등급 변경
		if(grade.getGradeId() < 3) {
			Grade nextGrade = sellDao.getGradeInfo(user.getGradeId() + 1);
			if(user.getPurchaseAmount() + priceSum > nextGrade.getStandardPrice() * 10000)
				sellDao.changeUserGrade(nextGrade.getGradeId(), userId);
		}
		
		// 장바구니 삭제
		for(int id : cartId) {
			sellDao.deleteCartItems(id);
		}
	}
	
	// 주문목록 확인
	public List<Order> getUserOrderList(String memberId){
		//return orderList;
		return sellDao.getUserOrderList(memberId);
	}
	
	// (관리자용) 전체 주문목록 확인
	public List<Order> getAllOrderList(){
		return sellDao.getAllOrderList();
	}
	
	// (사용자)항목 별 주문 목록 확인
		public List<Order> getUserOrderListByKind(String kind, String userId){
			return sellDao.getUserOrderListByKind(kind, userId);	
		}
	
}