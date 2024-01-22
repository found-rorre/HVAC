package com.spring.dto;

import java.sql.Date;

public class RentalDTO extends CarDTO {
	
	
	private int rental_idx;		// PK
	private int car_idx;		// FK
	private String id;			// FK
	private Date rentalDate;	// 빌린 날짜
	private Date dueDate;		// 반납 날짜
	private int cost;			// 랜탈 요금
	
	
	public int getRental_idx() {
		return rental_idx;
	}
	public void setRental_idx(int rental_idx) {
		this.rental_idx = rental_idx;
	}
	public int getCar_idx() {
		return car_idx;
	}
	public void setCar_idx(int car_idx) {
		this.car_idx = car_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
	@Override
	public String toString() {
		return "RentalDTO [rental_idx=" + rental_idx + ", car_idx=" + car_idx + ", id=" + id + ", rentalDate="
				+ rentalDate + ", dueDate=" + dueDate + ", cost=" + cost + "]";
	}
	
		
	
	
	
	
}
