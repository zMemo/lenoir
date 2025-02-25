
const cartIcon = document.getElementById('carrito');
const cartSidebar = document.getElementById('cart-sidebar');
const closeCart = document.getElementById('close-cart');


cartIcon.addEventListener('click', () => {
    event.preventDefault(); //previene que recarge la pagina//
    cartSidebar.classList.add('open');
});


closeCart.addEventListener('click', () => {
    cartSidebar.classList.remove('open');
});

//PARA QUE CUANDO CLICKES AFUERA SE SALGA DEL CARRITO//
document.addEventListener('click', (event) => {
    if (!cartSidebar.contains(event.target) && !cartIcon.contains(event.target)) {
        cartSidebar.classList.remove('open');
    }
});
