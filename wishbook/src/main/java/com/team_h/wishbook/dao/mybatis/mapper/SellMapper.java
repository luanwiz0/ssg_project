package com.team_h.wishbook.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team_h.wishbook.domain.CartItem;
import com.team_h.wishbook.domain.Grade;
import com.team_h.wishbook.domain.Order;

@Mapper
public interface SellMapper {
	// 장바구니 목록 조회
	List<CartItem> getCartItemList(String memberId);
	
	// 장바구니 1개 상품 정보 가져오기
	CartItem getCartItem(int cartItemId);
	
	// 장바구니 상품 추가
	void addCartItems(CartItem cartItem);
			
	// 장바구니 상품 개수 수정
	void updateCartItemQuantity(int cartItemId, int quantity, int price);
			
	// 장바구니 상품 삭제
	void deleteCartItems(int cartItemId);
		
	// 주문 진행
	void addOrder(Order order);
	
	// 포인트 적립
		void plusPoint(int point, String userId);

		// 포인트 차감
		void minusPoint(int point, String userId);

		// 누적 구매액 증가
		void plusPurchaseAmount(int purchaseAmount, String userId);

		// 등급 변동
		void changeUserGrade(int gradeId, String userId);
		
	// 등급 정보 확인
	Grade getGradeInfo(int gradeId);
		
	// 사용자 주문목록 확인
	List<Order> getUserOrderList(String memberId);
		
	// (관리자용) 전체 주문목록 확인
	List<Order> getAllOrderList();
	
	// (사용자)항목 별 주문 목록 확인
	List<Order> getUserOrderListByKind(String kind, String userId);
}