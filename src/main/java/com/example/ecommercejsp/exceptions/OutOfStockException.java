package com.example.ecommercejsp.exceptions;

import com.example.ecommercejsp.models.Product;

public class OutOfStockException extends RuntimeException {
	private Product product;
	
	public OutOfStockException(String message, Product product) {
		super(message);
		this.product = product;
	}
}
