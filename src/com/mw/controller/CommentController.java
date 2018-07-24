package com.mw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public void regcomment(HttpServletRequest request, HttpServletResponse response)  {
		String id = request.getParameter("lng");
		Comment comment = new Comment();
		
		try {
			service.register(comment);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject jo = new JSONObject();
		jo.put("status", "success");
		
		try {
	    	response.setContentType("text/json; charset=EUC-KR");
			PrintWriter writer = response.getWriter(); 
			writer.print(jo);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 
		
	}
	
	@RequestMapping("/registercommentaction.mw")
	public void regcommentaction(HttpServletRequest request, HttpServletResponse response)  {
		Comment comment = new Comment();
		try {
			cservice.register(comment);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/getcomments.mw")
	public void getcomments(HttpServletRequest request, HttpServletResponse response)  {
		String id = request.getParameter("spotid");
		System.out.println("got spotid : " + id);
		
		
		try {
			Thread.sleep( 1000 );
		} catch (InterruptedException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		JSONArray ja = new JSONArray();
		try {
			/*for(Comment comment : comments) {
				JSONObject jo = new JSONObject();
			    jo.put("name", "a_value");
			    jo.put("lng", 235.1252);
			    jo.put("lat", 235.1252);
			    jo.put("img", "c_value");
			    ja.add(jo);	
			}*/
			
			JSONObject jo = new JSONObject();
			jo.put("userid", "id01");
		    jo.put("content", "i liked this place");
		    ja.add(jo);	
		    jo = new JSONObject();
		    jo.put("userid", "id±è¸»ÀÚ");
		    jo.put("content", "this place is not very nice");
		    ja.add(jo);	
		    jo = new JSONObject();
		    jo.put("userid", "id±èµÎÇÑ");
		    jo.put("content", "a_value");
		    ja.add(jo);	
		    
		    
		    
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
