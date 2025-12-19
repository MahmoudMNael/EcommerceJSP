package com.example.ecommercejsp.services;

import com.example.ecommercejsp.models.Cart;
import com.example.ecommercejsp.models.CartItem;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PricingService {
	private static final String baseUrl = "http://localhost:5003/api/pricing";
	
	public Double calculateCartTotal(Cart cart) {
		if (cart == null) return null;
		
		// Build JSON payload: { "products":[{"product_id":1,"quantity":4}, ...] }
		StringBuilder sb = new StringBuilder();
		sb.append("{\"products\":[");
		List<CartItem> items = cart.getItems();
		for (int i = 0; i < items.size(); i++) {
			CartItem item = items.get(i);
			Integer productId = item.getProduct().getId();
			int qty = item.getQuantity();
			sb.append("{\"product_id\":").append(productId).append(",\"quantity\":").append(qty).append("}");
			if (i < items.size() - 1) sb.append(",");
		}
		sb.append("]}");
		String payload = sb.toString();
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(baseUrl + "/calculate")).header("Content-Type", "application/json").POST(HttpRequest.BodyPublishers.ofString(payload)).build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String body = response.body();
				// extract a decimal or integer value from "total" field
				Pattern p = Pattern.compile("\"total_price\"\\s*:\\s*([0-9]+(?:\\.[0-9]+)?)");
				Matcher m = p.matcher(body);
				if (m.find()) {
					return Double.valueOf(m.group(1));
				}
				// fallback: find any number
				p = Pattern.compile("([0-9]+(?:\\.[0-9]+)?)");
				m = p.matcher(body);
				if (m.find()) return Double.valueOf(m.group(1));
			}
			return null;
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) Thread.currentThread().interrupt();
			return null;
		}
	}
}
