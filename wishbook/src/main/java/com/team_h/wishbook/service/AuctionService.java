package com.team_h.wishbook.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_h.wishbook.dao.AuctionDao;
import com.team_h.wishbook.domain.Auction;
import com.team_h.wishbook.domain.Book;

 

@Service
public class AuctionService {
	@Autowired
	private AuctionDao auctionDao;

	// 전체 auctionList를 보여줌
	public List<Auction> getAuctionList() {
		return auctionDao.getAuctionList();
	}

	// auctionId가 일치하는 auction객체 return
	public Auction getAuctionInfo(int auctionId) {
		return auctionDao.getAuctionInfo(auctionId);
	}

	// 새로운 auction 등록
	public void addAuction(Auction a) {
		auctionDao.addAuction(a);
	}
	// 책 정보 return
		public List<Book> getBookInfoByTitle(String title) {
			return auctionDao.getBookInfoByTitle(title);
		}
	public Book getBookById(int bookId) {
		return auctionDao.getBookById(bookId);
	}

	// 기존의 auction을 auctionId를 입력받아 삭제
	public void deleteAuction(int auctionId) {
		auctionDao.deleteAuction(auctionId);
	}

	// auction 수정
	public void updateAuction(Auction a) {
		auctionDao.updateAuction(a);
	}

	//경매 입찰
	public void applyAuctionBid(Auction a) {
		auctionDao.applyAuctionBid(a);
	}
	
	//경매 마감
	 public void updateAuctionStatus(int currPrice, int auctionId) {
		 auctionDao.updateAuctionStatus(currPrice, auctionId); 
	 }
			

	
}