package com.hw.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hw.frame.Service;
import com.hw.util.FileSave;
import com.hw.vo.Item;
import com.hw.vo.User;

@Controller
public class UserController {
	
	@Resource(name="uservice")
	Service<User, String> service;
	
	@RequestMapping("/userlist.hw")
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
