from flask import Blueprint, render_template, request, redirect
from database import mysql

# blueprint setup
update = Blueprint('update', __name__)

@update.route('/update')
def default():
    book = {}
    book['id'] = request.args.get('id')
    book['name'] = request.args.get('name')    
    return render_template('update.html', book=book)

@update.route('/updateBook', methods=['POST'])
def updateBook():
    book = request.form
    id = book['id']
    name = book['bookTitle']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE books SET BookTitle=%s WHERE BookID=%s",(name, id))
    mysql.get_db().commit()
    return redirect('/read')