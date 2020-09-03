function profit() {
  const item_price = document.getElementById("item-price");
  const item_tax = document.getElementById("add-tax-price");
  
  const item_profit = document.getElementById("profit");


item_price.addEventListener("change",function(){
  let price = item_price.value;
  const tax = price * 0.1
  const gains = price - tax

  item_tax.textContent = tax 
  item_profit.textContent = gains
  



})

}


window.addEventListener("load", profit);