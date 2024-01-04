package com.team_h.wishbook.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int reviewId;
	private int bookId;
	private String content;
	private String userId; // 작성자
	private int check;
	
	
}
