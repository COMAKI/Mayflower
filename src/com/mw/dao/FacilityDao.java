package com.mw.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mw.dao.mapper.FacilityMapper;
import com.mw.frame.Dao;
import com.mw.vo.Facility;

@Repository("fdao")
public class FacilityDao implements Dao<Facility, String>{

	@Autowired
	FacilityMapper mapper;
	
	@Override
	public void insert(Facility t) throws Exception {
		mapper.insert(t);
	}

	@Override
	public void update(Facility t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Facility select(String v) throws Exception {
		// TODO Auto-generated method stub
		return mapper.select(v);
	}

	@Override
	public ArrayList<Facility> select() throws Exception {
		return (ArrayList<Facility>) mapper.selectall();
	}

	
}
