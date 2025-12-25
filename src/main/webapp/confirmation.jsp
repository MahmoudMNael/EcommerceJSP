<%--
  Created by IntelliJ IDEA.
  User: mahmoudmnael
  Date: 11/28/25
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="en">
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Order Confirmation</title>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com" rel="preconnect" />
	<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
	<link
			href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;family=Noto+Sans:wght@400;500;700&amp;display=swap"
			rel="stylesheet"
	/>
	<!-- Material Symbols -->
	<link
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
			rel="stylesheet"
	/>
	<link
			href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
			rel="stylesheet"
	/>
	<!-- Tailwind CSS -->
	<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
	<!-- Tailwind Configuration -->
	<script>
		tailwind.config = {
			darkMode: 'class',
			theme: {
				extend: {
					colors: {
						primary: '#2bee79',
						'background-light': '#f6f8f7',
						'background-dark': '#102217',
					},
					fontFamily: {
						display: ['Spline Sans', 'Noto Sans', 'sans-serif'],
					},
					borderRadius: { DEFAULT: '1rem', lg: '2rem', xl: '3rem', full: '9999px' },
				},
			},
		};
	</script>
	<style>
      /* Custom scrollbar for better aesthetic in webkit browsers */
      ::-webkit-scrollbar {
          width: 8px;
      }
      ::-webkit-scrollbar-track {
          background: #102217;
      }
      ::-webkit-scrollbar-thumb {
          background: #28392f;
          border-radius: 4px;
      }
      ::-webkit-scrollbar-thumb:hover {
          background: #3b5445;
      }
	</style>
	<link rel="stylesheet" href="stylesheets/confirmation.css" />
</head>
<body
		class="font-display bg-background-light dark:bg-background-dark text-slate-900 dark:text-white min-h-screen flex flex-col"
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

<!-- Main Content Area -->
<main class="flex-grow flex items-center justify-center px-4 py-12">
	<div class="w-full max-w-[640px] flex flex-col items-center">
		<!-- Success Card -->
		<div
				class="w-full flex flex-col items-center bg-white dark:bg-[#1c2e24] p-8 md:p-12 rounded-[2rem] shadow-xl border border-slate-100 dark:border-[#28392f]"
		>
			<!-- Success Icon -->
			<div class="mb-8 relative">
				<div class="size-24 rounded-full bg-primary/20 flex items-center justify-center animate-pulse">
					<div
							class="size-16 rounded-full bg-primary flex items-center justify-center shadow-[0_0_20px_rgba(43,238,121,0.4)]"
					>
						<span class="material-symbols-outlined text-[#102217] text-[40px] font-bold">check</span>
					</div>
				</div>
			</div>
			<!-- Text Content -->
			<div class="flex flex-col items-center gap-3 mb-10 text-center">
				<h1 class="text-3xl md:text-4xl font-bold tracking-tight text-slate-900 dark:text-white">
					Order Confirmed!
				</h1>
				<p class="text-slate-500 dark:text-gray-400 text-base max-w-[400px]">
					Thank you for your purchase. We've received your order and sent a receipt to your email address.
				</p>
			</div>
			<!-- Order Details (Description List) -->
			<div
					class="w-full bg-slate-50 dark:bg-[#15281e] rounded-xl p-6 mb-10 border border-slate-100 dark:border-[#28392f]"
			>
				<div class="grid grid-cols-2 gap-4 divide-x divide-slate-200 dark:divide-[#3b5445]">
					<div class="flex flex-col items-center gap-1 pr-4">
						<p class="text-slate-500 dark:text-[#9db9a8] text-sm font-medium uppercase tracking-wider">Order ID</p>
						<p class="text-slate-900 dark:text-white text-lg font-bold font-mono">#ORD-${order.id}</p>
					</div>
					<div class="flex flex-col items-center gap-1 pl-4">
						<p class="text-slate-500 dark:text-[#9db9a8] text-sm font-medium uppercase tracking-wider">
							Amount Paid
						</p>
						<p class="text-primary text-lg font-bold">
							$<fmt:formatNumber value="${order.paidAmount}" type="number" minFractionDigits="2" maxFractionDigits="2" />
						</p>
					</div>
				</div>
			</div>
			<!-- Action Button -->
			<button
					class="w-full sm:w-auto min-w-[200px] h-14 bg-primary hover:bg-[#20d66a] active:scale-95 transition-all text-[#102217] text-base font-bold rounded-full flex items-center justify-center gap-2 shadow-lg shadow-primary/25"
					onclick="window.location.href='/'"
			>
				<span class="material-symbols-outlined text-[20px]">arrow_back</span>
				<span>Return to Shopping</span>
			</button>
		</div>
		<!-- Optional: Related Visual Element/Banner below -->
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
