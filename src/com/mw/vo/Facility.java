package com.mw.vo;

import org.springframework.web.multipart.MultipartFile;

public class Facility {
	private String id;
	private String name;
	private int price;
	String imgname;
	MultipartFile img;
	
	public Facility() {
		
	}

	public Facility(String id, String name, int price, String imgname) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.imgname = imgname;
	}

	public Facility(String id, String name, int price, String imgname, MultipartFile img) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.imgname = imgname;
		this.img = img;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", price=" + price + ", imgname=" + imgname + ", img=" + img + "]";
	}
	
	
	
}





