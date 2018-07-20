package com.mw.dao.mapper;

import java.util.ArrayList;

import com.mw.vo.Lnglat;
import com.mw.vo.Spot;

public interface SpotMapper {
	public void insert(Spot obj);
	public void delete(String obj);
	public void update(Spot obj);
	public Spot select(String obj);
	public ArrayList<Spot> selectall();
	public ArrayList<Spot> selectBylnglat(Lnglat obj);
}
