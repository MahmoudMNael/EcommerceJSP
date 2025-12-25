package com.example.ecommercejsp;

import com.example.ecommercejsp.models.Customer;
import com.example.ecommercejsp.services.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private PersistenceLayer persistenceLayer;
	private CustomerService customerService;
	
	@Override
	public void init() throws ServletException {
		persistenceLayer = PersistenceLayer.getInstance();
		customerService = new CustomerService();
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
		
		int customerId;
		try {
			// Simple parsing for {"customerId": 1}
			String idStr = json.replaceAll(".*\"customerId\"\\s*:\\s*(\\d+).*", "$1");
			customerId = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Invalid customerId\"}");
			}
			return;
		}
		
		Customer customer = customerService.getCustomerById(customerId);
		if (customer == null) {
			resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
			try (PrintWriter out = resp.getWriter()) {
				out.print("{\"error\":\"Customer not found\"}");
			}
			return;
		}
		
		persistenceLayer.setCurrentCustomer(customer);
		
		try (PrintWriter out = resp.getWriter()) {
			out.print("{\"success\":true,\"customerId\":" + customer.getId() + "}");
		}
		
		resp.sendRedirect(req.getContextPath() + "/");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Customer> customers = customerService.getAllCustomers();
		req.setAttribute("customers", customers);
		
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}
}
