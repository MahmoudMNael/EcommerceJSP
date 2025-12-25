package com.example.ecommercejsp;

import java.io.*;
import java.util.Collections;
import java.util.List;

import com.example.ecommercejsp.models.Customer;
import com.example.ecommercejsp.models.Product;
import com.example.ecommercejsp.services.CustomerService;
import com.example.ecommercejsp.services.InventoryService;
import com.example.ecommercejsp.services.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("")
public class ProductCatalogServlet extends HttpServlet {
	private InventoryService inventoryService;
	private List<Product> products;
	
	public void init() {
		inventoryService = new InventoryService();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		products = inventoryService.getAllProducts();
		if (products == null) {
			products = Collections.emptyList();
		}
		
		List<Product> productsInStock = products.stream()
				.filter(product -> product.getQuantityAvailable() > 0)
				.toList();
		request.setAttribute("products", productsInStock);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	public void destroy() {
	}
}