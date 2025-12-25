package com.example.ecommercejsp.models;

import com.example.ecommercejsp.exceptions.OutOfStockException;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private final List<CartItem> items;
	private Double totalPrice;
	
	public Cart() {
		this.items = new ArrayList<>();
	}
	
	public List<CartItem> getItems() {
		return items;
	}
	
	public void addItem(Product product) {
		if (!containsProduct(product)) {
			CartItem newItem = new CartItem(product, 1);
			items.add(newItem);
		} else {
			incrementProductQuantity(product);
		}
	}
	
	public void removeItem(Product product) {
		decrementProductQuantity(product);
	}
	
	public void clearCart() {
		items.clear();
		totalPrice = null;
	}
	
	private Boolean containsProduct(Product product) {
		for (CartItem item : items) {
			if (item.getProduct().getId().equals(product.getId())) {
				return true;
			}
		}
		return false;
	}
	
	private void incrementProductQuantity(Product product) {
		for (CartItem item : items) {
			if (item.getProduct().getId().equals(product.getId())) {
				if (item.getQuantity() >= item.getProduct().getQuantityAvailable()) {
					throw new OutOfStockException("The item is out of stock!", item.getProduct());
				}
				item.setQuantity(item.getQuantity() + 1);
				return;
			}
		}
	}
	
	private void decrementProductQuantity(Product product) {
		for (CartItem item : items) {
			if (item.getProduct().getId().equals(product.getId())) {
				if (item.getQuantity() <= 1) {
					items.remove(item);
					return;
				}
				item.setQuantity(item.getQuantity() - 1);
				return;
			}
		}
	}
	
	public Double getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
