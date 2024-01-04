package com.team_h.wishbook.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.team_h.wishbook.dao.UsedBookDao;

import com.team_h.wishbook.dao.mybatis.mapper.BookMapper;
import com.team_h.wishbook.dao.mybatis.mapper.UsedBookMapper;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.UsedBook;

@Repository
public class MybatisUsedBookDao implements UsedBookDao {
	
	@Autowired
	private UsedBookMapper usedBookMapper;
	
	//중고책 add하기
	public void addUsedBook(UsedBook usedBook) {
		usedBookMapper.addUsedBook(usedBook);
	}
	
	//중고책 update 하기
	public void updateUsedBook(UsedBook updateUsedBook) {
		usedBookMapper.updateUsedBook(updateUsedBook);
	}
					
	//중고책 delete 하기
	public void deleteUsedBook(int usedBookId) {
		usedBookMapper.deleteUsedBook(usedBookId);
	}
							
	//title로 중고책 찾기
	public List<UsedBook> searchUsedBookName(String title){
		return usedBookMapper.searchUsedBookName(title);
	}
				
	//userId로 중고책 가져오기 (자신이 등록한 중고책 목록)
	public List<UsedBook> getUsedBookByUserId(String userId){
		return usedBookMapper.getUsedBookByUserId(userId);
	}
				
	//모든 중고책 리스트 가져오기
	public List<UsedBook> getUsedBookList(){
		return usedBookMapper.getUsedBookList();
	}
				
	//usedBookId로 검색해서 상세정보 가져오기 
	public UsedBook getUsedBookInfo(int usedBookId) {
		return usedBookMapper.getUsedBookInfo(usedBookId);
	}
	
	//bookTitle로 book반환
	public List<Book> searchBookByTitle(String title){
		return usedBookMapper.searchBookByTitle(title);
	}
		
		//bookId로 book반환
	public Book getBookById(int bookId) {
		return usedBookMapper.getBookById(bookId);
	}
	
	public List<UsedBook> getUserUsedBookOrderDiscountPrice(String userId){
		return usedBookMapper.getUserUsedBookOrderDiscountPrice(userId);
	}
}
