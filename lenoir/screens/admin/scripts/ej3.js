const COLOR_FONDO_ERROR = '#FFB6C1 ';//rgb(128,128,128);//#00FF00;
const COLOR_FONDO_NORMAL = '#FFFFFF';
const COLOR_FONDO_EDICION = ' #DCDCDC ';

/***********EXPRESIONES REGULARES****************/

const RE_NUM_3ENTERO = /^\d{1,3}$/;
const RE_NUM_4ENTERO = /^\d{1,4}$/;
const RE_NUM_2ENT2DEC = /(?!^0*\.0*$)^\d{1,2}(\.\d{1,2})?$/; // xx.xx   Numero REAL(2 digitos entero con 2 digitos decimales)

const RE_VACIO = /^\s*$/;//segun http://msdn.microsoft.com/es-es/library/ae5bf541%28v=vs.90%29.aspx 
//Coincide con una línea en blanco.


function validarNum1(miID) {
    var x, text;
    editandoColorFondo(miID);
    x = document.getElementById(miID).value;

  // isNaN = "is Not a Number"
    if (isNaN(x) || x < 1 || x > 10) {
    text = "error: Verificar";
    errorColorFondo(miID);
    } else {
    text = "";
    normalColorFondo(miID)
    }
    document.getElementById("error1").innerHTML = text;

}

function validarNum2(miID, min, max) {
    var x, text;
    editandoColorFondo(miID);
    x = document.getElementById(miID).value;

  // isNaN = "is Not a Number"
    if (isNaN(x) || x < min || x > max || x % 2 == 1) {
    text = "error: Verificar";
    errorColorFondo(miID);
    } else {
    text = "";
    normalColorFondo(miID)
    }
    document.getElementById("error2").innerHTML = text;

}

function errorColorFondo(miID) {
    document.getElementById(miID).style.backgroundColor = COLOR_FONDO_ERROR;
}

function errorColorFondo(miID) {
  //alert("entrar");
    document.getElementById(miID).style.backgroundColor = COLOR_FONDO_ERROR;
}

function normalColorFondo(miID) {
  //alert("entrar");
    document.getElementById(miID).style.backgroundColor = COLOR_FONDO_NORMAL;
}
function editandoColorFondo(miID) {
    document.getElementById(miID).style.backgroundColor = COLOR_FONDO_EDICION;
}

/***********EXPRESIONES REGULARES****************/

function esEntero(miID) {
var patron = RE_NUM_3ENTERO;//   /^\d{1,3}$/

var contenido = document.getElementById(miID).value;
  //alert(patron.test(contenido) + "cont: "+ contenido);

return esVacio(miID) || patron.test(contenido);
}



function es2Ent2Dec(miID) {
var patron = RE_NUM_2ENT2DEC;
var contenido = document.getElementById(miID).value;
return esVacio(miID) || patron.test(contenido);
}

function esVacio(miID) {
var patron = RE_VACIO;//segun http://msdn.microsoft.com/es-es/library/ae5bf541%28v=vs.90%29.aspx 
  //Coincide con una línea en blanco.

var contenido = document.getElementById(miID).value;
return patron.test(contenido);
}


function validarEscrituraNum3(miID) {
var valido;
if (esEntero(miID)) {
    editandoColorFondo(miID);
    valido = true;
}
else {
    errorColorFondo(miID)
    valido = false;
}
return valido;
}

function validarNum3(miID) {
var valido;
if (esEntero(miID)) {
    normalColorFondo(miID);
    valido = true;
}
else {
    errorColorFondo(miID)
    valido = false;
}
return valido;
}

function validarNum4(miID) {
var valido;

if (es2Ent2Dec(miID)) {
    normalColorFondo(miID);
    valido = true;
}
else {
    errorColorFondo(miID)
    valido = false;
}
return valido;
}