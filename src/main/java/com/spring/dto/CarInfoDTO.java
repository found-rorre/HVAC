package com.spring.dto;

public class CarInfoDTO {
	
	private int carInfo_idx;
	private String maker;
	private String model;
	private String series;
	private String type;
	private String transmission;
	private String fuel;
	private String fuelRatio;
	private String image;
	private String seatCount;
	
	
	public int getCarInfo_idx() {
		return carInfo_idx;
	}
	public void setCarInfo_idx(int carInfo_idx) {
		this.carInfo_idx = carInfo_idx;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getModel() {
		return model;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTransmission() {
		return transmission;
	}
	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getFuelRatio() {
		return fuelRatio;
	}
	public void setFuelRatio(String fuelRatio) {
		this.fuelRatio = fuelRatio;
	}
	public String getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(String seatCount) {
		this.seatCount = seatCount;
	}
	@Override
	public String toString() {
		return "CarInfoDTO [carInfo_idx=" + carInfo_idx + ", maker=" + maker + ", model=" + model + ", series=" + series
				+ ", type=" + type + ", transmission=" + transmission + ", fuel=" + fuel + ", fuelRatio=" + fuelRatio
				+ ", image=" + image + ", seatCount=" + seatCount + "]";
	}
	

	
}
