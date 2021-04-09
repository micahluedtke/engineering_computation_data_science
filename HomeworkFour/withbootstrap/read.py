from flask import Blueprint, render_template
from database import mysql

# blueprint setup
read = Blueprint('read', __name__)

@read.route('/read')
def default():
    cursor = mysql.get_db().cursor()
    query = "SELECT BookID, BookTitle, Genre, PublicationYear, Price, RoyaltyPayment, concat(FirstName, ' ', LastName) as Author, PublisherName FROM Books b LEFT JOIN Authors a ON b.authorID = a.authorID LEFT JOIN Publishers p ON b.PublisherID = p.PublisherID"
    response = cursor.execute(query)
    if response > 0:
        books = cursor.fetchall()
        return render_template('read/index.html', list=books)

@read.route('/authors')
def authors():
    cursor = mysql.get_db().cursor()
    query = query = "SELECT * FROM Authors"
    response = cursor.execute(query)
    if response > 0:
        authors = cursor.fetchall()
        return render_template('read/author.html', list=authors)

@read.route('/publishers')
def publishers():
    cursor = mysql.get_db().cursor()
    query = query = "SELECT * FROM Publishers"
    response = cursor.execute(query)
    if response > 0:
        publishers = cursor.fetchall()
        return render_template('read/publisher.html', list=publishers)
