package com.team_h.wishbook.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team_h.wishbook.controller.BookClubInfo;
import com.team_h.wishbook.dao.BookClubDao;
import com.team_h.wishbook.dao.mybatis.mapper.BookClubMapper;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.BookClub;

@Repository
public class MybatisBookClubDao implements BookClubDao{
	
	@Autowired
	private BookClubMapper bookClubMapper;

	@Override
	public List<BookClub> getBookClubList() {
		return bookClubMapper.getBookClubList();
	}

	@Override
	public BookClub getBookClub(int bookClubId) {
		return bookClubMapper.getBookClub(bookClubId);
	}

	@Override
	public void addBookClub(BookClubInfo bookClubInfo) {
		bookClubMapper.addBookClub(bookClubInfo);
	}

	@Override
	public void updateBookClub(BookClubInfo bookClubInfo) {
		System.out.println("mybatis: " + bookClubInfo.toString());
		bookClubMapper.updateBookClub(bookClubInfo);
	}

	@Override
	public void deleteBookClub(int bookClubId) {
		bookClubMapper.deleteBookClub(bookClubId);
	}

	@Override
	public void registerBookClub(int bookClubId, String memberId) {
		bookClubMapper.registerBookClub(bookClubId, memberId);
	}
	
	@Override
	public void cancelBookClub(int bookClubId, String memberId) {
		bookClubMapper.cancelBookClub(bookClubId, memberId);
	}

	@Override
	public void changeBookClubNum(int currNum, int bookClubId) {
		bookClubMapper.changeBookClubNum(currNum, bookClubId);
	}
	
	@Override
	public List<Account> getUserList(int bookClubId) {
		return bookClubMapper.getUserList(bookClubId);
	}

}