package com.mw.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mw.dao.mapper.SpotMapper;
import com.mw.frame.Dao;
import com.mw.vo.Weather;
import com.mw.vo.Weather;

@Repository("wdao")
public class WeatherDao implements Dao<Weather, String>{

	@Autowired
	SpotMapper mapper;
	
	@Override
	public void insert(Weather t) throws Exception {
		mapper.insert(t);
	}

	@Override
	public void update(Weather t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Weather select(String v) throws Exception {
		// TODO Auto-generated method stub
		return mapper.select(v);
	}

	@Override
	public ArrayList<Weather> select() throws Exception {
		return (ArrayList<Weather>) mapper.selectall();
	}

	
}
