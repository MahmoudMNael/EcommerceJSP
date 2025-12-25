package com.example.ecommercejsp;

import com.example.ecommercejsp.models.Cart;
import com.example.ecommercejsp.models.Customer;
import com.example.ecommercejsp.models.Order;
import com.example.ecommercejsp.services.CustomerService;
import com.example.ecommercejsp.services.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private OrderService orderService;
	private CustomerService customerService;
	private PersistenceLayer persistenceLayer;
	
	@Override
	public void init() throws ServletException {
		persistenceLayer = PersistenceLayer.getInstance();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cart cart = persistenceLayer.getCart();
		
		orderService = new OrderService();
		Order order = orderService.placeOrder(cart, 1);
		
		if (order != null) {
			cart.clearCart();
			
			customerService = new CustomerService();
			customerService.updateCustomerLoyaltyPoints(order);
			
			req.setAttribute("order", order);
			req.getRequestDispatcher("/confirmation.jsp").forward(req, resp);
		} else {
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Order placement failed");
		}
	}
}
