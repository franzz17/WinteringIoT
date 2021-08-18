from flask import Flask, render_template, request, redirect, url_for, session
from flaskext.mysql import MySQL
from datetime import datetime
# import bcrypt

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'wintering'
app.config['MYSQL_PASSWORD'] = 'fdnm'
app.config['MYSQL_DB'] = 'users_db'
mysql.init_app(app)

mode = "index"

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

@app.route('/login', methods=['POST'])
def login():
    global mode
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

@app.route('/logout', methods=['POST'])
def logout():
    global mode
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
        date = now.strftime('%d/%m/%Y %H:%M:%S')
        cur = mysql.get_db().cursor()
        cur.execute('INSERT INTO users (name, lastname, email, password, date) VALUES (%s, %s, %s, %s, %s)', 
        (name, lastname, email, password, date))

    return 'received'

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

if __name__ == '__main__':
    app.run(debug=True)
