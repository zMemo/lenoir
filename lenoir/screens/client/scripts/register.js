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
        warnings += "el nombre no es valido <br>"
        entrar = true
    }
    if(user.value.length <6){
        warnings += "el usuario no es valido <br>"
        entrar = true
    }
    if(numero.value.length<9){
        warnings += "el numero no es valido <br>"
        entrar = true
    }
    if(!regexEmail.test(email.value)){
        warnings += "el email no es valido <br>"
        entrar = true
    }
    if(registerpassword.value.length <8){
        warnings += "tiene que tener 8 caracteres <br>"
        entrar = true
    }
    if(registerpassword.value != repeatpassword.value){
        warnings += "la contraseñas son distintas <br>"
        entrar = true
    }
    if(entrar){
        parrafo.innerHTML = warnings
    }else{
        parrafo.innerHTML = "registrandote..."
    }
})