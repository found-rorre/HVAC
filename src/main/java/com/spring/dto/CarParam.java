package com.spring.dto;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class CarParam {
	
	private int car_idx;
	private int carInfo_idx;
	private List<String> maker;
	private List<String> model;
	private List<String> series;
	private List<String> type;
	private List<String> transmission;
	private List<String> fuel;
	private List<String> fuelRatio;
	private List<String> seatCount;		// '5인승이하', '5인승초과'
	
	//랜탈 DTO
	private Date rentalDate;	// 빌린 날짜
	private Date dueDate;		// 반납 날짜
	
	private String rentalDateStr;
	private String dueDateStr;
	
	public int getCar_idx() {
		return car_idx;
	}
	public void setCar_idx(int car_idx) {
		this.car_idx = car_idx;
	}
	public int getCarInfo_idx() {
		return carInfo_idx;
	}
	public void setCarInfo_idx(int carInfo_idx) {
		this.carInfo_idx = carInfo_idx;
	}
	public List<String> getMaker() {
		return maker;
	}
	public void setMaker(List<String> maker) {
		this.maker = maker;
	}
	public List<String> getModel() {
		return model;
	}
	public void setModel(List<String> model) {
		this.model = model;
	}
	public List<String> getSeries() {
		return series;
	}
	public void setSeries(List<String> series) {
		this.series = series;
	}
	public List<String> getType() {
		return type;
	}
	public void setType(List<String> type) {
		this.type = type;
	}
	public List<String> getTransmission() {
		return transmission;
	}
	public void setTransmission(List<String> transmission) {
		this.transmission = transmission;
	}
	public List<String> getFuel() {
		return fuel;
	}
	public void setFuel(List<String> fuel) {
		this.fuel = fuel;
	}
	public List<String> getFuelRatio() {
		return fuelRatio;
	}
	public void setFuelRatio(List<String> fuelRatio) {
		this.fuelRatio = fuelRatio;
	}
	public List<String> getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(List<String> seatCount) {
		this.seatCount = seatCount;
	}
	public Date getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(Date rentalDate) {
		this.rentalDate = rentalDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	
	public String getRentalDateStr() {
		return rentalDateStr;
	}
	public void setRentalDateStr(String rentalDateStr) {
		this.rentalDateStr = rentalDateStr;
	}
	public String getDueDateStr() {
		return dueDateStr;
	}
	public void setDueDateStr(String dueDateStr) {
		this.dueDateStr = dueDateStr;
	}
	@Override
	public String toString() {
		return "CarParam [car_idx=" + car_idx + ", carInfo_idx=" + carInfo_idx + ", maker=" + maker + ", model=" + model
				+ ", series=" + series + ", type=" + type + ", transmission=" + transmission + ", fuel=" + fuel
				+ ", fuelRatio=" + fuelRatio + ", seatCount=" + seatCount + ", rentalDate=" + rentalDate + ", dueDate="
				+ dueDate + ", rentalDateStr=" + rentalDateStr + ", dueDateStr=" + dueDateStr + "]";
	}
	public void dateFormat() {

		String dueDateStr = this.getDueDateStr();
		String rentalDateStr = this.getRentalDateStr();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			this.setDueDate(sdf.parse(dueDateStr));
			this.setRentalDate(sdf.parse(rentalDateStr));
		} catch (ParseException e) {}
	}
	
	
	
	
	
	
	
}
