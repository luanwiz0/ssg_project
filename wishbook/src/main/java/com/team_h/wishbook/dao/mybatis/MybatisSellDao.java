package com.team_h.wishbook.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team_h.wishbook.dao.SellDao;
import com.team_h.wishbook.dao.mybatis.mapper.SellMapper;
import com.team_h.wishbook.domain.CartItem;
import com.team_h.wishbook.domain.Grade;
import com.team_h.wishbook.domain.Order;

@Repository
public class MybatisSellDao implements SellDao{
	@Autowired
	private SellMapper sellMapper;

	@Override
	public List<CartItem> getCartItemList(String memberId) {
		return sellMapper.getCartItemList(memberId);
	}
	
	@Override
	public CartItem getCartItem(int cartItemId) {
		return sellMapper.getCartItem(cartItemId);
	}

	@Override
	public void addCartItems(CartItem cartItem) {
		sellMapper.addCartItems(cartItem);
	}

	@Override
	public void updateCartItemQuantity(int cartItemId, int quantity, int price) {
		sellMapper.updateCartItemQuantity(cartItemId, quantity, price);
	}

	@Override
	public void deleteCartItems(int cartItemId) {
		sellMapper.deleteCartItems(cartItemId);
	}

	@Override
	public void addOrder(Order order) {
		sellMapper.addOrder(order);
	}
	
	@Override
	public void plusPoint(int point, String userId) {
		sellMapper.plusPoint(point, userId);
	}

	@Override
	public void minusPoint(int point, String userId) {
		sellMapper.minusPoint(point, userId);
	}

	@Override
	public void plusPurchaseAmount(int purchaseAmount, String userId) {
		sellMapper.plusPurchaseAmount(purchaseAmount, userId);
	}

	@Override
	public void changeUserGrade(int gradeId, String userId) {
		sellMapper.changeUserGrade(gradeId, userId);
	}
	
	@Override
	public Grade getGradeInfo(int gradeId) {
		return sellMapper.getGradeInfo(gradeId);
	}

	@Override
	public List<Order> getUserOrderList(String memberId) {
		return sellMapper.getUserOrderList(memberId);
	}

	@Override
	public List<Order> getAllOrderList() {
		return sellMapper.getAllOrderList();
	}

	@Override
	public List<Order> getUserOrderListByKind(String kind, String userId){
		return sellMapper.getUserOrderListByKind(kind, userId);
	};

	

	
	
	

}