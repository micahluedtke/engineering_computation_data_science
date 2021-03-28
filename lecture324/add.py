# imports
from flask import Flask, render_template, request, redirect
from flaskext.mysql import MySQL

# web application
app = Flask(__name__)

# connect to db
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'bookbiz'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def index():
    return render_template('/index.html')

@app.route('/add_book', methods=['GET','POST'])
def add_book():
    # Fetch form data
    if request.method =='POST':
        book = request.form
        name = book['name']
        cur = mysql.get_db().cursor()
        cur.execute("INSERT INTO Books(BookTitle) VALUES(%s)",(name))
        mysql.get_db().commit()
        return redirect('/books')
    else:
        return render_template('index.html')

@app.route('/add_author', methods=['GET','POST'])
def add_author():
    # Fetch form data
    if request.method =='POST':
        author = request.form
        firstname = author['firstname']
        lastname = author['lastname']
        country = author['country']
        cur = mysql.get_db().cursor()
        cur.execute("INSERT INTO Authors(FirstName, LastName, Country) VALUES(%s, %s, %s)" ,(firstname, lastname,country))
        mysql.get_db().commit()
        return redirect('/authors')
    else:
        return render_template('index_author.html')

@app.route('/books')
def books():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Books")
    html = ''    
    if response > 0:
        books = cursor.fetchall()
        return render_template('books.html', list=books)

@app.route('/authors')
def authors():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Authors")
    html = ''    
    if response > 0:
        authors = cursor.fetchall()
        return render_template('authors.html', list=authors)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)

    