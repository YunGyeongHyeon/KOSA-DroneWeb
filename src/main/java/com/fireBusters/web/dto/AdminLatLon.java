package com.fireBusters.web.dto;

public class AdminLatLon {
	private int fire_station_id;
	private int fire_station_point;
	private double fire_lat;
	private double fire_lon;

	
	public int getFire_station_id() {
		return fire_station_id;
	}
	public void setFire_station_id(int fire_station_id) {
		this.fire_station_id = fire_station_id;
	}
	public int getFire_station_point() {
		return fire_station_point;
	}
	public void setFire_station_point(int fire_station_point) {
		this.fire_station_point = fire_station_point;
	}
	public double getFire_lat() {
		return fire_lat;
	}
	public void setFire_lat(double fire_lat) {
		this.fire_lat = fire_lat;
	}
	public double getFire_lon() {
		return fire_lon;
	}
	public void setFire_lon(double fire_lon) {
		this.fire_lon = fire_lon;
	}
	
}
