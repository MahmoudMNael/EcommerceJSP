<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Home</title>
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
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
	<link rel="stylesheet" href="stylesheets/index.css" />
</head>
<body>
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

<!-- Main -->
<main class="container">
	<section class="intro">
		<div>
			<h2 class="title">Latest Drops</h2>
			<p class="subtitle">Curated tech essentials engineered for the modern workflow.</p>
		</div>
	</section>
	
	<!-- Product grid -->
	<section class="grid">
		<!-- Card -->
<c:choose>
	<c:when test="${not empty products}">
		<c:forEach var="product" items="${products}">
		<article class="card">
			<div class="media">
				<div
						class="img"
						role="img"
						style="
								background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuD5TyVSM3UBPVqF4PB8Qlg1reUBWCN8mpiGlZBFR5gp-vb3R2meJVMQUbj-rlvHufxf_4zcin-aTHY2FFRtTJOohnaQZr8KwyPVbX40bGUFhswHJV_1WNztOOsjWgUJ1zSZBbJk5aGPIDNKX9s7b2m_PTWTdxuMSSRVY068yzABbBWbxBKAO_D3PklxTHZDeNSDBdaPR35fF49QdPZR5_iiI7SpGYLU0Dk6x4Bqtx4JLc-e3Fs4dufpY7pON_Cwq6ivGb2a2ARBVws');
							"
				></div>
				<div class="overlay"><button class="primary add-to-cart-btn" data-id="${product.id}" data-name="${product.name}" data-price="${product.price}" data-quantity="${product.quantityAvailable}">Add to Cart</button></div>
			</div>
			<div class="body">
				<div class="row">
					<h3 class="name">${product.name}</h3>
					<p class="price">$${product.price}</p>
				</div>
				<p class="desc">x${product.quantityAvailable}</p>
			</div>
		</article>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p>No products available.</p>
	</c:otherwise>
</c:choose>
	</section>
	
	<!-- <div class="center">
		<button class="cta">Load More Products</button>
	</div> -->
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

<script src="scripts/index.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</body>
</html>
