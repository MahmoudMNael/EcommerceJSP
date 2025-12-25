package com.example.ecommercejsp;

import com.example.ecommercejsp.exceptions.OutOfStockException;
import com.example.ecommercejsp.models.Cart;
import com.example.ecommercejsp.models.Product;
import com.example.ecommercejsp.services.PricingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private PersistenceLayer persistenceLayer;
	private PricingService pricingService;
	
	@Override
	public void init() throws ServletException {
		persistenceLayer = PersistenceLayer.getInstance();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=UTF-8");
		
		// Read request body
		StringBuilder sb = new StringBuilder();
		try (BufferedReader reader = req.getReader()) {
			String line;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Unable to read request body\"}");
			}
			return;
		}
		
		String json = sb.toString();
		if (json.isBlank()) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Empty request body\"}");
			}
			return;
		}
		
		// Parse Product from JSON
		Product product = Product.fromJson(json);
		if (product == null) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Invalid product JSON\"}");
			}
			return;
		}
		
		// Add to cart
		Cart cart = persistenceLayer.getCart();
		try {
			cart.addItem(product);
		} catch (OutOfStockException e) {
			resp.sendError(HttpServletResponse.SC_CONFLICT, e.getMessage());
			return;
		}
		
		// Success response
		resp.setStatus(HttpServletResponse.SC_CREATED);
		try (PrintWriter out = resp.getWriter()) {
			out.print("{\"status\":\"ok\"}");
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=UTF-8");
		
		// Read request body
		StringBuilder sb = new StringBuilder();
		try (BufferedReader reader = req.getReader()) {
			String line;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Unable to read request body\"}");
			}
			return;
		}
		
		String json = sb.toString();
		if (json.isBlank()) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Empty request body\"}");
			}
			return;
		}
		
		// Parse Product from JSON
		Product product = Product.fromJson(json);
		if (product == null) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Invalid product JSON\"}");
			}
			return;
		}
		
		// Remove from cart
		Cart cart = persistenceLayer.getCart();
		cart.removeItem(product);
		
		// Success response
		resp.setStatus(HttpServletResponse.SC_OK);
		try (PrintWriter out = resp.getWriter()) {
			out.print("{\"status\":\"ok\"}");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cart cart = persistenceLayer.getCart();
		pricingService = new PricingService();
		Double total = pricingService.calculateCartTotal(cart);
		cart.setTotalPrice(total);
		
		req.setAttribute("cartItems", cart.getItems());
		req.setAttribute("totalPrice", total);
		
		req.getRequestDispatcher("/checkout.jsp").forward(req, resp);
	}
}
