package com.mw.vo;

public class Lnglat {

	private double startLng;
	private double startLat;
	private double endtLat;
	private double endtLng;
	public Lnglat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Lnglat(double startLng, double startLat, double endtLat, double endtLng) {
		super();
		this.startLng = startLng;
		this.startLat = startLat;
		this.endtLat = endtLat;
		this.endtLng = endtLng;
	}
	public double getStartLng() {
		return startLng;
	}
	public void setStartLng(double startLng) {
		this.startLng = startLng;
	}
	public double getStartLat() {
		return startLat;
	}
	public void setStartLat(double startLat) {
		this.startLat = startLat;
	}
	public double getEndtLat() {
		return endtLat;
	}
	public void setEndtLat(double endtLat) {
		this.endtLat = endtLat;
	}
	public double getEndtLng() {
		return endtLng;
	}
	public void setEndtLng(double endtLng) {
		this.endtLng = endtLng;
	}
	
	@Override
	public String toString() {
		return "Lnglat [startLng=" + startLng + ", startLat=" + startLat + ", endtLat=" + endtLat + ", endtLng="
				+ endtLng + "]";
	}
	
	
	
}
