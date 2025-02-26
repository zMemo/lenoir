''' info:
    ENRUTAMIENTO DE LA PETICIÓN  
    Recibe las peticiones http (get, post) de un cliente.
    Invoca a la función ("enruta") que resuelve la petición. 
    La función que resuelve la petición se encuentra en el 'controller'
    Envía una respuesta al cliente que realizó la petición. La respuesta
    a será un str que en la mayoría de los casos contiene html
    
    Dependencias:
    pip install Flask
    pip install Werkzeug

    Referencias:
    https://pypi.org/project/Flask/
    https://flask.palletsprojects.com/en/2.3.x/
    https://pythonbasics.org/flask-http-methods/
    https://pypi.org/project/Werkzeug/
'''
import os
from flask import Flask, render_template, request, redirect, session, flash, url_for 
from werkzeug.utils import secure_filename
from uuid import uuid4 
from appConfig import config
from controller import *

def route(app):
    #CLIENT ROUTE
    @app.route('/')
    def index():
        ''' Info:
            Carga la pagina del home
        '''
        param={} 
        return home_pagina(param)
    
    @app.route('/login')
    def login():
        ''' Info:
            Carga la pagina del home
        '''
        param={} 
        return login_pagina(param)
    
    @app.route('/header')
    def header():
        ''' Info:
            Carga la pagina del header
        '''
        param={} 
        return header_pagina(param)
    
    @app.route('/recibir_datos', methods=['POST', 'GET'])
    def formrecibir():
        direquest={}
        getRequest={direquest}
        upload_file=(direquest)
        return direquest
    
    #ADMIN ROUTE
    @app.route('/admin')
    def admin():
        return render_template('/admin/login.html')
        
    @app.route("/register")
    def register():
        ''' Info:
        Carga la pagina para el registro del usuario
        '''
        param={}
        return registro_pagina(param)  

    
    @app.route("/signup", methods =["GET", "POST"])
    def signup():
        ''' Info:
        Recepciona la solicitud request que es enviada
        desde el formulario de registro 
        registroDeUsuario: Luego de realizar el proceso de 
        registro del usuario, retorna la pagina del login 
        '''
        param={}
        return registrarUsuario(param,request)


    @app.route('/signin', methods =["GET", "POST"])
    def signin(): 
        ''' Info: 
        Recepciona la solicitud request que es enviada
        desde el formulario de login 
        retorna la pagina home en caso de exito 
        o la pagina login en caso de fracaso
        '''
        param={}
        return ingresoUsuarioValido(param,request)

    @app.route("/logout")
    def logout():  
        ''' Info: 
        Cierra la sesión.
        retorna la redirección a la pagina home   
        ''' 
        cerrarSesion()     
        return redirect('/')
    

    @app.route("/pagina01")
    def pag01():
        ''' Info:
        Carga la pagina 01
        Retorna la pagina 01, si hay sesion; sino retorna la home.
        '''
        param={}
        return pagina01(param)


    @app.route("/pagina02")
    def pag02():
        ''' Info:
        Carga la pagina 02
        Retorna la pagina 02, si hay sesion; sino retorna la home.
        '''
        param={}
        return pagina02(param)   


    @app.route("/edit_user")
    def edit_user():
        ''' Info:
        Carga la edit_user
        Retorna la edit_user, si hay sesion; sino retorna la home.
        '''
        param={}
        return editarUsuario_pagina(param)    

    @app.route("/update_user", methods =["GET", "POST"])
    def update_user():
        ''' Info:
        Recepciona la solicitud request que es enviada
        desde el formulario de edit_user 
        Retorna 
            si hay sesion: retorna la edit_user con los datos actualizados
            y un mensaje de exito o fracaso sobre el mismo form ; 
            si no hay sesion: retorna la home.
        '''
        param={}
        return actualizarDatosDeUsuarios(param,request)
    

    @app.route("/about")
    def about():
        ''' Info:
        Carga la pagina about
        '''
        param={}
        return acercaDe_pagina(param)      
        
def getRequest(diResult):
    if request.method=="post":
        for name in request.form.to_dict().keys():
            li=request.form.getlist(name)
            if len(li)>1:
                diResult[name]=request.form.getlist(name)
            elif len(li)==1:
                diResult[name]=li[0]
            else:    
                diResult[name]=None
    elif request.method=="get":
        for name in request.args.to_dict().keys():
            li=request.args.getlist(name)
            if len(li)>1:
                diResult[name]=request.args.getlist(name)
            elif len(li)==1:
                diResult[name]=li[0]
            else:    
                diResult[name]=""

