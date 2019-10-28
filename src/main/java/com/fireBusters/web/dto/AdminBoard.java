package com.fireBusters.web.dto;

import java.sql.Date;

public class AdminBoard {
	private String report_date;
	private double report_lat;
	private double report_lon;
	private String report_handle;
	private int fire_station_no;
	private int ano;
	
	
	
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
	public String getReport_handle() {
		return report_handle;
	}
	public void setReport_handle(String report_handle) {
		this.report_handle = report_handle;
	}
	public int getFire_station_no() {
		return fire_station_no;
	}
	public void setFire_station_no(int fire_station_no) {
		this.fire_station_no = fire_station_no;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	
	
}

