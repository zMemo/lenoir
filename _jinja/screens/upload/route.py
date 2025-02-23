from flask import render_template
from flask import redirect, url_for, request
from werkzeug.utils import secure_filename
from uuid import uuid4 
import os

def route(app):
    @app.route('/')
    def index():
            return render_template('/client/index.html')