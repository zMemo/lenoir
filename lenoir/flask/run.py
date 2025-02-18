from flask import Flask
def main():
    app = Flask(__name__)
    @app.route('/')
    def home():
        return 'Hello, World!'
    @app.route("/login")
    def login():
        return "este es el login"
    app.run()