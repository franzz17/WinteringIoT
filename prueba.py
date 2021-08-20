from os import close
from flask import Flask, render_template, request, redirect, url_for, session
from flaskext.mysql import MySQL
from flask_mqtt import Mqtt
from datetime import datetime
import json
# import bcrypt

app = Flask(__name__)

mysql = MySQL()
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'tesla'
app.config['MYSQL_DATABASE_PASSWORD'] = 'fdnm'
app.config['MYSQL_DATABASE_DB'] = 'usersdb'
mysql.init_app(app)

mqtt = Mqtt()
app.config['MQTT_BROKER_URL'] = 'localhost'
app.config['MQTT_BROKER_PORT'] = 1883
app.config['MQTT_USERNAME'] = 'user'
app.config['MQTT_PASSWORD'] = 'secret'
app.config['MQTT_REFRESH_TIME'] = 1.0  # refresh time in seconds
mqtt.init_app(app)

mode = "index"
data = json.dumps(mode)

@app.route('/', methods=['GET'])
def index():
    global mode
    if mode == "index" or mode == "logout":
        print('index')
        return render_template('index.html')
    if mode == "True":
        print('login to dashboard')
        mode = "True"
        return render_template('dashboard.html')
    elif mode == "False":
        print('no valido')
        mode = "index"
        return render_template('novalidation1.html')

@app.route('/login', methods=['GET','POST'])
def login():
    global mode
    if request.method == 'GET':
        mode == "index"
    if request.method == 'POST':
        user = request.form['user']
        password_user = request.form['password_user']   
        print(user)
        print(password_user)
        if user == "frankingenio@gmail.com":
            mode = "True"
        else:
            mode = "False"
    return redirect(url_for('index'))

@app.route('/logout', methods=['GET','POST'])
def logout():
    global mode
    if request.method == 'GET':
        mode == "index"
    if request.method == 'POST':
        mode = "logout"
    return redirect(url_for('index'))

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
        date = now.strftime('%d/%m/%Y %H:%M:%S') + " UTC -5"
        cur = mysql.get_db().cursor()
        cur.execute('INSERT INTO users (name, lastname, email, password, date) VALUES (%s, %s, %s, %s, %s)', 
        (name, lastname, email, password, date))
        new_user = "CREATE OR REPLACE DATABASE " + email[:email.index('@')]
        table_temp_i = "CREATE TABLE temp_i (time VARCHAR(63) NOT NULL, temp_i INT(4)) ENGINE MyISAM"
        table_temp_e = "CREATE TABLE temp_e (time VARCHAR(63) NOT NULL, temp_e INT(4)) ENGINE MyISAM"
        table_hum_i = "CREATE TABLE hum_i (time VARCHAR(63) NOT NULL, hum_i INT(4)) ENGINE MyISAM"
        table_hum_e = "CREATE TABLE hum_e (time VARCHAR(63) NOT NULL, hum_e INT(4)) ENGINE MyISAM"
        table_hum_s = "CREATE TABLE hum_s (time VARCHAR(63) NOT NULL, hum_s INT(4)) ENGINE MyISAM"
        table_level = "CREATE TABLE level (time VARCHAR(63) NOT NULL, level INT(4)) ENGINE MyISAM"
        cur.execute(new_user)
        use_db = "USE " + email[:email.index('@')]
        cur.execute(use_db)
        cur.execute(table_temp_i)
        cur.execute(table_temp_e)
        cur.execute(table_hum_i)
        cur.execute(table_hum_e)
        cur.execute(table_hum_s)
        cur.execute(table_level)
        # cur.execute('SELECT * FROM users')
        # usuario_ingresado = cur.fetchall()
        # print(usuario_ingresado)
    return 'received'

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

if __name__ == '__main__':
    app.run(debug=True)