from flask import render_template
from flask import redirect, url_for, request
from werkzeug.utils import secure_filename
from appConfig import config
from uuid import uuid4 
import os

def route(app):
    @app.route('/')
    def index():
        return render_template('index.html')
    
    @app.route('/login')
    def login():
        return render_template('login.html')
    
    @app.route('/recibir_datos', methods=['POST', 'GET'])
    def recibir_datos():
        if request.method == 'POST':
            nombre = request.form['nombre']
            edad = request.form['edad']
            return render_template('datos.html', nombre=nombre, edad=edad)
        else:
            return redirect(url_for('index'))
