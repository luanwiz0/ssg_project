package com.team_h.wishbook.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_h.wishbook.dao.BookDao;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.Review;


@Service
public class BookService {
	@Autowired
	BookDao dao;

	//전체 목록 조회
	public List<Book> getBookList() {
		return dao.getBookList();
	}
	
	//책의 수 가져오기
	public int countBookList() {
		return dao.countBookList();
	}

	//상품 상세 정보 확인
	public Book getBookInfo(int bookId) {
		return dao.getBookInfo(bookId);
	}
	//책 별 리뷰리스트
	public List<Review> getReviewList(int bookId) {
		return dao.getReviewList(bookId);
	}

	//카테고리별 검색
	public List<Book> getBookByCategory(String category) {
		return dao.getBookByCategory(category);
	}

	//제목 검색
	public List<Book> searchBookByTitle(String search) {
	   
	    if (search == null || search.isEmpty()) { 
	        return dao.getBookList();
	    } else {
	        return dao.searchBookByTitle(search);
	    }
	}
	
	//작가 검색
	public List<Book> searchBookByAuthor(String search) {
		   
	    if (search == null || search.isEmpty()) { 
	        return dao.getBookList();
	    } else {
	        return dao.searchBookByAuthor(search);
	    }
	}

	//책 등록
	public void addBook(Book b) {
		dao.addBook(b);
	}

	//책 삭제
	public void deleteBook(int bookId) {
		dao.deleteBook(bookId);
	}
	
	//책 수정
	public void updateBook(Book b) {
		dao.updateBook(b);
	}	

	/*
	 * //책 번호로 제목 가져오기 public String getBookTitleByBookId(int bookId) { return
	 * dao.getBookTitleByBookId(bookId); }
	 */
	//리뷰 검색
	public Review getReview(int reviewId) {
		return dao.getReview(reviewId);
	};
	//리뷰 추가
	public void addReview(Review review) {
		dao.addReview(review);
	}

	//리뷰 수정
	public void updateReview(Review r) {
		dao.updateReview(r);
	};
	
	//리뷰 삭제
	public void deleteReview(int reviewId) {
		dao.deleteReview(reviewId);
	};
	
	//리뷰 개수 count
	public int countReviewByBookId(int bookId) {
		return dao.countReviewByBookId(bookId);
	}
	


}