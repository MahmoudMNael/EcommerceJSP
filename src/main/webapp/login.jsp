<%--
  Created by IntelliJ IDEA.
  User: mahmoudmnael
  Date: 12/25/25
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="dark" lang="en">
<head>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<title>The Store - Sign In</title>
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
						'background-light': '#f6f8f7',
						'background-dark': '#102217',
						'surface-dark': '#1c2e24',
						'border-dark': '#28392f',
						'text-muted': '#9db9a8',
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
      select option {
          background-color: #1c2e24;
          color: white;
          padding: 12px;
      }
	</style>
</head>
<body
		class="bg-background-light dark:bg-background-dark font-display min-h-screen flex flex-col relative overflow-hidden text-white selection:bg-primary selection:text-background-dark"
>
<div class="fixed inset-0 pointer-events-none z-0">
	<div class="absolute top-[-20%] right-[-10%] w-[600px] h-[600px] bg-primary/10 rounded-full blur-[120px]"></div>
	<div class="absolute bottom-[-10%] left-[-10%] w-[500px] h-[500px] bg-[#1a4a35] rounded-full blur-[100px]"></div>
</div>
<div class="relative z-10 flex flex-col items-center justify-center grow w-full px-4 sm:px-6">
	<div
			class="w-full max-w-[440px] flex flex-col gap-8 p-8 sm:p-10 bg-surface-dark/80 backdrop-blur-xl border border-border-dark rounded-2xl shadow-2xl"
	>
		<div class="flex flex-col items-center text-center gap-6">
			<div class="flex items-center gap-3 text-primary">
				<h2 class="text-white text-2xl font-bold tracking-tight">The Store</h2>
			</div>
			<div class="space-y-2">
				<h1 class="text-3xl font-bold tracking-tight text-white">Welcome Back</h1>
				<p class="text-text-muted text-sm font-normal">Select an account to continue shopping.</p>
			</div>
		</div>
		<form class="flex flex-col gap-8" onsubmit="event.preventDefault();">
			<div class="space-y-3">
				<label
						class="text-sm font-medium text-text-muted/80 ml-1 uppercase tracking-wider text-xs"
						for="user-select"
				>Select User Account</label
				>
				<div class="relative group">
					<div
							class="absolute left-5 top-1/2 -translate-y-1/3 text-text-muted pointer-events-none transition-colors group-focus-within:text-primary z-10"
					>
						<span class="material-symbols-outlined text-[24px]">account_circle</span>
					</div>
					<select
							class="appearance-none w-full bg-[#111814] border border-[#28392f] hover:border-primary/40 text-white text-base rounded-2xl py-4 pl-14 pr-12 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all duration-300 cursor-pointer shadow-inner"
							id="user-select"
					>
						<option disabled="" selected="" value="">Choose your identity...</option>
						<c:choose>
							<c:when test="${not empty customers}">
								<c:forEach var="customer" items="${customers}">
						<option value="${customer.id}">${customer.name} — ${customer.email}</option>
								</c:forEach>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
				<div class="flex items-end gap-2 px-2">
					<span class="material-symbols-outlined text-primary text-[17px] mt-1">info</span>
					<p class="text-xs text-text-muted/60">Note: Please select YOUR ACCOUNT, don't steal others'.</p>
				</div>
			</div>
			<button
					id="login-btn"
					class="group relative flex w-full cursor-pointer items-center justify-center overflow-hidden rounded-full h-14 px-5 bg-primary hover:bg-[#1fd66b] text-background-dark text-lg font-bold leading-normal tracking-[0.015em] transition-all duration-300 shadow-[0_0_20px_rgba(43,238,121,0.2)] hover:shadow-[0_0_35px_rgba(43,238,121,0.5)] active:scale-[0.98]"
			>
						<span class="relative z-10 flex items-center gap-2">
							Sign In
							<span class="material-symbols-outlined text-[24px] transition-transform group-hover:translate-x-1"
							>arrow_forward</span
							>
						</span>
			</button>
		</form>
	</div>
</div>
<script>
	document.querySelector('#login-btn').addEventListener('click', async function() {
    const select = document.getElementById('user-select');
    const customerId = select.value;

    if (!customerId) {
        alert('Please select an account');
        return;
    }

    try {
        const response = await fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ customerId: parseInt(customerId) })
        });

        if (response.ok) {
            console.log(response.status)
            window.location.href = '/';
        } else {
            const data = await response.json();
            alert(data.error || 'Login failed');
        }
    } catch (error) {
        console.error('Error:', error);
    }
});
</script>
</body>
</html>
