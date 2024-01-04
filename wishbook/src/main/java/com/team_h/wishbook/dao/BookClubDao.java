package com.team_h.wishbook.dao;

import java.util.List;

import com.team_h.wishbook.controller.BookClubInfo;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.BookClub;

public interface BookClubDao {
	
	// 목록 확인
		List<BookClub> getBookClubList();

		// 정보 가져오기
		BookClub getBookClub(int bookClubId);
		
		// 독서모임 추가
		void addBookClub(BookClubInfo bookClubInfo);
		
		// 독서모임 수정
		void updateBookClub(BookClubInfo bookClubInfo);
		
		// 삭제
		void deleteBookClub(int bookClubId);
		
		// 신청
		void registerBookClub(int bookClubId, String memberId);
		
		// 취소
		void cancelBookClub(int bookClubId, String memberId);
		
		// 인원 변경
		void changeBookClubNum(int currNum, int bookClubId);
		
		// 하나의 독서 모임에 대한 사용자 목록 확인
		List<Account> getUserList(int bookClubId);
}
