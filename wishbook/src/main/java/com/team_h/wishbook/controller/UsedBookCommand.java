package com.team_h.wishbook.controller;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UsedBookCommand {
	
	private String title;
	private String author;
	private String publisher;
	private String imageUrl;
	private String bookStatus; // 책의 상태: 상 중 하
	
	//private String sellerId; // 판매자 id
	private int price;
	//private int tradeCount; // 판매자의 중고거래 판매 횟수
	
	private String sellStatus; // 판매 상태: 진행중/거래 완료
	//private String userId; // 구매자 id
}
