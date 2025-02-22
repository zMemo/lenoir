//login
const username = document.getElementById("username")
const password = document.getElementById("password")
const form = document.getElementById("form")
const parrafo = document.getElementById("warnings")

form.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings = ""
    let entrar = false
    parrafo.innerHTML = ""
    if(username.value.length <6){
        warnings += "el nombre no es valido <br>"
        entrar = true
    }
    if(password.value.length<8){
        warnings += "la contraseña no es valida <br>"
        entrar  = true
    }
    if(entrar){
        parrafo.innerHTML = warnings
    }else{
        parrafo.innerHTML = "Bienvenido..."
    }
})


//login



//    if(regexEmail.test(email.value)){
//        warnings += "El email no es valido <br>"
//        entrar = true
//    }
