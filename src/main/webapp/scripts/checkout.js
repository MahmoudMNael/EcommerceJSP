(function injectToastStyles() {
  const id = 'app-toast-styles';
  if (document.getElementById(id)) return;
  const css = `
    .toast-success {
      background: linear-gradient(135deg, #064e3b 0%, #0f1724 100%);
      color: #ffffff;
      padding: 14px 20px;
      border-radius: 10px;
      border-left: 4px solid #10b981;
      box-shadow: 0 8px 24px rgba(0,0,0,0.4);
      font-weight: 500;
      font-family: inherit;
      display: flex;
      align-items: center;
      gap: 12px;
    }
    .toast-success::before {
      content: '✓';
      display: flex;
      align-items: center;
      justify-content: center;
      width: 24px;
      height: 24px;
      background: #10b981;
      border-radius: 50%;
      font-size: 14px;
      font-weight: bold;
      color: #fff;
      flex-shrink: 0;
    }
    .toast-error {
      background: linear-gradient(135deg, #7f1d1d 0%, #0f1724 100%);
      color: #ffffff;
      padding: 14px 20px;
      border-radius: 10px;
      border-left: 4px solid #ef4444;
      box-shadow: 0 8px 24px rgba(0,0,0,0.4);
      font-weight: 500;
      font-family: inherit;
      display: flex;
      align-items: center;
      gap: 12px;
    }
    .toast-error::before {
      content: '✕';
      display: flex;
      align-items: center;
      justify-content: center;
      width: 24px;
      height: 24px;
      background: #ef4444;
      border-radius: 50%;
      font-size: 14px;
      font-weight: bold;
      color: #fff;
      flex-shrink: 0;
    }
  `;
  const style = document.createElement('style');
  style.id = id;
  style.textContent = css;
  document.head.appendChild(style);
})();




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

        if (resp.ok) {
                  const json = await resp.json().catch(() => null);
                  console.log('Added to cart');
                  window.location.reload();
                } else if (resp.status == 409) {
                  Toastify({
                    text: "Item is out of stock",
                    duration: 3000,
                    close: false,
                    gravity: "bottom",
                    position: "right",
                    stopOnFocus: false,
                    className: "toast-error"
                  }).showToast();
                } else {
                  const text = await resp.text().catch(() => '');
                  console.error('Failed to add to cart:', resp.status, text);
                }
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