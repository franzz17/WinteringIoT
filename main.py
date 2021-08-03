from typing import NoReturn
from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from datetime import datetime
import bcrypt

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'main_db'
mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    if request.method == 'POST':
        user = request.form['user']
        password_user = request.form['password_user']
        print(user)
        print(password_user)
    return 'received'

@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        lastname = request.form['lastname']
        email = request.form['email']
        password = request.form['password']
        # password_con = request.form['password_con']
        # if password == password_con:
        now = datetime.now()
        date = now.strftime('%d/%m/%Y %H:%M:%S')
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO users (name, lastname, email, password, date) VALUES (%s, %s, %s, %s, %s)', 
        (name, lastname, email, password, date))
        mysql.connection.commit()

    return 'received'

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

if __name__ == '__main__':
    app.run(debug=True)
