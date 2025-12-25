document.querySelector('#login-btn').addEventListener('click', async function() {
    console.log('Login button clicked');
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
            window.location.replace = '/';
        } else {
            const data = await response.json();
            alert(data.error || 'Login failed');
        }
    } catch (error) {
        console.error('Error:', error);
    }
});