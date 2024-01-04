package com.team_h.wishbook.domain;

import lombok.Data;
@Data
public class Book {
	private int bookId;
	private String title;
	private String author;
	private String publisher;
	private int price;
	private String category;
	private String description;
	private String imageUrl; // 사진 파일 경로 값 저장
	
	public Book() {}
	
	public Book(int bookId, String title, String author, String publisher, int price, String category,
			String description, String imageUrl) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.category = category;
		this.description = description;
		this.imageUrl = imageUrl;
	}
	
	
}