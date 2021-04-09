from flask import Flask, render_template, redirect, request
from flaskext.mysql import MySQL

app = Flask(__name__)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'bookbiz'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/delete')
def delete():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM books WHERE BookID=%s",id)
    mysql.get_db().commit()
    return redirect('/booklist')

@app.route('/delete_author')
def delete_author():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM authors WHERE AuthorID=%s",id)
    mysql.get_db().commit()
    return redirect('/authorlist')

@app.route('/book')
def book():
    book = {}
    book['id'] = request.args.get('id')
    book['name'] = request.args.get('name') 
    book['genre'] = request.args.get('genre') 
    book['pubyear'] = request.args.get('pubyear') 
    return render_template('edit_book.html', book=book)

@app.route('/author')
def author():
    author = {}
    author['id'] = request.args.get('id')
    author['name'] = request.args.get('name') 
    author['genre'] = request.args.get('genre') 
    author['pubyear'] = request.args.get('pubyear') 
    return render_template('edit_author.html', author=author)

@app.route('/edit', methods=['GET','POST'])
def add():
    book = request.form
    id = book['id']
    name = book['title']
    genre  = book['genre']
    pubyear = book['pubyear']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE books SET BookTitle=%s, Genre=%s, PublicationYear=%s WHERE BookID=%s",(name, genre, pubyear, id))
    mysql.get_db().commit()
    return redirect('/')

@app.route('/edit_author', methods=['GET','POST'])
def edit_author():
    author = request.form
    id = author['id']
    name = author['title']
    genre  = author['genre']
    pubyear = author['pubyear']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE Authors SET FirstName=%s, LastName=%s, Country=%s WHERE AuthorID=%s",(name, genre, pubyear, id))
    mysql.get_db().commit()
    return redirect('/authorlist')


@app.route('/booklist')
def booklist():
    cursor = mysql.get_db().cursor()
    query = "SELECT BookID, BookTitle, Genre, PublicationYear, Price, RoyaltyPayment, concat(FirstName, ' ', LastName) as Author FROM Books b LEFT JOIN Authors a ON b.authorID = a.authorID"
    response = cursor.execute(query)
    html = ''    
    if response > 0:
        books = cursor.fetchall()
        return render_template('list_book.html', list=books)

@app.route('/authorlist')
def authorlist():
    cursor = mysql.get_db().cursor()
    query = "SELECT * FROM Authors"
    response = cursor.execute(query)
    html = ''    
    if response > 0:
        authors = cursor.fetchall()
        return render_template('list_author.html', list=authors)

# start server
if __name__ == '__main__':
    app.run(debug=True, port=3000)