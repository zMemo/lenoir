const parrafo = document.getElementById("warnings")
const formcontacto = document.getElementById("contacto")
const emailcontacto = document.getElementById("emailcontacto")
const asunto = document.getElementById("asunto")
const desc = document.getElementById("descripcion")
const modal_container = document.getElementById("modal_container");
const open = document.getElementById("open"); 
const close = document.getElementById("close");


formcontacto.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings = ""
    let entrar = false
    parrafo.innerHTML = ""
    let regexemail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    if(!regexemail.test(emailcontacto.value)){
        warnings += "El email no es valido <br>."
        entrar = true
    }
    if(asunto.value.length < 4){
        warnings += "El asunto es muy corto <br>."
        entrar = true
    }
    if(desc.value.length < 10){
        warnings += "El mensaje es muy corto <br>."
        entrar = true
    }
    if(entrar){
        parrafo.innerHTML = warnings;
    }else{
        parrafo.innerHTML = "Mensaje enviado..."
        modal_container.classList.add('show');
        setTimeout(() => {
            modal_container.classList.remove('show');
            window.location.href = "/lenoir/screens/client/index.html";
        }, 2000); 
    }
})

