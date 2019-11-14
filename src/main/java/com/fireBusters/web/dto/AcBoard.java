package com.fireBusters.web.dto;

public class AcBoard {
	private int fire_station_name;
	private int report_no;
	private String report_date;
	private double report_lat;
	private double report_lon;
	public int getFire_station_name() {
		return fire_station_name;
	}
	public void setFire_station_name(int fire_station_name) {
		this.fire_station_name = fire_station_name;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public double getReport_lat() {
		return report_lat;
	}
	public void setReport_lat(double report_lat) {
		this.report_lat = report_lat;
	}
	public double getReport_lon() {
		return report_lon;
	}
	public void setReport_lon(double report_lon) {
		this.report_lon = report_lon;
	}
	
	
}
