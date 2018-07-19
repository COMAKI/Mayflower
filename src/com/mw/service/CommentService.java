package com.mw.service;

import java.util.ArrayList;

import com.mw.frame.Service;
import com.mw.vo.Comment;

@org.springframework.stereotype.Service("cservice")
public class CommentService implements Service<Comment,String> {

	@Override
	public void register(Comment t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Comment t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Comment get(String v) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Comment> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
