package com.shopstar.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryID;
	private String categoryTital;
	private String categoryDescription;
	
	@OneToMany(mappedBy = "category")
	private List<Product> product = new ArrayList<Product>();
	
	
	
	
	public Category(String categoryTital, String categoryDescription, List<Product> product) {
		super();
		this.categoryID = categoryID;
		this.categoryTital = categoryTital;
		this.categoryDescription = categoryDescription;
		this.product = product;
	}
	
	
	public List<Product> getProduct() {
		return product;
	}


	public void setProduct(List<Product> product) {
		this.product = product;
	}


	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getCategoryTital() {
		return categoryTital;
	}
	public void setCategoryTital(String categoryTital) {
		this.categoryTital = categoryTital;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	public Category(int categoryID, String categoryTital, String categoryDescription) {
		super();
		this.categoryID = categoryID;
		this.categoryTital = categoryTital;
		this.categoryDescription = categoryDescription;
	}
	public Category(String categoryTital, String categoryDescription) {
		super();
		this.categoryTital = categoryTital;
		this.categoryDescription = categoryDescription;
	}
	public Category() {
		
	}
	@Override
	public String toString() {
		return "Category [categoryID=" + categoryID + ", categoryTital=" + categoryTital + ", categoryDescription="
				+ categoryDescription + "]";
	}
	
	
	
	
}
