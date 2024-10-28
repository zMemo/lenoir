const formregister = document.getElementById("register")
const user = document.getElementById("user")
const nombre = document.getElementById("nombre")
const email = document.getElementById("email")
const numero = document.getElementById("numero")
const registerpassword = document.getElementById("registerpassword")
const repeatpassword = document.getElementById("rpassword")
const parrafo = document.getElementById("warnings")

formregister.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings = ""
    let entrar = false
    parrafo.innerHTML = ""
    let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/
    if(nombre.value.length <1){
        warnings += "El nombre no es valido. <br>"
        entrar = true
    }
    if(user.value.length <6){
        warnings += "El usuario no es valido. <br>"
        entrar = true
    }
    if(numero.value.length<9){
        warnings += "El numero no es valido.<br>"
        entrar = true
    }
    if(!regexEmail.test(email.value)){
        warnings += "El email no es valido.<br>"
        entrar = true
    }
    if(registerpassword.value.length <8){
        warnings += "Tiene que tener 8 caracteres. <br>"
        entrar = true
    }
    if(registerpassword.value != repeatpassword.value){
        warnings += "La contraseñas son distintas. <br>"
        entrar = true
    }
    if(entrar){
        parrafo.innerHTML = warnings
    }else{
        parrafo.innerHTML = "Registrandote..."
        modal_container.classList.add('show');
        setTimeout(() => {
            modal_container.classList.remove('show');
            window.location.href = "/lenoir/screens/client/index.html";
        }, 2000); 
    }
})