const addButtons = document.querySelectorAll('.increment-quantity-btn');

addButtons.forEach(btn => {
btn.addEventListener('click', async (e) => {
      e.preventDefault();

      const id = btn.dataset.id;
//      const name = btn.dataset.name || '';
//      const price = parseFloat(btn.dataset.price) || 0;
//      const quantityAvailable = parseInt(btn.dataset.quantity, 10) || 1;


      // Optimistic UI update
//      if (qtyInput) qtyInput.value = newQty;
//      if (priceSpan) priceSpan.textContent = '$' + (price * newQty).toFixed(2);

      const product = {
        product_id: id ? Number(id) : null,
        product_name: null,
        unit_price: null,
        quantity_available: null
      };

      try {
        const resp = await fetch('/cart', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(product)
        });

        if (!resp.ok) {
          const text = await resp.text().catch(() => '');
          console.error('Failed to increment:', resp.status, text);
        }

        window.location.reload();
      } catch (err) {
        console.error('Network error while incrementing quantity:', err);
      }
})
})

const deleteButtons = document.querySelectorAll('.decrement-quantity-btn');

deleteButtons.forEach(btn => {
btn.addEventListener('click', async (e) => {
      e.preventDefault();

      const id = btn.dataset.id;

      const product = {
        product_id: id ? Number(id) : null,
        product_name: null,
        unit_price: null,
        quantity_available: null
      };

      try {
        const resp = await fetch('/cart', {
          method: 'DELETE',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(product)
        });

        if (!resp.ok) {
          const text = await resp.text().catch(() => '');
          console.error('Failed to delete:', resp.status, text);
        }

        window.location.reload();
      } catch (err) {
        console.error('Network error while deleting item:', err);
      }
})
})

const checkoutButton = document.getElementById('checkout-btn');
checkoutButton.addEventListener('click', async (e) => {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/order';

    document.body.appendChild(form);

    form.submit();
})