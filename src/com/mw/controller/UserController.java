package com.mw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mw.frame.Service;
import com.mw.vo.User;

@Controller
public class UserController {
	
	@Resource(name="uservice")
	Service<User, String> service;
	
	@RequestMapping("/loginaction.mw")
	@ResponseBody
	public void login(HttpServletRequest request, HttpServletResponse response) {
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		response.setContentType("text/json; charset=EUC-KR");
		
		JSONArray ja = new JSONArray();
		JSONObject jo = new JSONObject();
		User user = null;
		try {
			 user = service.get(email);
			 System.out.println(user);
			 if(email.equals(user.getId()) && pwd.equals(user.getPassword())) {
					HttpSession session = request.getSession();
					session.setAttribute("loginid", email);
					jo.put("status", "pass");
			 } else {
				 jo.put("status", "fail");
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jo.put("status", "fail");
		}
		try {
			ja.add(jo);
			PrintWriter out = response.getWriter();
			out.println(ja);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/logout.mw")
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
	@RequestMapping("/register.mw")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("centerpage", "register");
		return mv; // register.jsp
	}
	
	@RequestMapping("/loginimpl.mw")
	public ModelAndView loginimpl(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		User user = null;
		try {
			 user = service.get(id);
			 System.out.println(user);
			 if(id.equals(user.getId()) && pwd.equals(user.getPassword())) {
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
	public void userregisteraction(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String pwd = request.getParameter("pwd");
		String regdate = new Date().toString();
		String authority = Integer.toString(2); // 1: 관리자, 2: 일반 사용자
	
		response.setContentType("text/json; charset=EUC-KR");
		JSONArray ja = new JSONArray();
		PrintWriter out = null;
		User user = null; 
		System.out.printf("%s %s %s %s\n",email,name,phone, pwd);
		try {
			out = response.getWriter();
			user = new User(email, name, pwd, phone, regdate, authority);
			service.register(user);
			
			JSONObject jo = new JSONObject();
		    jo.put("email", email);
		    jo.put("name", name);
		    jo.put("phone", phone);
		    jo.put("regdate", regdate);
		    ja.add(jo);
		    out.print(ja);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
