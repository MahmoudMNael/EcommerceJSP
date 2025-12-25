<%--
  Created by IntelliJ IDEA.
  User: mahmoudmnael
  Date: 12/25/25
  Time: 12:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="dark">
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Order History</title>
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
	<link rel="stylesheet" href="stylesheets/order-history.css" />
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
			My Account
		</h1>
		<p class="text-gray-500 dark:text-[#9db9a8] text-lg font-normal">
			Manage your personal information, security, and view your loyalty rewards.
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
							class="flex items-center gap-3 px-4 py-3 rounded-full bg-primary text-background-dark shadow-lg shadow-primary/20 transition-all hover:scale-[1.02]"
							href="#"
					>
						<span class="material-symbols-outlined">history</span>
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
			<div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
				<div>
					<h2 class="text-3xl font-bold text-gray-900 dark:text-white">Order History</h2>
					<p class="text-gray-500 dark:text-[#9db9a8] mt-1">
						Check the recent orders, and view details.
					</p>
				</div>
			</div>
			<div
					class="bg-white dark:bg-surface-dark rounded-xl shadow-sm border border-gray-100 dark:border-transparent overflow-hidden flex flex-col"
			>
				<div
						class="hidden md:grid grid-cols-10 gap-4 px-6 py-4 bg-gray-50/50 dark:bg-black/20 border-b border-gray-100 dark:border-gray-800 text-xs font-semibold uppercase tracking-wider text-gray-500 dark:text-gray-400"
				>
					<div class="col-span-3">Order ID</div>
					<div class="col-span-3">Date</div>
					<div class="col-span-2">Total</div>
					<div class="col-span-2 text-right">Action</div>
				</div>
				<!-- Data -->
				<c:choose>
					<c:when test="${not empty orders}">
						<c:forEach var="order" items="${orders}">
				<div
						class="flex flex-col md:grid md:grid-cols-10 gap-4 px-6 py-5 border-b border-gray-100 dark:border-gray-800 items-start md:items-center hover:bg-gray-50 dark:hover:bg-surface-dark/50 transition-colors group relative"
				>
					<div class="flex flex-col col-span-3">
						<span class="font-bold text-gray-900 dark:text-white flex items-center gap-2"> #ORD-${order.id} </span>
					</div>
					<div class="col-span-3 text-sm text-gray-500 dark:text-[#9db9a8] flex flex-col">
						<span class="md:hidden text-xs uppercase font-bold text-gray-400 mb-1">Date</span>
						<span><fmt:formatDate value="${order.createdAt}" pattern="MMM d, yyyy h:mm a" /></span>
					</div>
					<div class="col-span-2 font-bold text-gray-900 dark:text-white">
						<span class="md:hidden text-gray-500 font-normal mr-2">Total:</span>$<fmt:formatNumber value="${order.paidAmount}" type="number" minFractionDigits="2" maxFractionDigits="2" />
					</div>
					<div class="col-span-2 text-right w-full md:w-auto mt-2 md:mt-0">
						<button
								data-id="${order.id}"
								class="order-details-btn text-primary hover:text-green-400 font-medium text-sm transition-colors flex items-center gap-1 justify-end ml-auto duration-300"
						>
							View Details <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
						</button>
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
<script src="scripts/order-history.js"></script>
</body>
</html>
