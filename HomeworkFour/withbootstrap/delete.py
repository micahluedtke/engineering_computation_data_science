from flask import Blueprint, request, redirect
from database import mysql

# blueprint setup
delete = Blueprint('delete', __name__)

@delete.route('/delete')
def default():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM books WHERE BookID=%s",id)
    mysql.get_db().commit()
    return redirect('/read')

@delete.route('/delete_author')
def delete_author():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM authors WHERE AuthorID=%s",id)
    mysql.get_db().commit()
    return redirect('/authors')

@delete.route('/delete_publisher')
def delete_publisher():
    id = request.args.get('id')
    cur = mysql.get_db().cursor()
    cur.execute("DELETE FROM publishers WHERE PublisherID=%s",id)
    mysql.get_db().commit()
    return redirect('/publishers')