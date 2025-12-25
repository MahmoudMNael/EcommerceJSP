package com.example.ecommercejsp.services;

import com.example.ecommercejsp.models.Cart;
import com.example.ecommercejsp.models.CartItem;
import com.example.ecommercejsp.models.Order;
import com.example.ecommercejsp.models.OrderDetails;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

public class OrderService {
	private static final String baseUrl = "http://localhost:5001/api/orders";
	private static final InventoryService inventoryService = new InventoryService();
	
	public Order placeOrder(Cart cart, Integer customerId) {
		if (cart == null) return null;
		List<CartItem> items = cart.getItems();
		Double paidAmount = cart.getTotalPrice();
		if (items == null || items.isEmpty() || paidAmount == null) return null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("{\"customer_id\":").append(customerId).append(",\"products\":[");
		for (int i = 0; i < items.size(); i++) {
			CartItem cartItem = items.get(i);
			Integer productId = cartItem.getProduct().getId();
			int qty = cartItem.getQuantity();
			sb.append("{\"product_id\":").append(productId)
					.append(",\"quantity\":").append(qty).append("}");
			if (i < items.size() - 1) sb.append(",");
		}
		sb.append("],\"paid_amount\":").append(paidAmount).append("}");
		String payload = sb.toString();
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(baseUrl + "/create"))
				.header("Content-Type", "application/json")
				.POST(HttpRequest.BodyPublishers.ofString(payload))
				.build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String body = response.body();
				
				return Order.fromJson(body);
			}
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) Thread.currentThread().interrupt();
		}
		return null;
	}
	
	public OrderDetails getOrderDetails(Integer orderId) {
		if (orderId == null) return null;
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(baseUrl + "/" + orderId))
				.GET()
				.build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String body = response.body();
				
				OrderDetails orderDetailsList = OrderDetails.fromJson(body);
				
				orderDetailsList.getItems().forEach(item -> {
					item.setProduct(inventoryService.getProductById(item.getProductId()));
				});
				
				return orderDetailsList;
			}
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) Thread.currentThread().interrupt();
		}
		return null;
	}
}
