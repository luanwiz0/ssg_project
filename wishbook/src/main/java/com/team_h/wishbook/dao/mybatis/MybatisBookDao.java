package com.team_h.wishbook.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.team_h.wishbook.dao.BookDao;
import com.team_h.wishbook.dao.mybatis.mapper.BookMapper;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.Review;

@Repository
public class MybatisBookDao implements BookDao {
	
	 @Autowired 
	 private BookMapper bookMapper;
	//전체 목록 조회
	@Override
	public List<Book> getBookList() throws DataAccessException{
		return bookMapper.getBookList();
	};
	@Override
	public int countBookList() throws DataAccessException{
		return bookMapper.countBookList();
	};
	
	//상품 상세 정보 확인, 책 별 리뷰리스트
	@Override
	public Book getBookInfo(int bookId) throws DataAccessException{
		return bookMapper.getBookInfo(bookId);
	};
	@Override
	public List<Review> getReviewList(int bookId) throws DataAccessException{
		return bookMapper.getReviewList(bookId);
	};
	
	
	@Override
	public List<Book> getBookByCategory(String category) throws DataAccessException{
		return bookMapper.getBookByCategory(category);
	};
	
	@Override
	public List<Book> searchBookByTitle(String search) throws DataAccessException{
		return bookMapper.searchBookByTitle(search);
	};
	
	@Override
	public List<Book> searchBookByAuthor(String search) throws DataAccessException{
		return bookMapper.searchBookByAuthor(search);
	};
	
	@Override
	public void addBook(Book b) throws DataAccessException{
		bookMapper.addBook(b);
	};

	@Override
	public void deleteBook(int bookId) throws DataAccessException{
		bookMapper.deleteBook(bookId);
		}; 

	@Override
	public void updateBook(Book b) throws DataAccessException{
		bookMapper.updateBook(b);
	};
	
	//리뷰 검색
	@Override
	public Review getReview(int reviewId) throws DataAccessException{
		return bookMapper.getReview(reviewId);
	};
	//리뷰 추가
	@Override
	public void addReview(Review review) throws DataAccessException{
		bookMapper.addReview(review);
	};

	//리뷰 수정
	@Override
	public void updateReview(Review r) throws DataAccessException{
		bookMapper.updateReview(r);
	};
			
	//리뷰 삭제
	@Override
	public void deleteReview(int reviewId) throws DataAccessException{
		bookMapper.deleteReview(reviewId);
	};
			
	//리뷰 개수 count
	@Override
	public int countReviewByBookId(int bookId) throws DataAccessException{
		return bookMapper.countReviewByBookId(bookId);
	};
	
	
	
}