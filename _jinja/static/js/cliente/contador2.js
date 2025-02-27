document.querySelectorAll(".cart-item").forEach((cartItem) => {
const incrementButton = cartItem.querySelector("#incrementar");
const decrementButton = cartItem.querySelector("#decrementar");
const cantidadDisplay = cartItem.querySelector("#cantidad");


    let cantidad = 0;


    incrementButton.addEventListener("click", () => {
    cantidad++;
    cantidadDisplay.textContent = cantidad;
    }
);

    decrementButton.addEventListener("click", () => {
    if (cantidad > 0) {
        cantidad--;
        cantidadDisplay.textContent = cantidad;
    }
    });
});
