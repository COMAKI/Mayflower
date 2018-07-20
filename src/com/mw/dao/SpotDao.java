package com.mw.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mw.dao.mapper.SpotMapper;
import com.mw.frame.Dao;
import com.mw.vo.Lnglat;
import com.mw.vo.Spot;

@Repository("sdao")
public class SpotDao implements Dao<Spot, String>{

	@Autowired
	SpotMapper mapper;
	
	@Override
	public void insert(Spot t) throws Exception {
		mapper.insert(t);
	}

	@Override
	public void update(Spot t) throws Exception {
		mapper.update(t);
	}

	@Override
	public void delete(String v) throws Exception {
		
	}

	@Override
	public Spot select(String v) throws Exception {
		return mapper.select(v);
	}

	@Override
	public ArrayList<Spot> select() throws Exception {
		return (ArrayList<Spot>) mapper.selectall();
	}

	public ArrayList<Spot> selectBylnglat(Lnglat obj) throws Exception {
		return (ArrayList<Spot>) mapper.selectBylnglat(obj);
	}
}
