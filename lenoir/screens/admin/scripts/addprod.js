const formprod = document.getElementById("addprod")
const parrafo = document.getElementById("warnings")
const producto = document.getElementById("producto")
const precio = document.getElementById("precio")
const stock = document.getElementById("stock")
const marca = document.getElementById("marca")
const categoria = document.getElementById("categoria")

formprod.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings = ""
    let entrar = false
    let regprecio = /^[0-9]{1,8}$/
    parrafo.innerHTML = ""
    if(producto.value.length<1){
        warnings += "campo producto esta vacio <br>"
        entrar = true
    }
    if(marca.value.length<1){
        warnings += "campo marca esta vacio <br>"
        entrar  = true
    }
    if(!regprecio.test(precio.value)){
        warnings += "precio no valido <br>"
        entrar  = true
    }
    if(stock.value.length<1){
        warnings += "campo stock no valido <br>"
        entrar  = true
    }
    if (categoria.value.length <1) {
        warnings += "campo categoria esta vacio <br>"
        entrar = true
    }
    if(entrar){
        parrafo.innerHTML = warnings
    }else{
        parrafo.innerHTML = "ingresando..."
    }
})