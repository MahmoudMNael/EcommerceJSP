const buttons = document.querySelectorAll('.add-to-cart-btn');

buttons.forEach(btn => {
    btn.addEventListener('click', async (e) => {
      e.preventDefault();

      // find card and read values (fallback to data- attributes if available)
      const card = btn.closest('.card');
      const id = btn.dataset.id;
      const name = btn.dataset.name;
      const priceText = btn.dataset.price;
      const quantityText = btn.dataset.quantity;

      // parse numeric values
      const price = parseFloat(priceText.replace(/[^0-9.\-]/g, '')) || 0;
      const quantityAvailable = parseInt((quantityText.match(/\d+/) || ['1'])[0], 10) || 1;

      const product = {
        product_id: id ? Number(id) : null,
        product_name: name.trim(),
        unit_price: price,
        quantity_available: quantityAvailable
      };

      try {
        const resp = await fetch('/cart', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(product)
        });

        if (resp.ok) {
          const json = await resp.json().catch(() => null);
          console.log('Added to cart');
          // optional: update UI, show toast, or change button state
        } else {
          const text = await resp.text().catch(() => '');
          console.error('Failed to add to cart:', resp.status, text);
        }
      } catch (err) {
        console.error('Network error while adding to cart:', err);
      }
    });
  });