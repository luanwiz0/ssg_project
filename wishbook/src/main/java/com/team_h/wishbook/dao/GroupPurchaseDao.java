package com.team_h.wishbook.dao;

import java.util.List;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.GroupPurchase;

public interface GroupPurchaseDao {
	
	//공동구매 리스트 반환
	List<GroupPurchase> getGroupPurchaseList();
	
	//status 설정
	void endStatus(int groupId, String end);
	void ongoingStatus(int groupId, String ongoing);
	
	//groupId받아서 GroupPurchase반환
	GroupPurchase getGroupPurchaseById(int groupId);
	
	//bookTitle로 book반환
	List<Book> searchBookByTitle(String title);
	
	//bookId로 book반환
	Book getBookById(int bookId);
	
	Integer getGroupItemIdById(String userId, int groupId);
	
	Integer getCartGroupIdById(String userId, int groupId);
	
	//공동구매 수정
	void updateGroupPurchase(GroupPurchase groupPurchase);
	
	//사용자가 공동구매 신청
	void registerGroupPurchase(String userId, int groupId);
	void plusCustomerNum(int groupId);
	void minusCustomerNum(int groupId);
	void cancelGroupPurchase(String userId, int groupId);
	
	//사용자가 자신의 공동구매 목록 확인
	List<Integer> getGroupItemIdByUserId(String userId);
	
	
	//groupId받아서 memberList반환
	List<Account> getMemberListByGroupId(int groupId);
	
	//공동구매 추가
	void addGroupPurchase(GroupPurchase groupPurchase);
	
	//공동구매 삭제
	void deleteGroupPurchaseById(int groupId);
}
