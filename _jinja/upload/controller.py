from flask import request, session, redirect, render_template
from datetime import datetime
from model import *
from werkzeug.utils import secure_filename
import os
from uuid import uuid4
from appConfig import config


# session
def uploadSession(dicUsuario):
    '''info
        realiza la carga de la sesion del usuario
        en la variable global dict 'session'
        recibe 'dicUsuario' con la informacion del usuario
    '''
    session['id_usuario']  = dicUsuario['id']
    session['nombre']      = dicUsuario['nombre']
    session['apellido']    = dicUsuario['apellido']
    session['username']    = dicUsuario['username']
    session['imagen']      = ""
    session['rol']         = ""
    session['time']        = datetime.now()

def createSession(request):
    pass

def haySession():
    pass

    
def closeSession():
    pass