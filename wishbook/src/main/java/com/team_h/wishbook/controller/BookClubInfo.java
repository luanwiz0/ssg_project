package com.team_h.wishbook.controller;

import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BookClubInfo {
	private int clubId;
	
	private String clubName; // 모임 이름
	private String description; // 모임 소개
	private int currNum; // 현재 인원
	private int maxNum; // 최대 인원
	private int day; // 모임 요일(일주일 중 무슨 요일인지)
	private String dayVal;
	private String[] dayStr = {"월", "화", "수", "목", "금", "토", "일"};
	private int startTime; // 시작 시간
	private int hour; // 진행 시간
	private String address; // 모임 장소
	
	private String userId;
	private int bookId;
	
	@Override
	public String toString() {
		return "BookClubInfo [clubId=" + clubId + ", clubName=" + clubName + ", description=" + description
				+ ", currNum=" + currNum + ", maxNum=" + maxNum + ", day=" + day + ", dayVal=" + dayVal + ", dayStr="
				+ Arrays.toString(dayStr) + ", startTime=" + startTime + ", hour=" + hour + ", address=" + address
				+ ", userId=" + userId + ", bookId=" + bookId + "]";
	}

}
