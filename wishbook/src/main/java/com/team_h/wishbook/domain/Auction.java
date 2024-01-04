package com.team_h.wishbook.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Auction {
	private int auctionId;
	private String title; // 제목
	private int bookId; // 경매할 책
	private String author; //작가
	private String publisher; //출판사
	private String imageUrl; //이미지
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadLine; // 경매 마감기한
	private String userId; // 입찰자 아이디
	private int status; // 거래 상태: 0: 경매 시작(미입찰)/1: 경매 입찰/2: 경매 마감
	private int startPrice; // 시작가
	private int currPrice; // 현재가
	private int finalPrice; // 마감가(최종 낙찰 금액)
	

	
	
}
