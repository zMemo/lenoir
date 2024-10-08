const parrafo = document.getElementById("warnings")
const formcontacto = document.getElementById("contacto")
const emailcontacto = document.getElementById("emailcontacto")
const asunto = document.getElementById("asunto")
const desc = document.getElementById("descripcion")


formcontacto.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings = ""
    let entrar = false
    parrafo.innerHTML = ""
    let regexemail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    if(!regexemail.test(emailcontacto.value)){
        warnings += "el email no es valido <br>"
        entrar = true
    }
    if(asunto.value.length < 4){
        warnings += "el asunto es muy corto <br>"
        entrar = true
    }
    if(desc.value.length < 10){
        warnings += "el mensaje es muy corto <br>"
        entrar = true
    }
    if(entrar){
        parrafo.innerHTML = warnings;
    }else{
        parrafo.innerHTML = "Mensaje enviado..."
    }
})