package com.spring.dto;


public class CarDTO extends CarInfoDTO {
	
	private int car_idx;
	private int carInfo_idx;
	private String carNumber;
	private String year;
	private int dayCost;
	private String status = "입고";		// 입고 출고 정비
	private int rentalCount;			// rental count
	
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
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getDayCost() {
		return dayCost;
	}
	public void setDayCost(int dayCost) {
		this.dayCost = dayCost;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getRentalCount() {
		return rentalCount;
	}
	public void setRentalCount(int rentalCount) {
		this.rentalCount = rentalCount;
	}
	@Override
	public String toString() {
		return "CarDTO [car_idx=" + car_idx + ", carInfo_idx=" + carInfo_idx + ", carNumber=" + carNumber + ", year="
				+ year + ", dayCost=" + dayCost + ", status=" + status + ", rentalCount=" + rentalCount + "]";
	}

	 
	
	
	
}
