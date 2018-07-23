package com.mw.vo;

public class User {
	private String id;
	private String name;
	private String password;
	private String phone;
	private String regdate;
	private String authority;

	public User(String id, String name, String password, String phone, String regdate, String authority) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.regdate = regdate;
		this.authority = authority;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "User{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", password='" + password + '\'' +
				", phone='" + phone + '\'' +
				", regdate='" + regdate + '\'' +
				", authority='" + authority + '\'' +
				'}';
	}
}





