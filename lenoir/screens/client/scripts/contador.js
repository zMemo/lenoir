// Seleccionamos todos los botones de incrementar y decrementar, y los valores del contador
const incrementarBtns = document.querySelectorAll('.incrementar');
const decrementarBtns = document.querySelectorAll('.decrementar');
const contadores = document.querySelectorAll('contador');

// Convertimos los elementos a un array para facilitar el manejo
incrementarBtns.forEach((btn, index) => {
    let count = 0;

    btn.addEventListener('click', () => {
        count++;
        contadores[index].innerText = count;
    });
});

decrementarBtns.forEach((btn, index) => {
    let count = 0;

    btn.addEventListener('click', () => {
        if (count > 0) {
            count--;
            contadores[index].innerText = count;
        }
    });
});