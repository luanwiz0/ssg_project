package com.team_h.wishbook.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team_h.wishbook.dao.AccountDao;
import com.team_h.wishbook.dao.mybatis.mapper.AccountMapper;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Grade;
@Repository
public class MybatisAccountDao implements AccountDao {
		
		@Autowired
		private AccountMapper accountMapper;
		
		//사용자리스트 반환
		public List<Account> getUserList(){
			return accountMapper.getUserList();
		}
		
		//userId받아서 password반환
		public String getPasswordByUserId(String userId) {
			return accountMapper.getPasswordByUserId(userId);
		}
		
		//userId받아서 account반환
		public Account getUserInfo(String userId) {
			return accountMapper.getUserInfo(userId);
		}
		
		//gradeId받아서 gradeName반환
		public String getGradeName(int gradeId) {
			return accountMapper.getGradeName(gradeId);
		}
		
		//등급
		public List<Grade> getGradeList(){
			return accountMapper.getGradeList();
		}
		
		//사용자 정보 수정
		public void updateUserInfo(Account account) {
			accountMapper.updateUserInfo(account);
		}
		
		//회원가입
		public void registerAccount(Account account) {
			accountMapper.registerAccount(account);
		}
}
