window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const inputValue = parseFloat(priceInput.value);
    const fee = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = fee;
  
    const profitNumber = document.getElementById("profit");
    const value = Math.floor(inputValue - fee);
    profitNumber.innerHTML = value;
  });
});
