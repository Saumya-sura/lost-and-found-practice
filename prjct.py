from flask import Flask, redirect, url_for, render_template, request, session, flash
from datetime import timedelta
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = "your_secure_key"  # Replace with a strong, random secret key
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.sqlite3'
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.permanent_session_lifetime = timedelta(minutes=5)

db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))

    # Relationship with tasks table (one-to-many)
    tasks = db.relationship('Task', backref='user', lazy='dynamic')  # Adjust relationship options as needed

class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    task = db.Column(db.String(100))
    completed = db.Column(db.Boolean)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/login", methods=["POST", "GET"])
def login():
    if request.method == "POST":
        session.permanent = True
        user = request.form["nm"]
        # Simpler user association (not secure for production)
        session["username"] = user

        found_user = User.query.filter_by(name=user).first()
        if not found_user:
            new_user = User(name=user)
            db.session.add(new_user)
            db.session.commit()

        flash("Login successful!")
        return redirect(url_for("view_tasks"))
    else:
        if "username" in session:
            flash("Already logged in")
            return redirect(url_for("view_tasks"))
        return render_template("login.html")

@app.route("/view-tasks")
def view_tasks():
    if "username" not in session:  # Check for logged-in user
        return redirect(url_for('login'))

    # Retrieve tasks for the logged-in user (assuming session['username'] is the name)
    logged_in_user = User.query.filter_by(name=session["username"]).first()
    if not logged_in_user:
        return redirect(url_for('login'))  # Handle case where user is not found in database

    tasks = logged_in_user.tasks.filter_by(completed=False).all()  # Filter for incomplete tasks
    return render_template("view_tasks.html", tasks=tasks)

@app.route("/add-task", methods=["POST"])
def add_task():
    if "username" not in session:  # Check for logged-in user
        return redirect(url_for('login'))

    logged_in_user = User.query.filter_by(name=session["username"]).first()
    if not logged_in_user:
        return redirect(url_for('login'))  # Handle case where user is not found in database

    new_task = Task(task=request.form['new_task'], user=logged_in_user)
    db.session.add(new_task)
    db.session.commit()
    flash("Task added successfully!")
    return redirect(url_for("view_tasks"))

# ... (similar routes for marking tasks complete, editing, deleting, etc.)
    