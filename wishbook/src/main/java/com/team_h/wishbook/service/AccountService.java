package com.team_h.wishbook.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.ArrayList;

import com.team_h.wishbook.dao.AccountDao;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Grade;
import com.team_h.wishbook.domain.GroupPurchase;

@Service
public class AccountService {
	
	@Autowired
	private AccountDao accountDao;
	
	//사용자리스트 반환
	public List<Account> getUserList() {
		return accountDao.getUserList();
	}
	
	
	//로그인 할때 유효한 사용자인지 확인
	public Map<String, String> isValidUser(String userId, String password) {
		Map<String, String> user = new HashMap<String, String>();
		String validPassword = accountDao.getPasswordByUserId(userId);

		//유효하면 user반환, 유효하지 않으면 null반환
		if (validPassword != null && validPassword.equals(password) == true) {
			user.put("userId", userId);
			user.put("password", password);
			
			return user;
		}
		return null;
	}
	
	//userId받아서 account반환
	public Account getUserInfo(String userId) {
		return accountDao.getUserInfo(userId);
	}
	
	//gradeId받아서 gradeName반환
	public String getGradeName(int gradeId) {
		return accountDao.getGradeName(gradeId);
	}
	
	//등급
	public List<Grade> getGradeList(){
		List<Grade> gradeList = accountDao.getGradeList();
		for(int i = 0; i < gradeList.size(); i++) {
			gradeList.get(i).setStandardPrice(gradeList.get(i).getStandardPrice() * 10000);
		}
		
		return gradeList;
	}
	
	//사용자 정보 수정
	public void updateUserInfo(Account account) {
		accountDao.updateUserInfo(account);
	}
	
	//회원가입
	public void registerAccount(Account account) {
		accountDao.registerAccount(account);
	}
	
	//회원가입 시 비밀번호 확인
	public boolean isPasswordMatchConfirmPassword(String password, String confirmPassword) {
		if(password.equals(confirmPassword))
			return true;
		else
			return false;
	}
	
	//id check
	public int idCheck(String userId) {
		List<Account> list = accountDao.getUserList();
		int check = 1;
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getUserId().equals(userId)) {
				check = 0;
				break;
			}
		}
		
		return check;
	}
}