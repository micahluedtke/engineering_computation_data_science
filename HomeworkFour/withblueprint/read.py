from flask import Blueprint, render_template
from database import mysql

# blueprint setup
read = Blueprint('read', __name__)

@read.route('/read')
def default():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM books")
    if response > 0:
        books = cursor.fetchall()
        return render_template('index.html', list=books)