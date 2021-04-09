from flask import Blueprint, render_template, request, redirect
from database import mysql

# blueprint setup
update = Blueprint('update', __name__)

@update.route('/update')
def default():
    book = {}
    book['id'] = request.args.get('id')
    book['title'] = request.args.get('title') 
    book['genre'] = request.args.get('genre')
    book['pubyear'] = request.args.get('pubyear')
    book['price'] = request.args.get('price')
    book['royalty'] = request.args.get('royalty')   
    return render_template('update/update.html', book=book)

@update.route('/edit_author')
def edit_author():
    author = {}
    author['id'] = request.args.get('id')
    author['fname'] = request.args.get('fname') 
    author['lname'] = request.args.get('lname')
    author['country'] = request.args.get('country') 
    return render_template('/update/author.html', author=author)

@update.route('/edit_publisher')
def edit_publisher():
    publisher = {}
    publisher['id'] = request.args.get('id')
    publisher['pname'] = request.args.get('pname')
    publisher['city'] = request.args.get('city')
    publisher['region'] = request.args.get('region')
    publisher['country'] = request.args.get('country')
    return render_template('/update/publisher.html', publisher=publisher)

@update.route('/updateBook', methods=['POST'])
def updateBook():
    book = request.form
    id = book['id']
    title = book['title']
    genre = book['genre']
    pubyear = book['pubyear']
    price = book['price']
    royalty = book['royalty']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE books SET BookTitle=%s, Genre=%s, PublicationYear=%s, Price=%s, RoyaltyPayment=%s WHERE BookID=%s",(title, genre, pubyear, price, royalty, id))
    mysql.get_db().commit()
    return redirect('/read')

@update.route('/updateAuthor', methods=['POST'])
def updateAuthor():
    author = request.form
    id = author['id']
    fname = author['fname']
    lname = author['lname']
    country = author['country']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE authors SET FirstName=%s,  LastName=%s,  Country=%s WHERE AuthorID=%s",(fname, lname, country, id))
    mysql.get_db().commit()
    return redirect('/authors')

@update.route('/updatePublisher', methods=['POST'])
def updatePublisher():
    publisher = request.form
    id = publisher['id']
    pname = publisher['pname']
    city = publisher['city']
    region = publisher['region']
    country = publisher['country']
    cur = mysql.get_db().cursor()
    cur.execute("UPDATE publishers SET PublisherName=%s, City=%s, Region=%s, Country=%s WHERE PublisherID=%s",(pname, city, region, country, id))
    mysql.get_db().commit()
    return redirect('/publishers')