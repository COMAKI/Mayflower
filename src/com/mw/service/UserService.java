package com.hw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.hw.frame.Dao;
import com.hw.frame.Service;
import com.hw.vo.User;

@org.springframework.stereotype.Service("uservice")
public class UserService implements Service<User, String>{

	@Resource(name="udao")
	Dao<User,String> dao;
	
	@Override
	public void register(User t) throws Exception {
		dao.insert(t);
	}

	@Override
	public void modify(User t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User get(String v) throws Exception {
		// TODO Auto-generated method stub
		return dao.select(v);
	}

	@Override
	public ArrayList<User> get() throws Exception {
		// TODO Auto-generated method stub
		return dao.select();
	}

}
