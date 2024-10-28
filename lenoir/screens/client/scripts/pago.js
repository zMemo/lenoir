const checkoutButton = document.getElementById("checkout-button");

function checkoutButton(){
    const popup = document.createElement("div");
    popup.innerText = "Redireccionándolo a una pasarela de pago...";
    document.body.appendChild(popup);
}
