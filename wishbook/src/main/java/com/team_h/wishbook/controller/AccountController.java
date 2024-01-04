package com.team_h.wishbook.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team_h.wishbook.dao.AccountDao;
import com.team_h.wishbook.domain.Account;
import com.team_h.wishbook.domain.Grade;
import com.team_h.wishbook.domain.GroupPurchase;
import com.team_h.wishbook.service.AccountService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	private AccountService accountService;
		
	//관리자가 사용자리스트 확인
	@RequestMapping("/userList")
	public ModelAndView getUserList() {
		List<Account> accountList = accountService.getUserList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/account/adminUserList");
		mav.addObject("accountList", accountList);
		
		return mav;
	}
	
	//등급 기준 확인
	@RequestMapping("/grade")
	public ModelAndView getGrade() {
		List<Grade> gradeList = accountService.getGradeList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/account/grade");
		mav.addObject("gradeList", gradeList);
		
		return mav;
	}
	
	//로그인 페이지 이동
	@RequestMapping("/login")
	public String login() {
		return "/account/login";
	}
	
	//로그인
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(HttpServletRequest request,
    							@RequestParam ("userId") String userId,
    							@RequestParam ("password") String password) {
		
		//유효한 id, password인지 확인
    	Map<String, String> user = accountService.isValidUser(userId, password);
		
    	String message = " ";
		
    	if (user != null) {
			// 로그인 세션 처리
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.get("userId"));
			session.setAttribute("password", user.get("password"));

			message = "<script>location.href='/';</script>";
    	} 
    	else {
    		message = message = "<script>alert('유효한 아이디, 비밀번호가 아닙니다.');location.href='/account/login';</script>";
    	}
        return message;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutDo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("password");

		return "redirect:/";
	}
	
	//사용자 정보 확인
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public ModelAndView getUserInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
				
		Account account = accountService.getUserInfo(userId);
		String gradeName  = accountService.getGradeName(account.getGradeId());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/account/userInfo");
		mav.addObject("account", account);
		mav.addObject("gradeName", gradeName);
		
		return mav;
	}
	
	//사용자 정보 수정
	@ResponseBody
	@RequestMapping(value = "/userInfo", method = RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request, Account updateAccount) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String message = " ";
		
		//비밀번호 확인
		if(accountService.isPasswordMatchConfirmPassword
				(updateAccount.getPassword(), updateAccount.getConfirmPassword())) {
			
			accountService.updateUserInfo(updateAccount);
			message = "<script>alert('수정 되었습니다.');location.href='/account/userInfo';</script>";	
		}
		else
			message = "<script>alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');location.href='/account/userInfo';</script>";
		
		return message;
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/register")
	public String register() {
		return "/account/register";
	}
	
	//회원가입
	@ResponseBody
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String registerDo(Account account) {
		String message = " ";
		
		//비밀번호 확인
		if(accountService.isPasswordMatchConfirmPassword
				(account.getPassword(), account.getConfirmPassword())) {
			if(account.getUserId().equals("")) {
				message = "<script>alert('아이디 중복확인을 진행해 주세요.');location.href='/account/register';</script>";
			}
			else {
				accountService.registerAccount(account);
				message = "<script>alert('가입 성공');location.href='/account/login';</script>";
			}
		}
		else 
			message = "<script>alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');location.href='/account/register';</script>";
		
		return message;
	}
	
	//id 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ModelAndView idCheck(String userId) {
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/account/userInfo");
	
		//중복x
		if(accountService.idCheck(userId) == 1) {
			mav.addObject("message", "사용 가능한 ID입니다.");
			mav.addObject("userId", userId);
			mav.setViewName("/account/register");
		}
		else {
			mav.addObject("message", "이미 존재하는 ID입니다.");
			mav.setViewName("/account/register");
		}
		return mav;
	}
	
}