function tax (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    var fee = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const SalesProfit = itemPrice.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load', tax);