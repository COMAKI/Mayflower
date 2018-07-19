package com.mw.dao.mapper;

import java.util.ArrayList;

import com.mw.vo.Comment;
import com.mw.vo.User;

public interface CommentMapper {
	public void insert(Comment obj);
	public void delete(String obj);
	public void update(Comment obj);
	public Comment select(String obj);
	public ArrayList<Comment> selectall();
	public ArrayList<Comment> selectBySpot(String obj);
}
