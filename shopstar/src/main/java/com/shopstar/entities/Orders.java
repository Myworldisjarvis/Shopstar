package com.shopstar.entities;

import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int order_id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private Timestamp order_date;
    private double total_amount;
    private String status;
    private String shipping_address;
    private String city;
    private String state;
    private String zip_code;
    
    
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public Orders(int order_id, User user, Timestamp order_date, double total_amount, String status,
			String shipping_address, String city, String state, String zip_code) {
		super();
		this.order_id = order_id;
		this.user = user;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.status = status;
		this.shipping_address = shipping_address;
		this.city = city;
		this.state = state;
		this.zip_code = zip_code;
	}
	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", user=" + user + ", order_date=" + order_date + ", total_amount="
				+ total_amount + ", status=" + status + ", shipping_address=" + shipping_address + ", city=" + city
				+ ", state=" + state + ", zip_code=" + zip_code + "]";
	}
	public Orders(User user, Timestamp order_date, double total_amount, String status, String shipping_address,
			String city, String state, String zip_code) {
		super();
		this.user = user;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.status = status;
		this.shipping_address = shipping_address;
		this.city = city;
		this.state = state;
		this.zip_code = zip_code;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

    // Getters and Setters
    
    
}
