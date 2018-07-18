package com.hw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.hw.frame.Dao;
import com.hw.frame.Service;
import com.hw.vo.Item;

@org.springframework.stereotype.Service("iservice")
public class ItemService implements Service<Item, String>{

	@Resource(name="idao")
	Dao<Item,String> dao;
	
	@Override
	public void register(Item t) throws Exception {
		dao.insert(t);
	}

	@Override
	public void modify(Item t) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Item get(String v) throws Exception {
		// TODO Auto-generated method stub
		return  dao.select(v);
	}

	@Override
	public ArrayList<Item> get() throws Exception {
		// TODO Auto-generated method stub
		return  dao.select();
	}

}
