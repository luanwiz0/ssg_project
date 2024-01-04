package com.team_h.wishbook.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team_h.wishbook.dao.GroupPurchaseDao;
import com.team_h.wishbook.dao.mybatis.mapper.GroupPurchaseMapper;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.GroupPurchase;

@Repository
public class MybatisGroupPurchaseDao implements GroupPurchaseDao{
	@Autowired
	private GroupPurchaseMapper groupPurchaseMapper;
	
	//공동구매 리스트 반환
	public List<GroupPurchase> getGroupPurchaseList() {
		return groupPurchaseMapper.getGroupPurchaseList();
	}
	
	//status 설정
	public void endStatus(int groupId, String end) {
		groupPurchaseMapper.endStatus(groupId, end);
	}
	
	public void ongoingStatus(int groupId, String ongoing) {
		groupPurchaseMapper.ongoingStatus(groupId, ongoing);
	}
	
	//groupId받아서 GroupPurchase반환
	public GroupPurchase getGroupPurchaseById(int groupId) {
		return groupPurchaseMapper.getGroupPurchaseById(groupId);
	}
	
	//bookTitle로 book반환
	public List<Book> searchBookByTitle(String title){
		return groupPurchaseMapper.searchBookByTitle(title);
	}
	
	//bookId로 book반환
	public Book getBookById(int bookId) {
		return groupPurchaseMapper.getBookById(bookId);
	}
		
	//공동구매 수정
	public void updateGroupPurchase(GroupPurchase groupPurchase) {
		groupPurchaseMapper.updateGroupPurchase(groupPurchase);
	}
	
	//공동구매 삭제
	public void deleteGroupPurchaseById(int groupId) {
		groupPurchaseMapper.deleteGroupPurchaseById(groupId);
	}
	
	//공동구매 추가
	public void addGroupPurchase(GroupPurchase groupPurchase) {
		groupPurchaseMapper.addGroupPurchase(groupPurchase);
	}
	
	//groupId받아서 memberList반환
	public List<Account> getMemberListByGroupId(int groupId){
		return groupPurchaseMapper.getMemberListByGroupId(groupId);
	}
	//사용자가 공동구매 신청
	public void registerGroupPurchase(String userId, int groupId) {
		groupPurchaseMapper.registerGroupPurchase(userId, groupId);
	}
	
	public void plusCustomerNum(int groupId) {
		groupPurchaseMapper.plusCustomerNum(groupId);
	}
	
	public void minusCustomerNum(int groupId) {
		groupPurchaseMapper.minusCustomerNum(groupId);
	}
	
	public Integer getGroupItemIdById(String userId, int groupId) {
		return groupPurchaseMapper.getGroupItemIdById(userId, groupId);
	}
	
	//사용자가 공동구매 취소
	public void cancelGroupPurchase(String userId, int groupId) {
		groupPurchaseMapper.cancelGroupPurchase(userId, groupId);
	}
	
	//사용자가 자신의 공동구매 목록 확인
	public List<Integer> getGroupItemIdByUserId(String userId){
		return groupPurchaseMapper.getGroupItemIdByUserId(userId);
	}
	
	public Integer getCartGroupIdById(String userId, int groupId) {
		return groupPurchaseMapper.getCartGroupIdById(userId, groupId);
	}
	
	
}
