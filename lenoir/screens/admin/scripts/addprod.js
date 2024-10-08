const formprod = document.getElementById("addprod")
const parrafo = document.getElementById("warnings")
const producto = document.getElementById("producto")
const precio = document.getElementById("precio")
const stock = document.getElementById("stock")
const marca = document.getElementById("marca")
const categoria = document.getElementById("categoria")
const warnings = document.getElementById("warnings")

formlogin.addEventListener("submit", e=>{
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
        parrafo.innerHTML = "ingresando..."
    }
})