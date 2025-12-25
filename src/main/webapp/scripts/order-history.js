document.addEventListener('DOMContentLoaded', () => {
  const buttons = document.querySelectorAll('.order-details-btn');
  buttons.forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const id = btn.dataset.id || btn.getAttribute('data-id') || null;
      if (!id) {
        return;
      }
      window.location.href = `/order-details?orderId=${encodeURIComponent(id)}`;
    });
  });
});