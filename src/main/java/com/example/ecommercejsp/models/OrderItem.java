package com.example.ecommercejsp.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderItem {
	@JsonProperty("product_id")
	private Integer productId;
	
	@JsonProperty("quantity")
	private Integer quantity;
	
	@JsonIgnore
	private Product product;
	
	public OrderItem() {
	}
	
	public OrderItem(Integer productId, Integer quantity) {
		this.productId = productId;
		this.quantity = quantity;
	}
	
	public Integer getProductId() {
		return productId;
	}
	
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "OrderItem{" +
				"productId=" + productId +
				", quantity=" + quantity +
				'}';
	}
}
