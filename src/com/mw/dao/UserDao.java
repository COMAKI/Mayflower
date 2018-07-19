package com.mw.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mw.dao.mapper.UserMapper;
import com.mw.frame.Dao;
import com.mw.vo.User;

@Repository("udao")
public class UserDao implements Dao<User, String>{

	@Autowired
	UserMapper mapper;
	
	@Override
	public void insert(User t) throws Exception {
		mapper.insert(t);
	}

	@Override
	public void update(User t) throws Exception {
		
	}

	@Override
	public void delete(String v) throws Exception {
		
	}

	@Override
	public User select(String v) throws Exception {
		return mapper.select(v);
	}

	@Override
	public ArrayList<User> select() throws Exception {
		return (ArrayList<User>) mapper.selectall();
	}

	
}
