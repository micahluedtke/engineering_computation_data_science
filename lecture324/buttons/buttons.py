from flask import Flask, render_template, request, redirect
from flaskext.mysql import MySQL
from flask_bootstrap import Bootstrap

def create_app():
    app = Flask(__name__)
    Bootstrap(app)
    return app

app = create_app()

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'bookbiz'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def index():
    return redirect('/read')

@app.route('/delete')
def delete():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM books WHERE BookID=%s",id)
    mysql.get_db().commit()
    return redirect('/read')

@app.route('/book')
def book():
    book = {}
    book['id'] = request.args.get('id')
    book['name'] = request.args.get('name')    
    return render_template('book.html', book=book)

@app.route('/update', methods=['POST'])
def add():
    book = request.form
    id = book['id']
    name = book['title']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE books SET name=%s WHERE BookID=%s",(name, id))
    mysql.get_db().commit()
    return redirect('/read')

@app.route('/read')
def read():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM books")
    html = ''    
    if response > 0:
        books = cursor.fetchall()
        return render_template('read.html', list=books)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)