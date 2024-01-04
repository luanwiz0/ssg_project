package com.team_h.wishbook.dao.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.dao.DataAccessException;

import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.Review;

@Mapper
public interface BookMapper {
	//전체 목록 조회
	@Select("select * from Book order by bookId desc")
	List<Book> getBookList();
	
	@Select("select count(*) from Book")
	int countBookList();
	
	//상품 상세 정보 확인, 책 별 리뷰리스트
	@Select("select * from Book where bookId = #{bookId}")
	Book getBookInfo(int bookId);
	
	List<Review> getReviewList(int bookId);
	
	@Select("select * from Book where category = #{category}")
	List<Book> getBookByCategory(String category);
	
	
	List<Book> searchBookByTitle(@Param("search") String search);
	
	List<Book> searchBookByAuthor(@Param("search") String search);

	void addBook(Book b);

	@Delete("delete from Book where bookId =#{bookId}")
	void deleteBook(int bookId);

	@Update("update Book set title=#{title}, author=#{author}, publisher=#{publisher}, description=#{description}, imageUrl=#{imageUrl} where bookId=#{bookId}")
	void updateBook(Book b);
	
	//리뷰 검색
	@Select("select * from Review where reviewId = #{reviewId}")
	Review getReview(int reviewId);
	
	//리뷰 추가
	void addReview(Review review);

	//리뷰 수정
	@Update("update review set content=#{content} where reviewId=#{reviewId}")
	void updateReview(Review r);
		
	//리뷰 삭제
	@Delete("delete from Review where reviewId =#{reviewId}")
	void deleteReview(int reviewId);
		
	//리뷰 개수 count
	@Select("select count(*) from Review where bookId = #{bookId}")
	int countReviewByBookId(int bookId);
}