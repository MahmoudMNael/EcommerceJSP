<%--
  Created by IntelliJ IDEA.
  User: mahmoudmnael
  Date: 12/25/25
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="en">
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Profile</title>
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
	<link rel="stylesheet" href="stylesheets/profile.css" />
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
							class="flex items-center gap-3 px-4 py-3 rounded-full bg-primary text-background-dark shadow-lg shadow-primary/20 transition-all hover:scale-[1.02]"
							href="#"
					>
						<span class="material-symbols-outlined">person</span>
						<span class="font-bold text-sm">Profile Display</span>
					</a>
					<a
							class="flex items-center gap-3 px-4 py-3 rounded-full text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-background-dark hover:text-gray-900 dark:hover:text-white transition-colors group"
							href="/order-history"
					>
						<span class="material-symbols-outlined group-hover:text-primary transition-colors">history</span>
						<span class="font-medium text-sm">Order History</span>
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
			<section class="bg-white dark:bg-surface-dark rounded-xl p-6 md:p-8 shadow-sm relative overflow-hidden group">
				<div
						class="absolute -top-20 -right-20 w-64 h-64 bg-primary/10 rounded-full blur-3xl group-hover:bg-primary/20 transition-all duration-700"
				></div>
				<div class="flex flex-col md:flex-row gap-8 items-start relative z-10">
					<div class="relative">
						<div
								class="w-32 h-32 md:w-40 md:h-40 rounded-full overflow-hidden border-4 border-gray-100 dark:border-background-dark shadow-xl"
						>
							<img
									class="w-full h-full object-cover"
									data-alt="High resolution user profile portrait"
									src="https://lh3.googleusercontent.com/aida-public/AB6AXuAUJI664rL4cCiCusqu9ma9meI_UkxuYy8iw1Io-9GKhV-WFlFKP8mcU43toUHMZPzEs7T61c_MdFbk9slZ58gPYjf51YG0iOuUpe2O1g4ewZ3AJfF9WgYUPepCuPU2ofQ6Nf9PZxEuKBKo63wC2xD1oaajIpT4RTABK5GjzIa0ORsTCwIGQQc5cZzmctH3KkP5_3hlrA0nsh7_TGArgj7AQV-dNvhYCWjr7q5qQfwc4LRD-tPqdO2Y8D7B2Y3357PWL3V4cySmPU8"
							/>
						</div>
					</div>
					<div class="flex-1 flex flex-col gap-4">
						<div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
							<div>
								<h2 class="text-3xl font-bold text-gray-900 dark:text-white">${currentCustomer.name}</h2>
							</div>
						</div>
						<div class="grid grid-cols-1 gap-4 mt-2">
							<div
									class="p-4 bg-gray-50 dark:bg-background-dark rounded-xl flex items-center gap-3 border border-transparent hover:border-primary/30 transition-colors"
							>
								<div class="p-2 rounded-full text-primary shadow-sm flex-shrink-0">
									<span class="material-symbols-outlined">mail</span>
								</div>
								<div class="flex flex-col min-w-0">
											<span class="text-xs text-gray-500 dark:text-gray-400 uppercase font-bold tracking-wider"
											>Email</span
											>
									<span class="text-gray-900 dark:text-white font-medium break-all">${currentCustomer.email}</span>
								</div>
							</div>
							<div
									class="p-4 bg-gray-50 dark:bg-background-dark rounded-xl flex items-center gap-3 border border-transparent hover:border-primary/30 transition-colors"
							>
								<div class="p-2 rounded-full text-primary shadow-sm flex-shrink-0">
									<span class="material-symbols-outlined">call</span>
								</div>
								<div class="flex flex-col min-w-0">
											<span class="text-xs text-gray-500 dark:text-gray-400 uppercase font-bold tracking-wider"
											>Phone</span
											>
									<span class="text-gray-900 dark:text-white font-medium break-words">${currentCustomer.phone}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="grid grid-cols-1 md:grid-cols-2 gap-6">
				<div
						class="bg-gradient-to-br from-surface-dark to-black dark:from-[#1c2a23] dark:to-[#0f1912] rounded-xl p-8 text-white relative overflow-hidden shadow-lg border border-gray-800 flex flex-col justify-center h-full"
				>
					<div
							class="absolute inset-0 opacity-10"
							style="background-image: radial-gradient(#2bee79 1px, transparent 1px); background-size: 20px 20px"
					></div>
					<div class="relative z-10 flex flex-col gap-6 items-start">
						<div class="flex w-full justify-between items-start">
							<div>
								<h3 class="text-xl font-medium text-gray-200">Loyalty Balance</h3>
								<p class="text-sm text-gray-400 mt-1">Available points</p>
							</div>
							<div class="p-2 rounded-lg backdrop-blur-sm">
								<span class="material-symbols-outlined text-primary text-3xl">loyalty</span>
							</div>
						</div>
						<div class="flex items-baseline gap-2">
							<span class="text-6xl font-black text-primary tracking-tight">${currentCustomer.loyaltyPoints}</span>
							<span class="text-xl font-medium text-gray-300">pts</span>
						</div>
					</div>
				</div>
				<div
						class="bg-white dark:bg-surface-dark rounded-xl p-8 flex flex-col justify-center items-center gap-4 shadow-sm border border-gray-100 dark:border-transparent h-full"
				>
					<span class="material-symbols-outlined text-5xl text-blue-400 dark:text-blue-300">shopping_bag</span>
					<div class="text-center">
						<span class="text-4xl font-bold text-gray-900 dark:text-white block">${ordersCount}</span>
						<span class="text-sm text-gray-500 dark:text-gray-400 font-medium uppercase tracking-wide"
						>Total Orders</span
						>
					</div>
				</div>
			</section>
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

