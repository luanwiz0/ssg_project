package com.team_h.wishbook.domain;

import java.io.Serializable;


import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class UsedBook implements Serializable{
	
	private Book book; // UsedBook들이 하나의 Book 공유 
	private Account account; //UsedBook들이 userId 가져와야함
	
	private int bookId; //가져오려는 책 id
	private int usedBookId;
	private int discountPrice;
	private String bookStatus;
	private String userId;
	private String sellStatus;
	private String title;
	private String author;
	private String publisher;
	private int price;
	private String category;
	private String imageUrl;
	private int quantity;
	
	public UsedBook() {}

	public UsedBook(int bookId, int usedBookId, int discountPrice, String bookStatus, String userId, String sellStatus,
			String title, String author, String publisher, int price, String category) {
		super();
		this.bookId = bookId;
		this.usedBookId = usedBookId;
		this.discountPrice = discountPrice;
		this.bookStatus = bookStatus;
		this.userId = userId;
		this.sellStatus = sellStatus;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.category = category;
	}

	public UsedBook(Book book, Account account, int bookId, int usedBookId, int discountPrice, String bookStatus,
			String userId, String sellStatus, String title, String author, String publisher, int price, String category,
			String imageUrl, int quantity) {
		super();
		this.book = book;
		this.account = account;
		this.bookId = bookId;
		this.usedBookId = usedBookId;
		this.discountPrice = discountPrice;
		this.bookStatus = bookStatus;
		this.userId = userId;
		this.sellStatus = sellStatus;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.category = category;
		this.imageUrl = imageUrl;
		this.quantity = quantity;
	}

	
	
	}
	
	
	

