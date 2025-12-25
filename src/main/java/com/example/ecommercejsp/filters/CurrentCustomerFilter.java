package com.example.ecommercejsp.filters;

import com.example.ecommercejsp.PersistenceLayer;
import com.example.ecommercejsp.models.Customer;
import com.example.ecommercejsp.services.CustomerService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/*")
public class CurrentCustomerFilter implements Filter {
	private CustomerService customerService;
	private PersistenceLayer persistenceLayer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		customerService = new CustomerService();
		persistenceLayer = PersistenceLayer.getInstance();
	}
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpServletResponse resp = (HttpServletResponse) servletResponse;
		
		String path = req.getRequestURI();
		if (path.endsWith("/login") || path.contains("/login.jsp")) {
			if (persistenceLayer.getCurrentCustomer() != null) {
				resp.sendRedirect(req.getContextPath() + "/");
				return;
			}
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		if (persistenceLayer.getCurrentCustomer() == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		Customer customer = customerService.getCustomerById(persistenceLayer.getCurrentCustomer().getId());
		persistenceLayer.setCurrentCustomer(customer);
		req.setAttribute("currentCustomer", customer);
		
		filterChain.doFilter(servletRequest, servletResponse);
	}
	
	@Override
	public void destroy() {
		Filter.super.destroy();
	}
}
