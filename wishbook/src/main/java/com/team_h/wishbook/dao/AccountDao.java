package com.team_h.wishbook.dao;

import java.util.List;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Grade;

public interface AccountDao {
		
	//사용자리스트 반환
	List<Account> getUserList();
		
	//userId받아서 password반환
	String getPasswordByUserId(String userId);
	
	//userId받아서 account반환
	Account getUserInfo(String userId);
	
	String getGradeName(int gradeId);
	
	List<Grade> getGradeList();
		
	//사용자 정보 수정
	void updateUserInfo(Account account);
		
	//회원가입
	void registerAccount(Account account);
}
