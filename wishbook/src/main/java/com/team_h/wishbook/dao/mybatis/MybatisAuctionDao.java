package com.team_h.wishbook.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.team_h.wishbook.dao.AuctionDao;
import com.team_h.wishbook.dao.mybatis.mapper.AuctionMapper;
import com.team_h.wishbook.domain.Auction;
import com.team_h.wishbook.domain.Book;

@Repository
public class MybatisAuctionDao implements AuctionDao{
	@Autowired
	private AuctionMapper auctionMapper;
	
	//경매 추가
	public void addAuction(Auction a) throws DataAccessException{
		auctionMapper.addAuction(a);
	};
	public Book getBookById(int bookId) throws DataAccessException{
		return auctionMapper.getBookById(bookId);
	};
	
	
	
	public void updateAuction(Auction a) throws DataAccessException{
		auctionMapper.updateAuction(a);
	};
	public void deleteAuction(int auctionId) throws DataAccessException{
		auctionMapper.deleteAuction(auctionId);
	};
	
	
	// 게시글 상세보기할 때 
	public Auction getAuctionInfo(int auctionId) throws DataAccessException{
		return auctionMapper.getAuctionInfo(auctionId);
	};
	//경매 아이템 리스트 불러올 때 
	public List<Auction> getAuctionList() throws DataAccessException{
		return auctionMapper.getAuctionList();
	};
	
	//입찰 시 사용
	public void applyAuctionBid(Auction a) throws DataAccessException{
		auctionMapper.applyAuctionBid(a);
	};
	
	

	
	//경매 종료 
	public void updateAuctionStatus(int currPrice, int auctionId) throws DataAccessException{
		auctionMapper.updateAuctionStatus(currPrice, auctionId);
	};
	
	

	

	
	public List<Book> getBookInfoByTitle(String title) throws DataAccessException{
		return auctionMapper.getBookInfoByTitle(title);
	}
}
