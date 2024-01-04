package com.team_h.wishbook.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.GroupPurchase;

@Mapper
public interface GroupPurchaseMapper {
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
	
	void updateGroupPurchase(GroupPurchase groupPurchase);
	
	void deleteGroupPurchaseById(int groupId);
	
	void registerGroupPurchase(String userId, int groupId);
	void plusCustomerNum(int groupId);
	void minusCustomerNum(int groupId);
	void cancelGroupPurchase(String userId, int groupId);
	List<Integer> getGroupItemIdByUserId(String userId);
	
	List<Account> getMemberListByGroupId(int groupId);
	
	
	
	void addGroupPurchase(GroupPurchase groupPurchase);
	
}
