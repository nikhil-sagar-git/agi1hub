from flask import Flask, render_template, request, redirect, flash, session, url_for
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)

# Secret key for sessions
app.secret_key = "your_secret_key"

# MySQL configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'chanitha@143'  # Replace with your MySQL password
app.config['MYSQL_DB'] = 'agrihub123'

mysql = MySQL(app)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/aboutnew")
def aboutnew():
    return render_template("aboutnew.html")
@app.route("/communitynew")
def communitynew():
    return render_template("communitynew.html")
@app.route("/supportnew")
def supportnew():
    return render_template("supportnew.html")
@app.route("/indexnew")
def homenew():
    return render_template("indexnew.html")





@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/community")
def community():
    return render_template("community.html")

@app.route("/support")
def support():
    return render_template("support.html")

@app.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        password = request.form["password"]
        confirm_password = request.form["confirm-password"]

        # Password mismatch check
        if password != confirm_password:
            flash("Passwords do not match.", "danger")
            return redirect(url_for("signup"))

        # Hash the password
        hashed_password = generate_password_hash(password)

        # Insert user into the database
        try:
            cur = mysql.connection.cursor()
            cur.execute(
                "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                (username, email, hashed_password),
            )
            mysql.connection.commit()
            cur.close()

            # Log the user in after successful signup
            session["email"] = email
            flash("Signup successful! You are now logged in.", "success")
            return redirect(url_for("login"))
        except Exception as e:
            flash(f"Error during signup: {e}", "danger")
            return redirect(url_for("signup"))

    return render_template("signup.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form["email"]
        password = request.form["password"]

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE email = %s", (email,))
        user = cur.fetchone()
        cur.close()

        if user and check_password_hash(user[3], password):
            session["user_id"] = user[0]
            session["username"] = user[1]
            flash("Welcome back!", "success")
            return redirect(url_for("crop_choices"))
        else:
            flash("Invalid email or password.", "danger")
            return redirect(url_for("login"))

    return render_template("login.html")

@app.route("/crop_choices", methods=["GET", "POST"])
def crop_choices():
    if request.method == "POST":
        crop = request.form["crop"]
        soil = request.form["soil"]

        # Fetch crop information based on selected crop and soil type
        cur = mysql.connection.cursor()
        cur.execute(
            "SELECT * FROM crop_info WHERE crop_name = %s AND soil_type = %s",
            (crop, soil)
        )
        crop_info = cur.fetchone()
        cur.close()

        if crop_info:
            # Pass crop info to the template
            return render_template("crop_info.html", crop_info=crop_info)
        else:
            flash("No information found for the selected crop and soil type.", "danger")
            return redirect(url_for("crop_choices"))

    return render_template("crop_choices.html")

@app.route("/logout")
def logout():
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for("home"))

if __name__ == "__main__":
    app.run(debug=True)
