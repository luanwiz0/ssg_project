package com.team_h.wishbook.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_h.wishbook.dao.GroupPurchaseDao;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.GroupPurchase;

@Service
public class GroupPurchaseService {
	
	@Autowired
	private GroupPurchaseDao groupPurchaseDao;
	
	//공동구매 리스트 반환
	public List<GroupPurchase> getGroupPurchaseList() {
		return groupPurchaseDao.getGroupPurchaseList();
	}
	
	//status 설정
	public void setStatusGroupPurchase(List<GroupPurchase> list){
		Date now = new Date();
		
		for(int i=0; i<list.size(); i++) {
			if(now.after(list.get(i).getDeadline())) {
				if(list.get(i).getStatus().equals("end"))
					continue;
				else
					groupPurchaseDao.endStatus(list.get(i).getGroupId(), "end");
			}
			else if(now.equals(list.get(i).getDeadline())){
				groupPurchaseDao.ongoingStatus(list.get(i).getGroupId(), "ongoing");
			}
			else {
				if(list.get(i).getStatus().equals("ongoing"))
					continue;
				else
					groupPurchaseDao.ongoingStatus(list.get(i).getGroupId(), "ongoing");
			}	
		}
		
		//인원 채워지면 statud="end"
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCustomerNum() == list.get(i).getMaxCustomNum()){
				groupPurchaseDao.endStatus(list.get(i).getGroupId(), "end");
			}
		}
	}
	
	//price 설정
	public List<GroupPurchase> setPriceGroupPurchase(List<GroupPurchase> groupPurchaseList) {
		for(int i = 0; i < groupPurchaseList.size(); i++) {
			groupPurchaseList.get(i).setPrice((int)(groupPurchaseList.get(i).getBookPrice() 
					* (100 - groupPurchaseList.get(i).getDiscountRate()) * 0.01));
		}
		return groupPurchaseList;
	}
	
	
	//groupId받아서 GroupPurchase반환
	public GroupPurchase getGroupPurchaseById(int groupId) {
		return groupPurchaseDao.getGroupPurchaseById(groupId);
	}
	
	//bookTitle로 book반환
	public List<Book> searchBookByTitle(String title){
		return groupPurchaseDao.searchBookByTitle(title);
	}
	
	//bookId로 book반환
	public Book getBookById(int bookId) {
		return groupPurchaseDao.getBookById(bookId);
	}
	
	//할인율 설정
	public int getPriceBydiscountRate(int discountRate, int bookPrice) {
		return (int)(bookPrice * ((100 - discountRate) * 0.01));
	}
	
	//공동구매 수정
	public void updateGroupPurchase(GroupPurchase groupPurchase) {
		groupPurchaseDao.updateGroupPurchase(groupPurchase);
	}
	
	//공동구매 삭제
	public void deleteGroupPurchaseById(int groupId) {
		groupPurchaseDao.deleteGroupPurchaseById(groupId);
	}
	
	//사용자가 공동구매 신청
	public void registerGroupPurchase(String userId, int groupId) {
		groupPurchaseDao.registerGroupPurchase(userId, groupId);
	}
	
	public void plusCustomerNum(int groupId) {
		groupPurchaseDao.plusCustomerNum(groupId);
	}
	
	public void minusCustomerNum(int groupId) {
		groupPurchaseDao.minusCustomerNum(groupId);
	}
	
	public Integer getGroupItemIdById(String userId, int groupId) {
		return groupPurchaseDao.getGroupItemIdById(userId, groupId);
	}
	
	public Integer getCartGroupIdById(String userId, int groupId) {
		return groupPurchaseDao.getCartGroupIdById(userId, groupId);
	}
	
	//사용자가 공동구매 취소
	public void cancelGroupPurchase(String userId, int groupId) {
		groupPurchaseDao.cancelGroupPurchase(userId, groupId);
	}
	
	//사용자가 자신의 공동구매 목록 확인
	public List<Integer> getGroupItemIdByUserId(String userId){
		return groupPurchaseDao.getGroupItemIdByUserId(userId);
	}
	
	//groupId받아서 memberList반환
	public List<Account> getMemberListByGroupId(int groupId){
		return groupPurchaseDao.getMemberListByGroupId(groupId);
	}
	
	//공동구매 추가
	public void addGroupPurchase(GroupPurchase groupPurchase) {
		groupPurchaseDao.addGroupPurchase(groupPurchase);
	}
}