package com.example.ecommercejsp;

import com.example.ecommercejsp.models.OrderDetails;
import com.example.ecommercejsp.services.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {
	private OrderService orderService;
	private PersistenceLayer persistenceLayer;
	
	@Override
	public void init() throws ServletException {
		orderService = new OrderService();
		persistenceLayer = PersistenceLayer.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderIdParam = req.getParameter("orderId");
		if (orderIdParam == null || orderIdParam.isBlank()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing orderId parameter");
			return;
		}
		
		int orderId;
		try {
			orderId = Integer.parseInt(orderIdParam);
		} catch (NumberFormatException e) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid orderId parameter");
			return;
		}
		
		OrderDetails orderDetails = orderService.getOrderDetails(orderId);
		if (orderDetails == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
			return;
		}
		
		if (!orderDetails.getOrder().getCustomerId().equals(persistenceLayer.getCurrentCustomer().getId())) {
			resp.sendError(HttpServletResponse.SC_FORBIDDEN, "You are not authorized to view this order");
			return;
		}
		
		req.setAttribute("order", orderDetails.getOrder());
		req.setAttribute("items", orderDetails.getItems());
		
		int itemsCount = 0;
		if (orderDetails.getItems() != null) {
			itemsCount = orderDetails.getItems().stream()
					.mapToInt(item -> item.getQuantity() != null ? item.getQuantity() : 0)
					.sum();
		}
		req.setAttribute("itemsCount", itemsCount);
		
		req.getRequestDispatcher("/order-details.jsp").forward(req, resp);
	}
}
