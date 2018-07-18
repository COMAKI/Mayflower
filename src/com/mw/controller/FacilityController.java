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
public class ItemController {
	
	@Resource(name="iservice")
	Service<Facility, String> service;
	
	@RequestMapping("/additem.hw")
	public ModelAndView additem() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("centerpage", "item/add");
		return mv; // item/add.jsp
	}
	@RequestMapping("/additemimpl.hw")
	public ModelAndView additemimpl(Facility item) {
		MultipartFile mp = item.getImg();
		String imgname = mp.getOriginalFilename();
		item.setImgname(imgname);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		
		FileSave.save("C:\\Spring2\\smvc2\\web\\img\\", mp, imgname);
		
		try {
			// item 객체를 DB에 저장...
			System.out.println(item+" Inserted");
			service.register(item);
			mv.addObject("centerpage", "item/addok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mv.addObject("centerpage", "item/addfail");
		}
		
		return mv; // item/add.jsp
	}
	@RequestMapping("/listitem.hw")
	public ModelAndView listitem() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		ArrayList<Facility> list = null;
		try {
			list = service.get();
			System.out.println(list);
			mv.addObject("list",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("centerpage", "item/list");
		return mv; // item/add.jsp
	}
}
