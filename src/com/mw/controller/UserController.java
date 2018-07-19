package com.mw.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mw.frame.Service;
import com.mw.vo.User;

@Controller
public class UserController {
	
	@Resource(name="uservice")
	Service<User, String> service;
	
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
