package com.mw.vo;

import org.springframework.web.multipart.MultipartFile;

public class Spot {
	/* NEED TO INPUT CORRECT VALUES AND METHODS */
	private String id;
	private double lng;
	private double lat;
	private String category;
		
	@Override
	public String toString() {
		return "Spot [id=" + id + ", lng=" + lng + ", lat=" + lat + ", category=" + category + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Spot() {
		
	}


	
}





