package com.team_h.wishbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.team_h.wishbook.dao.BookDao;
import com.team_h.wishbook.dao.UsedBookDao;
import com.team_h.wishbook.domain.Book;

import com.team_h.wishbook.domain.UsedBook;

@Service
public class UsedBookService {
	
		@Autowired
		private UsedBookDao usedBookDao; // Dao 사용한다
		 
		//중고책 add하기
		public void addUsedBook(UsedBook usedBook) {
			usedBookDao.addUsedBook(usedBook);
		}
			
		//중고책 update 하기
		public void updateUsedBook(UsedBook updateUsedBook) {
			//Command 객체에 입력된 정보들로 객체를 update 한다
			usedBookDao.updateUsedBook(updateUsedBook);
		}
			
		//중고책 delete 하기
		public void deleteUsedBook(int usedBookId) {
			usedBookDao.deleteUsedBook(usedBookId);
		}
			
		//title로 중고책 찾기
		public List<UsedBook> searchUsedBookName(String title) {
			//title로 검색해서 나온 객체들을 List에 넣어서 return 
			return usedBookDao.searchUsedBookName(title);
		} 
		
		//userId로 중고책 가져오기 (자신이 등록한 중고책 목록)
		public List<UsedBook> getUsedBookByUserId(String userId) {
			//sellId = usedId로 검색해서 나온 값들로 List에 넣어서 return.
			return usedBookDao.getUsedBookByUserId(userId);
		}
		
		//모든 중고책 리스트 가져오기
		public List<UsedBook> getUsedBookList() {
			//현재 있는 모든 usedBook을 List에 넣어서 return 
			return usedBookDao.getUsedBookList();
		}
		
		//usedBookId로 검색해서 상세정보 가져오기 
		public UsedBook getUsedBookInfo(int usedBookId) {
			//버튼을 누르면 usedBookId로 검색해서 나온 객체를 return 
			return usedBookDao.getUsedBookInfo(usedBookId);
		}
		
		//bookTitle로 book반환
		public List<Book> searchBookByTitle(String title){
			return usedBookDao.searchBookByTitle(title);
		}
		
		//bookId로 book반환
		public Book getBookById(int bookId) {
			return usedBookDao.getBookById(bookId);
		}
		
		public List<UsedBook> getUserUsedBookOrderDiscountPrice(String userId){
			return usedBookDao.getUserUsedBookOrderDiscountPrice(userId);
		}
}
