package com.team_h.wishbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;

import com.team_h.wishbook.domain.Book;
import com.team_h.wishbook.domain.Order;
import com.team_h.wishbook.domain.Review;
import com.team_h.wishbook.domain.UsedBook;
import com.team_h.wishbook.service.BookService;
import com.team_h.wishbook.service.SellService;
import com.team_h.wishbook.util.ImageUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BookController {
	
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private SellService sellService;
	
	@Autowired
	private ImageUtil imageUtil;
	
	//전체 목록 조회
	@RequestMapping("/book/list")
	public ModelAndView getBookList(
			/* @RequestParam(name = "p", defaultValue = "1") int page, */ HttpServletRequest request) {
		int islogin = 0;
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userId");
		if(user != null) {
			islogin = 1;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/book/bookList");
		mav.addObject("islogin", islogin);
		
		List<Book> list = bookService.getBookList();
		mav.addObject("list", list);
		/* int count = bookService.countBookList(); */
		//paging
		/*
		 * if (count > 0) {
		 * 
		 * int perPage = 10; // 한 페이지에 보일 글의 갯수 int startRow = (page - 1) * perPage;
		 * 
		 * List<Book> list = bookService.getBookList(); mav.addObject("start",
		 * startRow+1); mav.addObject("list", list);
		 * 
		 * int pageNum = 5; int totalPages = count / perPage + (count % perPage > 0 ? 1
		 * : 0); // 전체 페이지 수
		 * 
		 * int begin = (page - 1) / pageNum * pageNum + 1; int end = begin + pageNum -
		 * 1; if (end > totalPages) { end = totalPages; } mav.addObject("begin", begin);
		 * mav.addObject("end", end); mav.addObject("pageNum", pageNum);
		 * mav.addObject("totalPages", totalPages);
		 * 
		 * System.out.println(begin); System.out.println(count); }
		 */
		
		return mav;
	}
	
	
	//상품 상세 정보 확인, 책 별 리뷰리스트
	@RequestMapping("/book/info/{bookId}")
	public ModelAndView getItem(@PathVariable int bookId, HttpServletRequest request) {
		int islogin = 0;
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userId");
		if(user != null) {
			islogin = 1;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/bookInfo");
		
		Book b = new Book();
		b = bookService.getBookInfo(bookId);
		
		
		mav.addObject("book", b);
		mav.addObject("userid", user);
  		mav.addObject("islogin", islogin);
		
		// 리뷰리스트 가져오기
		List<Review> rlist = bookService.getReviewList(bookId);
		for(int i = 0;i<rlist.size();i++) {
			if(rlist.get(i).getUserId().equals(user)) {
				rlist.get(i).setCheck(1);
			}else {
				rlist.get(i).setCheck(0);
			}
		}
		
		int countReview = bookService.countReviewByBookId(bookId);
		
		mav.addObject("rlist", rlist);
		mav.addObject("rCount", countReview);
	
		
		return mav;
	}
	
	//카테고리 별 상품목록
	@RequestMapping("/book/categoryList/{category}")
	public ModelAndView getBookByCategory(@PathVariable String category) {
		List<Book> list = bookService.getBookByCategory(category);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/book/bookList");
		if (list != null) {
			mav.addObject("list", list);
			mav.addObject("keyword", category);
			mav.addObject("search", "분야");
		}
		return mav;
	}
	
	
	//제목, 작가로 검색
	@RequestMapping("/book/searchBookByKeyword")
	public ModelAndView searchBookByKeyword(String searchn, String search, HttpServletRequest request) {
		
		int islogin = 0;
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userId");
		if(user != null) {
			islogin = 1;
		}
		
		ModelAndView mav = new ModelAndView();
		List<Book> list = null;
		if(searchn.equals("title")) // 제목으로 검색
			list = bookService.searchBookByTitle(search);
		else if(searchn.equals("author")) { //작가로 검색
			list = bookService.searchBookByAuthor(search);
		}
		mav.addObject("list", list);
		mav.addObject("search", search);
		mav.addObject("islogin", islogin);
		mav.setViewName("/book/bookSearchList");
		
		return mav;
	}
	

	
	//책 추가
	@GetMapping("/book/add") 
	public String addBookForm(@ModelAttribute("book") Book book) {
		return "/book/add"; 
	}
	
	@PostMapping("/book/add") 
	public String addBook(HttpServletRequest request, @RequestParam("title") String title,
			@RequestParam("author") String author,
			@RequestParam("publisher") String publisher,
			@RequestParam("price") int price,
			@RequestParam("category") String category,
			@RequestParam("description") String description, @RequestParam("imageUrl") MultipartFile file){ 
		
		HttpSession session = request.getSession(true);
		String imagePath = imageUtil.uploadImage(request, file);
		
		Book book = new Book();
		book.setTitle(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setPrice(price);
		book.setCategory(category);
		book.setDescription(description);
		book.setImageUrl(imagePath);
		
		
		bookService.addBook(book); 
		return "redirect:/book/list"; 
	}
	
	
	
	//책 삭제
	@RequestMapping("/book/delete/{bookId}")
	public String deleteBook(@PathVariable int bookId, Model m) {
		bookService.deleteBook(bookId);
		return "redirect:/book/list";
	}
	
	//책 수정
	@GetMapping("/book/update/{bookId}")
	public String updateBookForm(@PathVariable int bookId,Model m){
		Book b = bookService.getBookInfo(bookId);
		m.addAttribute("book",b);
		return "/book/update";
	}
	@PostMapping("/book/update/{bookId}")
	public String updateBook(@PathVariable int bookId, Book b) {
		//기존 정보 업데이트
		bookService.updateBook(b);
		return "redirect:/book/list";
		
	}
	
	//리뷰 작성
	@GetMapping("/review/add/{bookId}")
	public String addReviewForm(HttpServletRequest request, @PathVariable int bookId, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		Review review = new Review(); // 새로운 Review 객체 생성
	    review.setBookId(bookId); // bookId 설정
	    review.setUserId(userId); // userId 설정
	   // review.setTitle();
	    model.addAttribute("r", review); // review 객체를 "r" 이름으로 모델에 추가
	    return "/review/add";
	}
	
	@PostMapping("/review/add")
	public String addReview(HttpServletRequest request, Review r, int bookId) {
		bookService.addReview(r);
		
		return "redirect:/book/list";
	}
	
	//리뷰 삭제
	@RequestMapping("/review/delete/{reviewId}")
	public String deleteReview(@PathVariable int reviewId, Model m) {
		bookService.deleteReview(reviewId);
		return "redirect:/book/list";
	}
	
	//리뷰 수정
	@GetMapping("/review/update/{reviewId}")
	public String updatereviewForm(@PathVariable int reviewId, Model m){
		
		Review r = bookService.getReview(reviewId);
		m.addAttribute("review",r);
		
		return "/review/update";
	}
	@PostMapping("/review/update/{reviewId}")
	public String updatereview(@PathVariable int reviewId, Review r) {
		//기존 정보 업데이트
		bookService.updateReview(r);
		return "redirect:/book/list";
		
	}
	
	
	
	//사용자 구매내역 확인
	@RequestMapping("/book/bookOrderList")
	public ModelAndView getUserPurchaseList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
				
		List<Order> orderList = sellService.getUserOrderListByKind("책",userId);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/book/bookOrderList");
		mav.addObject("userBookList", orderList);
		
		return mav;
	}
	
	
	
	
}