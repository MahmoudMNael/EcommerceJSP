package com.example.ecommercejsp.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Product {
	@JsonProperty("product_id")
	private Integer id;
	
	@JsonProperty("product_name")
	private String name;
	
	@JsonProperty("quantity_available")
	private Integer quantityAvailable;
	
	@JsonProperty("unit_price")
	private Double price;
	
	public Product() {
	}
	
	public Product(Integer id, String name, Integer quantityAvailable, Double price) {
		this.id = id;
		this.name = name;
		this.quantityAvailable = quantityAvailable;
		this.price = price;
	}
	
	public static Product fromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, Product.class);
		} catch (IOException e) {
			System.out.println("Error deserializing Product from JSON: " + e.getMessage());
			return null;
		}
	}
	
	public static List<Product> listFromJson(String json) {
		if (json == null || json.isBlank()) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, new TypeReference<List<Product>>() {});
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
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getQuantityAvailable() {
		return quantityAvailable;
	}
	
	public void setQuantityAvailable(Integer quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}
	
	public Double getPrice() {
		return price;
	}
	
	public void setPrice(Double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", name='" + name + '\'' +
				", quantityAvailable=" + quantityAvailable +
				", price=" + price +
				'}';
	}
}
