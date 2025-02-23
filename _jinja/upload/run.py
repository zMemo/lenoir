# https://flask.palletsprojects.com/en/stable/
# https://pythonbasics.org/flask-http-methods/

from flask import Flask, session
from route import route

def main():
    app = Flask(__name__, template_folder='templates' , static_folder='static')
    
    #CONFIG SESSION
    #PARA PODER INICIAR, PONER ALGO RANDOM
    app.config['SECRET_KEY'] = "random"
    #CONFIG MAX SIZE UPLOAD
    app.config['MAX_CONTENT_PATH'] = 1000
    
    route(app)
    app.run('0.0.0.0', 5000, debug=True)
main()