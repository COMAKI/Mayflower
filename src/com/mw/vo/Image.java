package com.mw.vo;

public class Image {
	String id;
	String name;
	String filepath;
	String user_id;
	String regdate;

	public Image() {
	}

	public Image(String id, String name, String filepath, String user_id, String regdate) {
		this.id = id;
		this.name = name;
		this.filepath = filepath;
		this.user_id = user_id;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getFilepath() {
		return filepath;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Images{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", filepath='" + filepath + '\'' +
				", user_id='" + user_id + '\'' +
				", regdate='" + regdate + '\'' +
				'}';
	}
}
