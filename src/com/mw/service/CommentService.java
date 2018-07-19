package com.mw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.mw.frame.Dao;
import com.mw.frame.Service;
import com.mw.vo.Comment;

@org.springframework.stereotype.Service("cservice")
public class CommentService implements Service<Comment,String> {

	@Resource(name="cdao")
	Dao<Comment, String> dao;
	
	
	@Override
	public void register(Comment t) throws Exception {
		dao.insert(t);
	}

	@Override
	public void modify(Comment t) throws Exception {
		dao.update(t);
	}

	@Override
	public void remove(String v) throws Exception {
		dao.delete(v);
	}

	@Override
	public Comment get(String v) throws Exception {
		return dao.select(v);
	}

	@Override
	public ArrayList<Comment> get() throws Exception {
		return dao.select();
	}
	
	public ArrayList<Comment> getBySpot(String spotid) throws Exception {
		return dao.selectBySpot(spotid);
	}

}
