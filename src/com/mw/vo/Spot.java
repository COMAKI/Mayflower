package com.mw.vo;

public class Spot {
	/* NEED TO INPUT CORRECT VALUES AND METHODS */
	private String id;
	private String name;
	private String category_id;
	private String subcategory_id;
	private String image_id;
	private String address1;
	private String address2;
	private String ophour;
	private String phone;
	private double lng;
	private double lat;
	private String regdate;
	private String lastdate;
	private String user_id;
	private String properties;
	private String avg_rating;

	public Spot(){};

	public Spot(String id, String name, String category_id, String subcategory_id, String image_id, String address1, String address2, String ophour, String phone, double lng, double lat, String regdate, String lastdate, String user_id, String properties, String avg_rating) {
		this.id = id;
		this.name = name;
		this.category_id = category_id;
		this.subcategory_id = subcategory_id;
		this.image_id = image_id;
		this.address1 = address1;
		this.address2 = address2;
		this.ophour = ophour;
		this.phone = phone;
		this.lng = lng;
		this.lat = lat;
		this.regdate = regdate;
		this.lastdate = lastdate;
		this.user_id = user_id;
		this.properties = properties;
		this.avg_rating = avg_rating;
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

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getSubcategory_id() {
		return subcategory_id;
	}

	public void setSubcategory_id(String subcategory_id) {
		this.subcategory_id = subcategory_id;
	}

	public String getImage_id() {
		return image_id;
	}

	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getOphour() {
		return ophour;
	}

	public void setOphour(String ophour) {
		this.ophour = ophour;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLastdate() {
		return lastdate;
	}

	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProperties() {
		return properties;
	}

	public void setProperties(String properties) {
		this.properties = properties;
	}

	public String getAvg_rating() {
		return avg_rating;
	}

	public void setAvg_rating(String avg_rating) {
		this.avg_rating = avg_rating;
	}

	@Override
	public String toString() {
		return "SpotVO{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", category_id='" + category_id + '\'' +
				", subcategory_id='" + subcategory_id + '\'' +
				", image_id='" + image_id + '\'' +
				", address1='" + address1 + '\'' +
				", address2='" + address2 + '\'' +
				", ophour='" + ophour + '\'' +
				", phone='" + phone + '\'' +
				", lng='" + lng + '\'' +
				", lat='" + lat + '\'' +
				", regdate='" + regdate + '\'' +
				", lastdate='" + lastdate + '\'' +
				", user_id='" + user_id + '\'' +
				", properties='" + properties + '\'' +
				", avg_rating='" + avg_rating + '\'' +
				'}';
	}
}





