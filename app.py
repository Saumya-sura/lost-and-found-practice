from flask import Flask, render_template, request

app = Flask(__name__)

todos = []

@app.route("/")
def todo_list():
    return render_template("view.html", todos=todos)

@app.route("/add", methods=["POST"])
def add_todo():
    new_todo = request.form.get("new_todo")
    if new_todo:
        todos.append(new_todo)
    return render_template("view.html", todos=todos)

if __name__ == "__main__":
    app.run(debug=True)
