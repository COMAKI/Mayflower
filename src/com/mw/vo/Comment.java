package com.mw.vo;

public class Comment {

	private String id;
	private String user_id;
	private String spot_id;
	private String content;
	private String image_id;
	private String regdate;
	private double rating;

	public Comment() {
	}

	public Comment(String id, String user_id, String spot_id, String content, String image_id, String regdate,
	               double rating) {
		this.id = id;
		this.user_id = user_id;
		this.spot_id = spot_id;
		this.content = content;
		this.image_id = image_id;
		this.regdate = regdate;
		this.rating = rating;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSpot_id() {
		return spot_id;
	}

	public void setSpot_id(String spot_id) {
		this.spot_id = spot_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage_id() {
		return image_id;
	}

	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Comment{" + "id='" + id + '\'' + ", user_id='" + user_id + '\'' + ", spot_id='" + spot_id + '\''
				+ ", content='" + content + '\'' + ", image_id='" + image_id + '\'' + ", regdate='" + regdate + '\''
				+ ", rating=" + rating + '}';
	}
};
