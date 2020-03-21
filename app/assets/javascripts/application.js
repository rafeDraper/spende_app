document.addEventListener("DOMContentLoaded", function(event) {
  // Input Mask
  document.querySelectorAll("input.currency-input-mask").forEach(function(el) {
      new Cleave(el, window.__AMOUNT_INPUT_MASK__);
  });
});
