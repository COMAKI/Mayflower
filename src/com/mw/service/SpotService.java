package com.mw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.mw.dao.SpotDao;
import com.mw.frame.Dao;
import com.mw.frame.Service;
import com.mw.vo.Lnglat;
import com.mw.vo.Spot;

@org.springframework.stereotype.Service("iservice")
public class SpotService implements Service<Spot, String>{

	@Resource(name="sdao")
	Dao<Spot,String> dao;

	@Resource(name="sdao")
	SpotDao sdao;
	
	@Override
	public void register(Spot t) throws Exception {
		dao.insert(t);
	}

	@Override
	public void modify(Spot t) throws Exception {
		dao.update(t);
	}

	@Override
	public void remove(String v) throws Exception {
		dao.delete(v);
	}

	@Override
	public Spot get(String v) throws Exception {
		return  dao.select(v);
	}

	@Override
	public ArrayList<Spot> get() throws Exception {
		return  dao.select();
	}
	
	public ArrayList<Spot> getByLnglat(Lnglat obj) throws Exception {
		return  sdao.selectBylnglat(obj);
	}
}
