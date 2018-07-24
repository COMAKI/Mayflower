package com.mw.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.mw.dao.CommentDao;
import com.mw.frame.Dao;
import com.mw.frame.Service;
import com.mw.vo.Comment;

@org.springframework.stereotype.Service("cservice")
public class CommentService implements Service<Comment,String> {

	@Resource(name="cdao")
	Dao<Comment, String> dao;
	
	@Resource(name="cdao")
	CommentDao cdao;
	
	@Override
	public void register(Comment t) throws Exception {
		//dao.insert(t);
		System.out.println("register success");
	}

	@Override
	public void modify(Comment t) throws Exception {
		dao.update(t);
	}

	@Override
	public void remove(String v) throws Exception {
		dao.delete(v);
	}

	@Override
	public Comment get(String v) throws Exception {
		return dao.select(v);
	}

	@Override
	public ArrayList<Comment> get() throws Exception {
		return dao.select();
	}
	
	public ArrayList<Comment> getBySpot(String spotid) throws Exception {
		//return cdao.selectBySpot(spotid);
		ArrayList<Comment> list = new ArrayList<>();
		list.add(new Comment( //s id, s user_id, s spot_id, s content, s image_id, s regdate, dbl rating
					"123",
					"user01",
					"spot01",
					"i like it",
					"image01",
					"20011010",
					7
				));
		list.add(new Comment( //s id, s user_id, s spot_id, s content, s image_id, s regdate, dbl rating
				"1232",
				"user02",
				"spot01",
				"i don't care",
				"image01",
				"20011010",
				7
				));
		list.add(new Comment( //s id, s user_id, s spot_id, s content, s image_id, s regdate, dbl rating
				"1243",
				"user03",
				"spot01",
				"i hate it",
				"image01",
				"20011010",
				5
				));
		
		return list;
	}

}
