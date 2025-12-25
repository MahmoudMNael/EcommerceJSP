package com.example.ecommercejsp.models;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonUnwrapped;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderDetails {
	@JsonUnwrapped
	private Order order;
	
	@JsonProperty("products")
	private List<OrderItem> items;
	
	public OrderDetails() {}
	
	public OrderDetails(Order order, List<OrderItem> items) {
		this.order = order;
		this.items = items;
	}
	
	public static OrderDetails fromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, OrderDetails.class);
		} catch (IOException e) {
			System.out.println("Error deserializing OrderDetails from JSON: " + e.getMessage());
			return null;
		}
	}
	
	public Order getOrder() {
		return order;
	}
	
	public void setOrder(Order order) {
		this.order = order;
	}
	
	public List<OrderItem> getItems() {
		return items;
	}
	
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	
	@Override
	public String toString() {
		return "OrderDetails{" +
				"order=" + order.toString() +
				", items=" + items.toString() +
				'}';
	}
}
