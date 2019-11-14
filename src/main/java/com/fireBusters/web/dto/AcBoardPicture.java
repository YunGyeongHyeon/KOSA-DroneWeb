package com.fireBusters.web.dto;

public class AcBoardPicture {
	private int picture_no;
	private String picture_file;
	private int ano;
	private int fire_station_id;
	private String fire_station_name;
	private int fire_station_area_id;
	public int getPicture_no() {
		return picture_no;
	}
	public void setPicture_no(int picture_no) {
		this.picture_no = picture_no;
	}
	public String getPicture_file() {
		return picture_file;
	}
	public void setPicture_file(String picture_file) {
		this.picture_file = picture_file;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getFire_station_id() {
		return fire_station_id;
	}
	public void setFire_station_id(int fire_station_id) {
		this.fire_station_id = fire_station_id;
	}
	public String getFire_station_name() {
		return fire_station_name;
	}
	public void setFire_station_name(String fire_station_name) {
		this.fire_station_name = fire_station_name;
	}
	public int getFire_station_area_id() {
		return fire_station_area_id;
	}
	public void setFire_station_area_id(int fire_station_area_id) {
		this.fire_station_area_id = fire_station_area_id;
	}

	
}