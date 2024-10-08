function validateForm() {
    res = true
    var x = document.forms["myForm"]["fname"].value;
    if (x == null || x == "") {
        alert("Debe completar el campo 'Nombre'");
        res = false;
    }
    else {
        alert("TODO BIEN, se va a enviar la información");
    } 

    return res 
}
function validateForm107() {
    res = true
    var num03 = document.forms["myForm"]["num03"].value;
    var num01 = document.forms["myForm"]["num01"].value;

    if ((num03 == null || num03 == "") || (num01 == null || num01 == "")) {
        alert("Falta completar campos");
        res = false;
    }

    return res 
}


function validateForm108() {
    res = true
    var num03 = document.forms["myForm"]["num03"].value;
    var num04 = document.forms["myForm"]["num04"].value;

    if ((num03 == null || num03 == "") || (num04 == null || num04 == "")) {
        alert("Falta completar campos");
        res = false;
    }

    return res 
}



/*
function strSoloDigitos(str,cant){
    res=true
    var i;
    largo=str.length;
    for (var i = 0; i < largo; i++) { //recorremos cada caracter
        caracter = texto[i];
        if (caracter >= '0' && caracter <= '9') { //incrementando por cada dígito
            contador++;
        }
    }
    return res
}
*/