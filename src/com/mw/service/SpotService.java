package com.mw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.mw.frame.Dao;
import com.mw.frame.Service;
import com.mw.vo.Spot;

@org.springframework.stereotype.Service("iservice")
public class SpotService implements Service<Spot, String>{

	@Resource(name="sdao")
	Dao<Spot,String> dao;
	
	@Override
	public void register(Spot t) throws Exception {
		dao.insert(t);
	}

	@Override
	public void modify(Spot t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Spot get(String v) throws Exception {
		// TODO Auto-generated method stub
		return  dao.select(v);
	}

	@Override
	public ArrayList<Spot> get() throws Exception {
		// TODO Auto-generated method stub
		return  dao.select();
	}

}
