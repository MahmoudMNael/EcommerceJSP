<%--
  Created by IntelliJ IDEA.
  User: mahmoudmnael
  Date: 12/25/25
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark">
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Order Details</title>
	<link
			href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;display=swap"
			rel="stylesheet"
	/>
	<link
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
			rel="stylesheet"
	/>
	<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
	<script id="tailwind-config">
		tailwind.config = {
			darkMode: 'class',
			theme: {
				extend: {
					colors: {
						primary: '#2bee79',
						'background-light': '#f6f8f7',
						'background-dark': '#102217',
						'surface-dark': '#1c2a23',
						'surface-light': '#ffffff',
					},
					fontFamily: {
						display: ['Spline Sans', 'sans-serif'],
					},
					borderRadius: {
						DEFAULT: '1rem',
						lg: '2rem',
						xl: '3rem',
						full: '9999px',
					},
				},
			},
		};
	</script>
	<style>
      body {
          font-family: 'Spline Sans', sans-serif;
      }
	</style>
	<link rel="stylesheet" href="stylesheets/order-details.css" />
</head>
<body
		class="bg-background-light dark:bg-background-dark text-gray-900 dark:text-white min-h-screen flex flex-col font-display selection:bg-primary selection:text-background-dark"
>
<!-- Header -->
<header class="site-header">
	<nav class="nav">
		<div class="brand">
			<h1 class="brand-name">The Store</h1>
		</div>
		
		<div class="nav-actions">
			<!-- Profile Dropdown -->
			<div class="profile-dropdown">
				<button class="profile-btn">
					<div class="profile-avatar">
						<span class="material-symbols-outlined">person</span>
					</div>
					<div class="profile-info">
						<span class="profile-label">Points</span>
						<span class="profile-points">${currentCustomer.loyaltyPoints}</span>
					</div>
				</button>
				<div class="profile-menu">
					<div class="profile-menu-inner">
						<div class="profile-header">
							<p class="points-label">Loyalty Points</p>
							<p class="points-value">${currentCustomer.loyaltyPoints}</p>
						</div>
						<a class="menu-item" href="/profile">
							<span class="material-symbols-outlined">account_circle</span>
							Profile
						</a>
						<a class="menu-item" href="/order-history">
							<span class="material-symbols-outlined">history</span>
							Order History
						</a>
						<div class="menu-divider"></div>
						<a class="menu-item menu-item-danger" href="/logout">
							<span class="material-symbols-outlined">logout</span>
							Sign Out
						</a>
					</div>
				</div>
			</div>
			
			<!-- Cart Button -->
			<button class="icon-btn" onclick="window.location.href='/cart'">
				<span class="material-symbols-outlined">shopping_cart</span>
			</button>
		</div>
	</nav>
</header>

<main class="flex-1 px-4 md:px-10 lg:px-40 py-8 max-w-[1440px] mx-auto w-full">
	<div class="flex flex-col gap-2 mb-10">
		<h1 class="text-gray-900 dark:text-white text-4xl md:text-5xl font-black leading-tight tracking-[-0.033em]">
			Order Details
		</h1>
		<p class="text-gray-500 dark:text-[#9db9a8] text-lg font-normal">
			Review the details of your order below.
		</p>
	</div>
	<div class="flex flex-col lg:flex-row gap-8">
		<nav class="lg:w-72 flex-shrink-0">
			<div class="bg-white dark:bg-surface-dark rounded-xl p-4 sticky top-12 shadow-sm">
				<div class="flex items-center gap-4 mb-6 px-2">
					<div class="size-12 rounded-full overflow-hidden border-2 border-primary/50">
						<img
								class="w-full h-full object-cover"
								data-alt="User profile picture side menu"
								src="https://lh3.googleusercontent.com/aida-public/AB6AXuAUJI664rL4cCiCusqu9ma9meI_UkxuYy8iw1Io-9GKhV-WFlFKP8mcU43toUHMZPzEs7T61c_MdFbk9slZ58gPYjf51YG0iOuUpe2O1g4ewZ3AJfF9WgYUPepCuPU2ofQ6Nf9PZxEuKBKo63wC2xD1oaajIpT4RTABK5GjzIa0ORsTCwIGQQc5cZzmctH3KkP5_3hlrA0nsh7_TGArgj7AQV-dNvhYCWjr7q5qQfwc4LRD-tPqdO2Y8D7B2Y3357PWL3V4cySmPU8"
						/>
					</div>
					<div class="flex flex-col">
						<span class="font-bold text-gray-900 dark:text-white">${currentCustomer.name}</span>
						<span class="text-xs text-primary font-medium">${currentCustomer.email}</span>
					</div>
				</div>
				<div class="flex flex-col gap-2">
					<a
							class="flex items-center gap-3 px-4 py-3 rounded-full text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-background-dark hover:text-gray-900 dark:hover:text-white transition-colors group"
							href="/profile"
					>
						<span class="material-symbols-outlined group-hover:text-primary transition-colors">person</span>
						<span class="font-medium text-sm">Profile Display</span>
					</a>
					<a
							class="flex items-center gap-3 px-4 py-3 rounded-full text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-background-dark hover:text-gray-900 dark:hover:text-white transition-colors group"
							href="/order-history"
					>
						<span class="material-symbols-outlined group-hover:text-primary transition-colors">history</span>
						<span class="font-bold text-sm">Order History</span>
					</a>
					<div class="h-px bg-gray-200 dark:bg-gray-700 my-2 mx-4"></div>
					<a
							class="flex items-center gap-3 px-4 py-3 rounded-full text-red-500 hover:bg-red-50 dark:hover:bg-red-900/10 transition-colors"
							href="/logout"
					>
						<span class="material-symbols-outlined">logout</span>
						<span class="font-medium text-sm">Sign Out</span>
					</a>
				</div>
			</div>
		</nav>
		<div class="flex-1 flex flex-col gap-6">
			<div
					class="flex flex-col sm:flex-row justify-between items-start sm:items-center bg-white dark:bg-surface-dark p-6 rounded-xl shadow-sm border border-gray-100 dark:border-transparent"
			>
				<div>
					<h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-1">#ORD-${order.id}</h2>
					<div class="flex items-center gap-2 text-gray-500 dark:text-[#9db9a8] text-sm">
						<span class="material-symbols-outlined text-lg">calendar_today</span>
						<span>Placed on <strong><fmt:formatDate value="${order.createdAt}" pattern="MMM d, yyyy h:mm a" /></strong></span>
					</div>
				</div>
			</div>
			<div
					class="bg-white dark:bg-surface-dark rounded-xl shadow-sm border border-gray-100 dark:border-transparent overflow-hidden"
			>
				<div class="px-6 py-4 border-b border-gray-100 dark:border-gray-800 flex items-center justify-between">
					<h3 class="text-lg font-bold text-gray-900 dark:text-white">Items in Order</h3>
					<span class="text-sm text-gray-500 dark:text-[#9db9a8]">${itemsCount} Items</span>
				</div>
				<div class="divide-y divide-gray-100 dark:divide-gray-800">
					<!-- Data -->
<c:choose>
	<c:when test="${not empty items}">
		<c:forEach var="item" items="${items}">
					<div
							class="p-6 flex flex-col sm:flex-row items-center gap-6 hover:bg-gray-50 dark:hover:bg-surface-dark/50 transition-colors"
					>
						<div
								class="w-20 h-20 flex-shrink-0 bg-gray-100 dark:bg-black/30 rounded-lg overflow-hidden border border-gray-200 dark:border-gray-700"
						>
							<div class="w-full h-full flex items-center justify-center text-gray-400">
								<span class="material-symbols-outlined text-3xl">image</span>
							</div>
						</div>
						<div class="flex-1 w-full text-center sm:text-left">
							<h4 class="font-bold text-gray-900 dark:text-white text-lg">${item.product.name}</h4>
						</div>
						<div class="flex items-center gap-8 w-full sm:w-auto justify-between sm:justify-end">
							<div class="text-center">
										<span class="block text-xs uppercase text-gray-500 dark:text-[#9db9a8] font-semibold mb-1"
										>Qty</span
										>
								<span class="block font-medium text-gray-900 dark:text-white">${item.quantity}</span>
							</div>
							<div class="text-right min-w-[80px]">
										<span class="block text-xs uppercase text-gray-500 dark:text-[#9db9a8] font-semibold mb-1"
										>Price</span
										>
								<span class="block font-bold text-primary text-lg">$<fmt:formatNumber value="${item.product.price * item.quantity}" type="number" minFractionDigits="2" maxFractionDigits="2" /></span>
							</div>
						</div>
					</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
					<!-- End Data -->
				</div>
			</div>
			<div
					class="bg-white dark:bg-surface-dark rounded-xl shadow-sm border border-gray-100 dark:border-transparent p-6"
			>
				<div class="flex flex-col gap-4">
					<div class="flex justify-between items-center text-lg font-bold text-gray-900 dark:text-white">
						<span>Total Amount</span>
						<span class="text-2xl text-primary">$<fmt:formatNumber value="${order.paidAmount}" type="number" minFractionDigits="2" maxFractionDigits="2" /></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- Footer -->
<footer class="site-footer">
	<div class="footer-inner">
		<div class="brand brand-footer">
			<span class="brand-name">The Store</span>
		</div>
		<div class="links">
			<a class="link" href="#">Terms</a>
			<a class="link" href="#">Privacy</a>
			<a class="link" href="#">Contact</a>
		</div>
		<p class="copy">© 2025 The Store.</p>
	</div>
</footer>
</body>
</html>
