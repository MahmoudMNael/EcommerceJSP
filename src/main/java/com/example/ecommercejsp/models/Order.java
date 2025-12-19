package com.example.ecommercejsp.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Order {
	@JsonProperty("order_id")
	private Integer id;
	
	@JsonProperty("customer_id")
	private Integer customerId;
	
	@JsonProperty("paid_amount")
	private Double paidAmount;
	
	public Order() {
	}
	
	public Order(Integer id, Integer customerId, Double paidAmount) {
		this.id = id;
		this.customerId = customerId;
		this.paidAmount = paidAmount;
	}
	
	public static Order fromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, Order.class);
		} catch (IOException e) {
			System.out.println("Error deserializing Order from JSON: " + e.getMessage());
			return null;
		}
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getCustomerId() {
		return customerId;
	}
	
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	
	public Double getPaidAmount() {
		return paidAmount;
	}
	
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	
	@Override
	public String toString() {
		return "Order{" +
				"id=" + id +
				", customerId=" + customerId +
				", paidAmount=" + paidAmount +
				'}';
	}
}
