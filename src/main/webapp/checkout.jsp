<%--
  Created by IntelliJ IDEA.
  User: mahmoudmnael
  Date: 11/28/25
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="en">
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Cart</title>
	<link href="https://fonts.googleapis.com" rel="preconnect" />
	<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
	<link
			href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;display=swap"
			rel="stylesheet"
	/>
	<link
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
			rel="stylesheet"
	/>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
	<link rel="stylesheet" href="stylesheets/checkout.css" />
	<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
	<script id="tailwind-config">
		tailwind.config = {
			darkMode: 'class',
			theme: {
				extend: {
					colors: {
						primary: '#2bee79',
						'primary-hover': '#25cf69',
						'background-light': '#f6f8f7',
						'background-dark': '#102217',
						'surface-dark': '#152a1e',
						'surface-light': '#ffffff',
					},
					fontFamily: {
						display: ['Spline Sans', 'sans-serif'],
						body: ['Spline Sans', 'sans-serif'],
					},
					borderRadius: { DEFAULT: '1rem', lg: '2rem', xl: '3rem', full: '9999px' },
				},
			},
		};
	</script>
</head>
<body
		class="bg-background-light dark:bg-background-dark font-display min-h-screen flex flex-col antialiased selection:bg-primary selection:text-background-dark"
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

<main class="flex-grow w-full px-6 md:px-12 xl:px-40 py-8 lg:py-12 max-w-[1440px] mx-auto">
	<div class="mb-8">
		<h1 class="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white tracking-tight mb-2">Your Cart</h1>
	</div>
	<div class="flex flex-col lg:flex-row gap-8 xl:gap-16">
		<div class="flex-1 flex flex-col gap-6">
			<div
					class="hidden md:flex justify-between pb-2 border-b border-gray-200 dark:border-[#28392f] text-sm text-gray-500 dark:text-[#9db9a8] uppercase font-medium tracking-wider"
			>
				<div class="flex-1 pl-4">Product</div>
				<div class="w-32 text-center">Quantity</div>
				<div class="w-24 text-right pr-4">Price</div>
			</div>
			
			<!-- Cart Item -->
			<c:choose>
				<c:when test="${not empty cartItems}">
					<c:forEach var="item" items="${cartItems}">
			<div
					class="group flex flex-col md:flex-row gap-4 p-4 rounded-2xl bg-white dark:bg-surface-dark shadow-sm hover:shadow-md transition-shadow border border-gray-100 dark:border-transparent"
			>
				<div class="flex flex-1 gap-5">
					<div class="shrink-0">
						<div
								class="w-24 h-24 md:w-28 md:h-28 rounded-xl bg-gray-100 dark:bg-[#1a2c22] bg-center bg-cover"
								data-alt="Minimalist aluminum laptop stand on wooden desk"
								style="
										background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuD5TyVSM3UBPVqF4PB8Qlg1reUBWCN8mpiGlZBFR5gp-vb3R2meJVMQUbj-rlvHufxf_4zcin-aTHY2FFRtTJOohnaQZr8KwyPVbX40bGUFhswHJV_1WNztOOsjWgUJ1zSZBbJk5aGPIDNKX9s7b2m_PTWTdxuMSSRVY068yzABbBWbxBKAO_D3PklxTHZDeNSDBdaPR35fF49QdPZR5_iiI7SpGYLU0Dk6x4Bqtx4JLc-e3Fs4dufpY7pON_Cwq6ivGb2a2ARBVws');
									"
						></div>
					</div>
					<div class="flex flex-col justify-center">
						<h3 class="text-lg font-bold text-gray-900 dark:text-white leading-tight mb-1">${item.product.name}</h3>
					</div>
				</div>
				<div class="md:flex items-center gap-6">
					<div class="flex items-center bg-gray-100 dark:bg-[#28392f] rounded-full h-10 p-1">
						<button
								class="decrement-quantity-btn size-8 flex items-center justify-center rounded-full hover:bg-white dark:hover:bg-[#3d5246] text-gray-600 dark:text-white transition-colors"
								data-id="${item.product.id}" data-name="${item.product.name}" data-price="${item.product.price}" data-quantity="${item.product.quantityAvailable}"
						>
							<span class="material-symbols-outlined text-[18px]">remove</span>
						</button>
						<input
								class="w-10 bg-transparent border-none p-0 text-center text-sm font-medium text-gray-900 dark:text-white focus:ring-0"
								readonly=""
								value="${item.quantity}"
						/>
						<button
								class="increment-quantity-btn size-8 flex items-center justify-center rounded-full hover:bg-white dark:hover:bg-[#3d5246] text-gray-600 dark:text-white transition-colors"
								data-id="${item.product.id}" data-name="${item.product.name}" data-price="${item.product.price}" data-quantity="${item.product.quantityAvailable}"
						>
							<span class="material-symbols-outlined text-[18px]">add</span>
						</button>
					</div>
					<div class="w-24 text-right flex flex-col items-end gap-2">
						<span class="text-lg font-bold text-gray-900 dark:text-white">
							$<fmt:formatNumber value="${item.product.price * item.quantity}" type="number" minFractionDigits="2" maxFractionDigits="2" />
						</span>
					</div>
				</div>
			</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
			</c:choose>
			<!-- End Cart Item -->
			<div class="mt-4">
				<a class="inline-flex items-center gap-2 text-primary font-medium hover:underline text-sm" href="/">
					<span class="material-symbols-outlined text-[18px]">arrow_back</span>
					Continue Shopping
				</a>
			</div>
		</div>
		
		<!-- Order Summary -->
<c:choose>
	<c:when test="${not empty cartItems}">
		<div class="w-full lg:w-96 shrink-0">
			<div class="lg:sticky lg:top-24 flex flex-col gap-6">
				<div
						class="p-6 md:p-8 rounded-2xl bg-white dark:bg-surface-dark border border-gray-100 dark:border-transparent shadow-lg shadow-black/5 dark:shadow-black/20"
				>
					<h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-6">Order Summary</h2>
					<div class="space-y-4">
						<div class="flex justify-between items-center mb-6">
							<span class="text-lg font-bold text-gray-900 dark:text-white">Total</span>
							<span class="text-3xl font-bold text-gray-900 dark:text-white tracking-tight">
								$<fmt:formatNumber value="${totalPrice}" type="number" minFractionDigits="2" maxFractionDigits="2" />
							</span>
						</div>
						<button
								class="w-full bg-primary hover:bg-primary-hover text-black font-bold text-lg py-4 px-6 rounded-full shadow-lg shadow-primary/20 hover:shadow-primary/40 transform hover:-translate-y-0.5 transition-all flex items-center justify-center gap-2"
								id="checkout-btn"
						>
							Checkout
							<span class="material-symbols-outlined font-bold">arrow_forward</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
</c:choose>
		<!-- End Order Summary -->
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
<script src="scripts/checkout.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>
