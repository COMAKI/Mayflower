package com.mw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mw.frame.Service;
import com.mw.service.CommentService;
import com.mw.vo.Comment;

@Controller
public class CommentController {

	

	@Resource(name="cservice")
	Service<Comment, String> service;
	
	@Resource(name="cservice")
	CommentService cservice;
	
	
	@RequestMapping("/registercomment.mw")
	public void regcommentaction(HttpServletRequest request, HttpServletResponse response)  {
		
		JSONObject jo = new JSONObject();
	    
	        
		try {
			Comment comment = new Comment();
			comment.setContent(request.getParameter("content"));
			comment.setContent(request.getParameter("rating"));
			HttpSession session = request.getSession();
			//comment.setUser_id(session.getAttribute("loginid").toString());
			System.out.println("registering comment with content : " + request.getParameter("content"));
			
			service.register(comment);
			
			jo.put("status", "success");
		    
		} catch (Exception e) {
			jo.put("status", "fail");
			e.printStackTrace();
		}
	
	    try {
	    	response.setContentType("text/json; charset=EUC-KR");
			PrintWriter writer = response.getWriter(); 
			writer.print(jo);
    	} catch (IOException e) {
    		e.printStackTrace();
    	} 
	}
	
	
	@RequestMapping("/getcomments.mw")
	public void getcomments(HttpServletRequest request, HttpServletResponse response)  {
		String spotid = request.getParameter("spotid");
		System.out.println("got spotid : " + spotid);
		
		
		try {
			Thread.sleep( 1000 );
		} catch (InterruptedException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		JSONArray ja = new JSONArray();
		try {
			List<Comment> comments = cservice.getBySpot(spotid);
			
			for(Comment comment : comments) {
				JSONObject jo = new JSONObject();
			    jo.put("userid", comment.getUser_id());
			    jo.put("content", comment.getContent());
			    jo.put("rating", comment.getRating());
			    ja.add(jo);	
			}
			
			    
		    
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			    
	    try {
	    	response.setContentType("text/json; charset=EUC-KR");
			PrintWriter writer = response.getWriter(); 
			writer.print(ja);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 
	}
	
	@RequestMapping("/updatecomments.mw")
	public void updatecomments(HttpServletRequest request, HttpServletResponse response)  {
		double id = Double.parseDouble(request.getParameter("lng"));
		
		JSONArray ja = new JSONArray();
	    
		try {
			List<Comment> comments = service.get();
			
			for(Comment comment : comments) {
				JSONObject jo = new JSONObject();
			    jo.put("name", "a_value");
			    jo.put("lng", 235.1252);
			    jo.put("lat", 235.1252);
			    jo.put("img", "c_value");
			    ja.add(jo);	
			}
		    
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			    
	    try {
	    	response.setContentType("text/json; charset=EUC-KR");
			PrintWriter writer = response.getWriter(); 
			writer.print(ja);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 
	}
	

	@RequestMapping("/deletecomment.mw")
	public void delcomment(HttpServletRequest request)  {
		String id = request.getParameter("lng");
		
		try {
			service.remove(id);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			    
	    
	}
	
}
