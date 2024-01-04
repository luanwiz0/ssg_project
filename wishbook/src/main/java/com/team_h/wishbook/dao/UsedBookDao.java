package com.team_h.wishbook.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.UsedBook;

public interface UsedBookDao {
	
		//중고책 add하기
		void addUsedBook(UsedBook usedBook) throws DataAccessException;
				
		//중고책 update 하기
		void updateUsedBook(UsedBook updateUsedBook) throws DataAccessException;
				
		//중고책 delete 하기
		void deleteUsedBook(int usedBookId) throws DataAccessException;
					
		//title로 중고책 찾기
		List<UsedBook> searchUsedBookName(String title) throws DataAccessException;
			
		//userId로 중고책 가져오기 (자신이 등록한 중고책 목록)
		List<UsedBook> getUsedBookByUserId(String userId) throws DataAccessException;
			
		//모든 중고책 리스트 가져오기
		List<UsedBook> getUsedBookList() throws DataAccessException;
			
		//usedBookId로 검색해서 상세정보 가져오기 
		UsedBook getUsedBookInfo(int usedBookId) throws DataAccessException;
		
		//bookTitle로 book반환
		List<Book> searchBookByTitle(String title);
		
		//bookId로 book반환
		Book getBookById(int bookId);
		
		List<UsedBook> getUserUsedBookOrderDiscountPrice(String userId);

}
			
