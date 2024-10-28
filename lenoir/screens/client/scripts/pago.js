const checkoutButton = document.getElementById("checkout-button");
const modal_container = document.getElementById("modal_container");


checkoutButton.addEventListener("click", () => {
    if (cartItems > 0) {
        
        modal_container.classList.add("show");
        
        
        setTimeout(() => {
            modal_container.classList.remove("show");
            window.location.href = "/ruta-a-pasarela-de-pago"; 
        }, 2000);
    } else {
        warnings +=("El carrito está vacío. Añade productos para continuar.");
    }
});