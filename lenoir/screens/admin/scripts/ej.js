document.onmousemove = informacion;
document.onkeypress = informacion; 
document.onclick = informacion;

function informacion(elEvento) {
var evento = elEvento || window.event;
switch(evento.type) 
{
    case 'mousemove':
     // document.getElementById('info').style.backgroundColor = '#FFFFFF';
    var ie = navigator.userAgent.toLowerCase().indexOf('msie')!=-1;
      //alert(navigator.userAgent.toLowerCase().indexOf('msie'))
    var coordenadaXrelativa, coordenadaYrelativa, coordenadaXabsoluta, coordenadaYabsoluta;
    if(ie) {
        if(document.documentElement && document.documentElement.scrollTop){ 
        
        coordenadaXabsoluta = evento.clientX + document.documentElement.scrollLeft;
        coordenadaYabsoluta = evento.clientY + document.documentElement.scrollTop;
        }
        else {
    
        coordenadaXabsoluta = evento.clientX + document.body.scrollLeft;
        coordenadaYabsoluta = evento.clientY + document.body.scrollTop;
        }
    }
    else {
        coordenadaXabsoluta = evento.pageX;
        coordenadaYabsoluta = evento.pageY;
    }
    coordenadaXrelativa = evento.clientX;
    coordenadaYrelativa = evento.clientY;
    muestraInformacion(['Ratón', 'Navegador ['+coordenadaXrelativa+', '+coordenadaYrelativa+']', 'Pagina ['+coordenadaXabsoluta+', '+coordenadaYabsoluta+']']);
    break;
    case 'keypress':
    
    document.getElementById('info').style.backgroundColor = '#CCE6FF';
    var caracter = evento.charCode || evento.keyCode;
    alert(evento.charCode +" ,"+  evento.keyCode);
      //var letra = String.fromCharCode(caracter);
    var codigo = letra.charCodeAt(0);
    muestraInformacion(['Teclado', 'Carácter ['+letra+']', 'Código ['+codigo+']']);
    
      //alert(evento.type);
    break;
    case 'click':
    document.getElementById('info').style.backgroundColor = '#FFFFCC';
      //alert(evento.type);
    break;
}
}


function muestraInformacion(mensaje) {
document.getElementById("info").innerHTML = '<h1>'+mensaje[0]+'</h1>';
for(var i=1; i<mensaje.length; i++) {
    document.getElementById("info").innerHTML += '<p>'+mensaje[i]+ 'x'+'</p>';
}
}


