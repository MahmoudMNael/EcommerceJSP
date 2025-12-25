package com.example.ecommercejsp.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Order {
	@JsonProperty("order_id")
	private Integer id;
	
	@JsonProperty(value = "customer_id", required = false)
	private Integer customerId;
	
	@JsonProperty("paid_amount")
	private Double paidAmount;
	
	@JsonProperty(value = "order_time", required = false)
	private Date createdAt;
	
	public Order() {
	}
	
	public Order(Integer id, Integer customerId, Double paidAmount, Date createdAt) {
		this.id = id;
		this.customerId = customerId;
		this.paidAmount = paidAmount;
		this.createdAt = createdAt;
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
	
	public static List<Order> listFromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode rootNode = mapper.readTree(json);
			if (rootNode.isObject() && rootNode.has("orders")) {
				return mapper.convertValue(rootNode.get("orders"), new TypeReference<List<Order>>() {});
			} else if (rootNode.isArray()) {
				return mapper.readValue(json, new TypeReference<List<Order>>() {});
			} else {
				return null;
			}
		} catch (IOException e) {
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
	
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	@Override
	public String toString() {
		return "Order{" +
				"id=" + id +
				", customerId=" + customerId +
				", paidAmount=" + paidAmount +
				", createdAt=" + createdAt +
				'}';
	}
}
