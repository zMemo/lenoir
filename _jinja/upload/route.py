from flask import render_template
from flask import redirect, url_for, request
from werkzeug.utils import secure_filename
from uuid import uuid4 
from appConfig import config
import os

def route(app):
    #CLIENT ROUTE
    @app.route('/')
    def index():
        return render_template('client/index.html')
            
    @app.route('/login')
    def login():
        return render_template('client/login.html')
    
    @app.route('/recibir_datos', methods=['POST', 'GET'])
    def formrecibir():
        direquest={}
        getRequest={direquest}
        upload_file=(direquest)
        return direquest
    
    @app.route('/register')
    def register():
            return render_template('/client/register.html')
    #ADMIN ROUTE
    @app.route('/admin')
    def admin():
            return render_template('/admin/login.html')
        
        
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