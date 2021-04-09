from flask import Blueprint, render_template, request, redirect
from database import mysql

# blueprint setup
create = Blueprint('create', __name__)

@create.route('/create')
def default():
    return render_template('/create.html')

@create.route('/createBook', methods=['POST'])
def createBook():
    # Fetch form data
    book = request.form
    name = book['name']
    genre = book['genre']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO books(BookTitle, Genre) VALUES(%s, %s)",(name, genre))
    mysql.get_db().commit()
    return redirect('/read')