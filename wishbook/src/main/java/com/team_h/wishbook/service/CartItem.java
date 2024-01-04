package com.team_h.wishbook.service;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CartItem implements Serializable{
	private static final long serialVersionUID = 1L;		
	
	private int cartId;
	private int bookId;
	private String title;
	private int quantity; 
	private int totalPrice;
	private String imageUrl; // 사진
	private String userId;
	
	// 테스트용 임시 생성자
	public CartItem() {
		
	}
	
	public CartItem(int bookId, int quantity, String userId) {
		super();
		this.bookId = bookId;
		this.quantity = quantity;
		this.userId = userId;
	}
	
	public CartItem(int cartId, int bookId, String title, int quantity, int totalPrice, String imageUrl) {
		super();
		this.cartId = cartId;
		this.bookId = bookId;
		this.title = title;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "CartItem [cartId=" + cartId + ", bookId=" + bookId + ", title=" + title + ", quantity=" + quantity
				+ ", price=" + totalPrice + ", imageUrl=" + imageUrl + ", userId=" + userId + "]";
	}
}
