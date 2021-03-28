# imports
from flask import Flask
from flaskext.mysql import MySQL
from desktop import example

# web application
app = Flask(__name__)


# connect to db
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'bookbiz'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)


@app.route('/books')

def books():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM Books")
    html = ''   
    if response > 0:
        books = cursor.fetchall()
        for book in books:
            html += book[1] + '<br/>'
        return html + example()

# start server

if __name__ == '__main__':
    app.run(debug=True)

