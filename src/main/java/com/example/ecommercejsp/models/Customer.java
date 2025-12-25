package com.example.ecommercejsp.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Customer {
	@JsonProperty("customer_id")
	private Integer id;
	
	@JsonProperty("name")
	private String name;
	
	@JsonProperty("email")
	private String email;
	
	@JsonProperty("phone")
	private String phone;
	
	@JsonProperty("loyalty_points")
	private Integer loyaltyPoints;
	
	public Customer() {
	}
	
	public Customer(Integer id, String name, String email, String phone, Integer loyaltyPoints) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.loyaltyPoints = loyaltyPoints;
	}
	
	public static Customer fromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, Customer.class);
		} catch (IOException e) {
			System.out.println("Error deserializing Order from JSON: " + e.getMessage());
			return null;
		}
	}
	
	public static List<Customer> listFromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json,  new TypeReference<List<Customer>>() {});
		} catch (IOException e) {
			System.out.println("Error deserializing Customer list from JSON: " + e.getMessage());
			return null;
		}
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Integer getLoyaltyPoints() {
		return loyaltyPoints;
	}
	
	public void setLoyaltyPoints(Integer loyaltyPoints) {
		this.loyaltyPoints = loyaltyPoints;
	}
	
	@Override
	public String toString() {
		return "Customer{" +
				"id=" + id +
				", name='" + name + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", loyaltyPoints=" + loyaltyPoints +
				'}';
	}
}
