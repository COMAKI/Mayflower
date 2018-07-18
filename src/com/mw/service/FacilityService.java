package com.mw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.mw.frame.Dao;
import com.mw.frame.Service;
import com.mw.vo.Facility;

@org.springframework.stereotype.Service("iservice")
public class FacilityService implements Service<Facility, String>{

	@Resource(name="idao")
	Dao<Facility,String> dao;
	
	@Override
	public void register(Facility t) throws Exception {
		dao.insert(t);
	}

	@Override
	public void modify(Facility t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Facility get(String v) throws Exception {
		// TODO Auto-generated method stub
		return  dao.select(v);
	}

	@Override
	public ArrayList<Facility> get() throws Exception {
		// TODO Auto-generated method stub
		return  dao.select();
	}

}
