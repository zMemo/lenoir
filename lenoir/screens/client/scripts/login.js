const parrafo = document.getElementById("warnings");
const formlogin = document.getElementById("login");
const username = document.getElementById("username");
const password = document.getElementById("password");
const modal_container = document.getElementById("modal_container");
const open = document.getElementById("open"); 
const close = document.getElementById("close");

formlogin.addEventListener("submit", e => {
    e.preventDefault();
    let warnings = "";
    let entrar = false;
    parrafo.innerHTML = "";
    
    if (username.value.length < 6) {
        warnings += "El nombre no es válido.<br>";
        entrar = true;
    }
    if (password.value.length < 8) {
        warnings += "La contraseña no es válida.<br>";
        entrar = true;
    }
    if (entrar) {
        parrafo.innerHTML = warnings;
    } else {
        parrafo.innerHTML = "Ingresando...";
        modal_container.classList.add('show');
        setTimeout(() => {
            modal_container.classList.remove('show');
            window.location.href = "/lenoir/screens/client/indexlogged.html";
        }, 2000); 
    }
});