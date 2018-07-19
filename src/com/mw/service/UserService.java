package com.mw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.mw.frame.Dao;
import com.mw.frame.Service;
import com.mw.vo.User;

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
		dao.update(t);
	}

	@Override
	public void remove(String v) throws Exception {
		dao.delete(v);
	}

	@Override
	public User get(String v) throws Exception {
		return dao.select(v);
	}

	@Override
	public ArrayList<User> get() throws Exception {
		return dao.select();
	}

}
