package com.example.ecommercejsp;

import com.example.ecommercejsp.models.Cart;

public class PersistenceLayer {
	private static volatile PersistenceLayer instance;
	private Cart cart;
	
	private PersistenceLayer() {
		this.cart = new Cart();
	}
	
	public static PersistenceLayer getInstance() {
		if (instance != null) {
			return instance;
		}
		synchronized (PersistenceLayer.class) {
			if (instance == null) {
				instance = new PersistenceLayer();
			}
		}
		return instance;
	}
	
	public Cart getCart() {
		return cart;
	}
	
	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
