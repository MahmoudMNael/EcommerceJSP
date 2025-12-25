package com.example.ecommercejsp;

import com.example.ecommercejsp.models.Order;
import com.example.ecommercejsp.services.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private CustomerService customerService;
	
	@Override
	public void init() throws ServletException {
		customerService = new CustomerService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Order> orders = customerService.getCurrentCustomerOrders();
		req.setAttribute("ordersCount", orders != null ? orders.size() : 0);
		
		req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}
}
