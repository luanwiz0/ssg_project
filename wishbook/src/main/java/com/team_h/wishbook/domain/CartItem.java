package com.team_h.wishbook.domain;

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
	private int price;
	private String imageUrl; // 사진
	private String userId;
	private String kind;
	private int groupId;

}