package com.example.ecommercejsp.controllers;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("")
public class ProductCatalogServlet extends HttpServlet {
	private String message;
	
	public void init() {
		message = "Welcome to the system!";
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setAttribute("message", message);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	public void destroy() {
	}
}