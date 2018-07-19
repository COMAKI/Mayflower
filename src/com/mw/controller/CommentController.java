package com.mw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mw.frame.Service;
import com.mw.vo.Comment;

public class CommentController {

	

	@Resource(name="cservice")
	Service<Comment, String> cservice;
	
	@RequestMapping("/getcomments.hw")
	public void getcomments(HttpServletRequest request, HttpServletResponse response)  {
		double id = Double.parseDouble(request.getParameter("lng"));
		
		JSONArray ja = new JSONArray();
	    
		try {
			List<Comment> comments = cservice.get();
			
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
	
	
}
