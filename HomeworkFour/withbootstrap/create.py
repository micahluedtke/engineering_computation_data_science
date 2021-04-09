from flask import Blueprint, render_template, request, redirect
from database import mysql

# blueprint setup
create = Blueprint('create', __name__)

@create.route('/create')
def default():
    return render_template('/create/book.html')

@create.route('/new_author')
def new_author():
    return render_template('/create/author.html')

@create.route('/new_publisher')
def new_publisher():
    return render_template('/create/publisher.html')

@create.route('/createBook', methods=['POST'])
def createBook():
    # Fetch form data
    book = request.form
    title = book['title']
    genre = book['genre']
    pubyear = book['pubyear']
    price = book['price']
    royalty = book['royalty']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO books(BookTitle, Genre, PublicationYear, Price, RoyaltyPayment) VALUES(%s, %s, %s, %s, %s)", (title, genre, pubyear, price, royalty))
    mysql.get_db().commit()
    return redirect('/read')

@create.route('/createAuthor', methods=['POST'])
def createAuthor():
    # Fetch form data
    author = request.form
    fname = author['fname']
    lname = author['lname']
    country = author['country']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO authors(FirstName, LastName, Country) VALUES(%s, %s, %s)",(fname, lname, country))
    mysql.get_db().commit()
    return redirect('/authors')

@create.route('/createPublisher', methods=['POST'])
def createPublisher():
    # Fetch form data
    publisher = request.form
    pname = publisher['pname']
    city = publisher['city']
    region = publisher['region']
    country = publisher['country']
    cur = mysql.get_db().cursor()
    cur.execute("INSERT INTO publishers(PublisherName, City, Region, Country) VALUES(%s, %s, %s, %s)",(pname, city, region, country))
    mysql.get_db().commit()
    return redirect('/publishers')