package com.team_h.wishbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team_h.wishbook.controller.BookClubInfo;
import com.team_h.wishbook.dao.BookClubDao;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.BookClub;

@Service
public class BookClubService {
	
	@Autowired
	private BookClubDao bookClubDao;

	// 임시 데이터
//	private List<BookClub> bookClubList = new ArrayList<>(Arrays.asList(new BookClub(0, "aaa", "user", "hi", "book", 0), 
//			new BookClub(1, "aaa", "user", "hi", "book", 1), new BookClub(2, "aaa", "user", "hi", "book", 2)));
//	private int nextId = 4;

	// 목록 확인
	public List<BookClub> getBookClubList(){
		//return bookClubList;
		return bookClubDao.getBookClubList();
	}
	
	// 1개 정보 가져오기
	public BookClub getBookClub(int bookClubId) {
		//return bookClubList.get(bookClubId);
		return bookClubDao.getBookClub(bookClubId);
	}
	
	// 독서모임 추가
	public void addBookClub(BookClubInfo bookClubInfo, String userId) {
//		bookClubList.add(new BookClub(nextId, bookClubInfo.getClubName(), userId, bookClubInfo.getDescription(), 
//				bookClubInfo.getBookId(), 0));
//		nextId++;
		bookClubInfo.setUserId(userId);
		for(int i = 0; i < bookClubInfo.getDayStr().length; i++) {
			if(bookClubInfo.getDayVal().equals(bookClubInfo.getDayStr()[i])) {
				bookClubInfo.setDay(i);
				break;
			}
		}
		bookClubDao.addBookClub(bookClubInfo);
	}
	
	// 독서모임 수정
	public void updateBookClub(BookClubInfo bookClubInfo) {
//		int clubId = bookClubInfo.getClubId();
//		BookClub bookClub = bookClubList.get(clubId);
//	
//		// 수정
//		bookClub.setClubName(bookClubInfo.getClubName());
//		bookClub.setDescription(bookClubInfo.getDescription());
//		bookClub.setBookId(bookClubInfo.getBookId());
//	
//		bookClubList.set(clubId, bookClub);
		
		for(int i = 0; i < bookClubInfo.getDayStr().length; i++) {
			if(bookClubInfo.getDayVal().equals(bookClubInfo.getDayStr()[i])) {
				bookClubInfo.setDay(i);
				break;
			}
		}
		System.out.println("service: " + bookClubInfo.toString());
		bookClubDao.updateBookClub(bookClubInfo);
	}
	
	// 삭제
	public void deleteBookClub(int bookClubId) {
//		bookClubList.remove(bookClubId);
		bookClubDao.deleteBookClub(bookClubId);
	}
	
	
	// 신청
	@Transactional
	public void registerBookClub(int bookClubId, String memberId) {
//		BookClub bookClub = bookClubList.get(bookClubId);
//		if(bookClub.getUserList() == null) {
//			bookClub.setUserList(new ArrayList<String>());
//		}
//		bookClub.getUserList().add(memberId); // 목록에 추가
//		bookClub.setCurrNum(bookClub.getCurrNum() + 1); // 현재 인원수 +1
//		bookClubList.set(bookClubId, bookClub);
		BookClub bookClub = bookClubDao.getBookClub(bookClubId);
		bookClubDao.registerBookClub(bookClubId, memberId);
		bookClubDao.changeBookClubNum(bookClub.getCurrNum() + 1, bookClubId);
	}
	
	// 취소
	@Transactional
	public void cancelBookClub(int bookClubId, String memberId) {
		BookClub bookClub = bookClubDao.getBookClub(bookClubId);
		bookClubDao.cancelBookClub(bookClubId, memberId);
		bookClubDao.changeBookClubNum(bookClub.getCurrNum() - 1, bookClubId);
	}
	
	// 하나의 독서 모임에 대한 사용자 목록 확인
	public List<Account> getUserList(int bookClubId){
//		return bookClubList.get(bookClubId).getUserList();
		System.out.println(bookClubId);
		return bookClubDao.getUserList(bookClubId);
	}
}