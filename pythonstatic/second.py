from flask import Blueprint,render_template 
second = Blueprint("secod",__name__,static_folder="static",template_folder="templates")

@second.route("/home")

def home():
    return render_template("home.html")
