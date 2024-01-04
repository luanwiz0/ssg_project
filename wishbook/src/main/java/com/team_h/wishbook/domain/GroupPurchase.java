package com.team_h.wishbook.domain;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GroupPurchase {
	private int groupId; // PK
	
	//book
	private int bookId; // 해당하는 책 id
	private String title;
	private String author;
	private int bookPrice;
	private String imageUrl;
	
	private int maxCustomNum; // 최대 인원
	private int minCustomNum; // 최소 인원
	private int customerNum; // 현재 인원
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline;
	private int discountRate;
	private int price; // 가격
	private String status;
	private int apply;
}