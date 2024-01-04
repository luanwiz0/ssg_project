package com.team_h.wishbook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.dao.DataAccessException;

import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.Review;

public interface BookDao {
	//전체 목록 조회
	List<Book> getBookList() throws DataAccessException;
	
	int countBookList() throws DataAccessException;
	
	//상품 상세 정보 확인, 책 별 리뷰리스트
	Book getBookInfo(int bookId) throws DataAccessException;
	List<Review> getReviewList(int bookId) throws DataAccessException;
	
	List<Book> getBookByCategory(String category) throws DataAccessException;
	
	List<Book> searchBookByTitle(String search) throws DataAccessException;
	
	List<Book> searchBookByAuthor(String search) throws DataAccessException;
	
	void addBook(Book b) throws DataAccessException;

	void deleteBook(int bookId) throws DataAccessException; 

	void updateBook(Book b) throws DataAccessException;
	
	//리뷰 검색
	Review getReview(int reviewId) throws DataAccessException;
	
	void addReview(Review review) throws DataAccessException;

	//리뷰 수정
	void updateReview(Review r) throws DataAccessException;
		
	//리뷰 삭제
	void deleteReview(int reviewId) throws DataAccessException;
		
	//리뷰 개수 count
	int countReviewByBookId(int bookId) throws DataAccessException;
	
}