from flask import render_template
from flask import redirect, url_for, request
from werkzeug.utils import secure_filename
from uuid import uuid4 
import os

def route(app):
    #CLIENT ROUTE
    @app.route('/')
    def index():
            return render_template('/client/index.html')
            
    @app.route('/login')
    def login():
            return render_template('/client/login.html')
        
    @app.route('/register')
    def register():
            return render_template('/client/register.html')
    #ADMIN ROUTE
    @app.route('/admin')
    def admin():
            return render_template('/admin/login.html')