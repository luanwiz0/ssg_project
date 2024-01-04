package com.team_h.wishbook.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.team_h.wishbook.domain.Auction;
import com.team_h.wishbook.domain.Book;

@Mapper
public interface AuctionMapper {
	
		//경매 추가
		void addAuction(Auction a);
		//등록할 때, 제목으로 book 검색
		List<Book> getBookInfoByTitle(String title);
		
		
		void updateAuction(Auction a);
		void deleteAuction(int auctionId);
		
		
		// 게시글 상세보기 
		Auction getAuctionInfo(int auctionId);
		//경매 전체보기
		List<Auction> getAuctionList();
		
		//경매 입찰
		void applyAuctionBid(Auction a);
		
		//경매 입찰 목록 뽑을 때 사용
		List<Auction> selectAuctionBidList(int auctionId);
		
		//경매 마감시 status 수정
		void updateAuctionStatus(int currPrice, int auctionId);
		
		
		
		//경매 내가 한 입찰 목록 불러오기. 
		List<Auction> selectAuctionBidByMemberId(int userId);
		
		
		
		@Select("select * from Book where bookId = #{bookId}")
		Book getBookById(int bookId);

}