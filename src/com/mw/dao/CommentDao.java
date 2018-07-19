package com.mw.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mw.dao.mapper.CommentMapper;
import com.mw.dao.mapper.UserMapper;
import com.mw.frame.Dao;
import com.mw.vo.Comment;
import com.mw.vo.User;

@Repository("cdao")
public class CommentDao implements Dao<Comment, String>{

	@Autowired
	CommentMapper mapper;

	@Override
	public void insert(Comment t) throws Exception {
		mapper.insert(t);
	}

	@Override
	public void update(Comment t) throws Exception {
		mapper.update(t);
	}

	@Override
	public void delete(String v) throws Exception {
		mapper.delete(v);
	}

	@Override
	public Comment select(String v) throws Exception {
		return mapper.select(v);
	}

	@Override
	public ArrayList<Comment> select() throws Exception {
		return 	mapper.selectall();
	}
	
	public ArrayList<Comment> selectBySpot(String spotid) throws Exception {
		return mapper.selectBySpot(spotid);
	}	
}
