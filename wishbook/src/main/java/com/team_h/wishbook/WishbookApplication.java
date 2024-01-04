package com.team_h.wishbook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WishbookApplication {

	public static void main(String[] args) {
		System.out.print("메인은 들어왔음");
		SpringApplication.run(WishbookApplication.class, args);
	}

}
