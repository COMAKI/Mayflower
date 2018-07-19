package com.mw.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mw.frame.Service;
import com.mw.vo.User;

@Controller
public class UserController {
	
	@Resource(name="uservice")
	Service<User, String> service;
	
	@RequestMapping("/login.hw")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("centerpage", "login");
		return mv; // login.jsp
	}
	@RequestMapping("/logout.hw")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("centerpage", "center");
		return mv; // login.jsp
	}
	@RequestMapping("/register.hw")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("centerpage", "register");
		return mv; // register.jsp
	}
	
	@RequestMapping("/loginimpl.hw")
	public ModelAndView loginimpl(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		User user = null;
		try {
			 user = service.get(id);
			 System.out.println(user);
			 if(id.equals(user.getId()) && pwd.equals(user.getPwd())) {
					mv.addObject("centerpage", "loginok");
					HttpSession session = request.getSession();
					session.setAttribute("loginid", id);
			} else {
					mv.addObject("centerpage", "loginfail");
			}	 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("centerpage", "loginfail");
		}
		
		return mv; // login.jsp
	}
	
	
	
	@RequestMapping("/userregister.mw")
	public ModelAndView userregisterpage(User user) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/register");
		return mv;
	}

	@RequestMapping("/userregisteraction.mw")
	public ModelAndView userregisteraction(User user) {
		
		ModelAndView mv = new ModelAndView();
		
		try {
			service.register(user);
			mv.setViewName("user/registerok");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("user/registerfail");
		}
		return mv; // user/list.jsp
	}
	
	
	
	@RequestMapping("/userlist.mw")
	public ModelAndView userlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		
		try {
			ArrayList<User> list = service.get();
			mv.addObject("list",list);
			mv.addObject("centerpage", "user/list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("centerpage", "user/listfail");
		}
		return mv; // user/list.jsp
	}
}
