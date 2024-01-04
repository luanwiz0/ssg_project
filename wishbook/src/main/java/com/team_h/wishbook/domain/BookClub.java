package com.team_h.wishbook.domain;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

//독서 모임
@Getter @Setter
public class BookClub implements Serializable{
	
	private int clubId;
	
	private String clubName; // 모임 이름
	private String userId; // 모임장 아이디(=회원 아이디)
	private String description; // 모임 소개
	private int currNum; // 현재 인원
	private int maxNum; // 최대 인원
	private int day; // 모임 요일(일주일 중 무슨 요일인지)
	private int startTime; // 시작 시간
	private int hour; // 진행 시간
	private String address; // 모임 장소
	private String[] dayStr = {"월", "화", "수", "목", "금", "토", "일"};
	
	// 이걸 아예 book 객체를 참조하는 식으로 바꿔야 할듯
	private int bookId;
	private String title;
	private String author;
	private String publisher;
	private String imageUrl;
	
	// 해당 독서모임의 신청자 목록
	//private List<Account> userList;
	private List<String> userList;
	
	// 테스트용 임시 생성자
	public BookClub() {
		
	}

	public BookClub(int clubId, String clubName, String hostId, String clubDescription, int bookId, int currNum) {
		super();
		this.clubId = clubId;
		this.clubName = clubName;
		this.userId = hostId;
		this.description = clubDescription;
		this.bookId = bookId;
		this.currNum = currNum;
	}
	
	

}