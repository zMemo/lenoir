let contador = 0;

const botonIncrementar = document.getElementById('incrementar');
const botonDecrementar = document.getElementById('decrementar');
const valorContador = document.getElementById('valor-contador');

botonIncrementar.addEventListener('click', () => {
    contador++;
    valorContador.textContent = contador;
});

botonDecrementar.addEventListener('click', () => {
    if (contador > 0) {
        contador--;
        valorContador.textContent = contador;
    }
});