package com.example.ecommercejsp.services;

import com.example.ecommercejsp.PersistenceLayer;
import com.example.ecommercejsp.models.Customer;
import com.example.ecommercejsp.models.Order;
import com.example.ecommercejsp.models.Product;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

public class CustomerService {
	private static final String baseUrl = "http://localhost:5004/api/customers";
	
	public Customer getCustomerById(int customerId) {
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(baseUrl + "/" + customerId)).GET().build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String json = response.body();
				return Customer.fromJson(json);
			}
			return null;
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) {
				Thread.currentThread().interrupt();
			}
			return null;
		}
	}
	
	public List<Order> getCurrentCustomerOrders() {
		PersistenceLayer persistenceLayer = PersistenceLayer.getInstance();
		Customer currentCustomer = persistenceLayer.getCurrentCustomer();
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(baseUrl + "/" + currentCustomer.getId() + "/orders")).GET().build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String json = response.body();
				return Order.listFromJson(json);
			}
			return null;
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) {
				Thread.currentThread().interrupt();
			}
			return null;
		}
	}
	
	public void updateCustomerLoyaltyPoints(Order order) {
		PersistenceLayer persistenceLayer = PersistenceLayer.getInstance();
		Customer currentCustomer = persistenceLayer.getCurrentCustomer();
		
		int newPoints = (int) (order.getPaidAmount() * 0.25);
		int points = currentCustomer.getLoyaltyPoints() + newPoints;
		String payload = "{\"loyalty_points\":" + points + "}";
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(baseUrl + "/" + currentCustomer.getId() + "/loyalty")).header("Content-Type", "application/json")
				.PUT(HttpRequest.BodyPublishers.ofString(payload)).build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String body = response.body();
				
				return;
			}
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) Thread.currentThread().interrupt();
		}
		return;
	}
	
	public List<Customer> getAllCustomers() {
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(baseUrl)).GET().build();
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			int status = response.statusCode();
			if (status >= 200 && status < 300) {
				String json = response.body();
				return Customer.listFromJson(json);
			}
			return null;
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) {
				Thread.currentThread().interrupt();
			}
			return null;
		}
	}
}
