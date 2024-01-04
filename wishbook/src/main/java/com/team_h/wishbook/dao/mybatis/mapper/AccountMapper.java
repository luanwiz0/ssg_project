package com.team_h.wishbook.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Grade;

@Mapper
public interface AccountMapper {

	List<Account> getUserList();
	
	String getPasswordByUserId(String userId);
	
	Account getUserInfo(String userId);
	
	void updateUserInfo(Account account);
	
	String getGradeName(int gradeId);
	
	void registerAccount(Account account);
	
	List<Grade> getGradeList();
}
