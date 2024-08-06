package com.shopstar.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ManyToAny;
@Entity
public class Product {
 
@Id	
@GeneratedValue(strategy = GenerationType.IDENTITY )
private int pId;
 private String pName;
 @Column(length = 3000)
 private String pDisc;
 private int pPrice;
 private int pdiscount;
 private int pQuantity;
 private String pPhoto;
 
@ManyToOne
 private Category category;
 
 


public String getpPhoto() {
	return pPhoto;
}
public void setpPhoto(String pPhoto) {
	this.pPhoto = pPhoto;
}
 
 
 
public Product(int pId, String pName, String pDisc, int pPrice, int pdiscount, int pQuantity) {
	super();
	this.pId = pId;
	this.pName = pName;
	this.pDisc = pDisc;
	this.pPrice = pPrice;
	this.pdiscount = pdiscount;
	this.pQuantity = pQuantity;
}
public Product(String pName, String pDisc, int pPrice, int pdiscount, int pQuantity , Category category , String pPhoto) {
	super();
	this.pName = pName;
	this.pDisc = pDisc;
	this.pPrice = pPrice;
	this.pdiscount = pdiscount;
	this.pQuantity = pQuantity;
	this.category = category;
	this.pPhoto = pPhoto;
}
public Category getCategory() {
	return category;
}
public void setCategory(Category category) {
	this.category = category;
}
public int getpId() {
	return pId;
}
public void setpId(int pId) {
	this.pId = pId;
}
public String getpName() {
	return pName;
}
public void setpName(String pName) {
	this.pName = pName;
}
public String getpDisc() {
	return pDisc;
}
public void setpDisc(String pDisc) {
	this.pDisc = pDisc;
}
public int getpPrice() {
	return pPrice;
}
public void setpPrice(int pPrice) {
	this.pPrice = pPrice;
}
public int getPdiscount() {
	return pdiscount;
}
public void setPdiscount(int pdiscount) {
	this.pdiscount = pdiscount;
}
public int getpQuantity() {
	return pQuantity;
}
public void setpQuantity(int pQuantity) {
	this.pQuantity = pQuantity;
}
@Override
public String toString() {
	return "Product [pId=" + pId + ", pName=" + pName + ", pDisc=" + pDisc + ", pPrice=" + pPrice + ", pdiscount="
			+ pdiscount + ", pQuantity=" + pQuantity + "]";
}
public Product() {
	super();
}
 
// calculate  price after discount

public int getPriceAfterApplyingDiscount() {
	int d = (int) ((this.getPdiscount() / 100.0) * this.getpPrice());		
	return this.getpPrice()-d;
}
 
 
}
