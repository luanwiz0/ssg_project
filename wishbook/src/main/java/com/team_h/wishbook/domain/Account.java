package com.team_h.wishbook.domain;

import lombok.Data;

@Data
public class Account {
	private String userId; 	//PK
	private String password;
	private String confirmPassword;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String favoriteCategory;
	
	private int point;
	private int purchaseAmount;
	private int gradeId;
	private int sellNum;
}