package com.team_h.wishbook.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import com.team_h.wishbook.domain.Auction;
import com.team_h.wishbook.domain.Book;

public interface AuctionDao {

	// 경매 게시글 작성시 사용
		void addAuction(Auction a) throws DataAccessException;

		Book getBookById(int bookId) throws DataAccessException;

		List<Book> getBookInfoByTitle(String title) throws DataAccessException;

		void updateAuction(Auction a) throws DataAccessException;

		void deleteAuction(int auctionId) throws DataAccessException;

		// 게시글 상세보기할 때
		Auction getAuctionInfo(int auctionId) throws DataAccessException;

		// 경매 아이템 리스트 불러올 때
		List<Auction> getAuctionList() throws DataAccessException;

		// 경매 입찰
		void applyAuctionBid(Auction a) throws DataAccessException;
		
		//경매 마감
		void updateAuctionStatus(int currPrice, int auctionId) throws DataAccessException;

		
}