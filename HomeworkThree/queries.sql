-- --------------------------------------
--  BOOK BUSINESS QUERIES
-- --------------------------------------

-- --------------------------------------
--  7.1 Books per author
-- --------------------------------------
SELECT FirstName, LastName, BookTitle
FROM Authors a
JOIN Books b
	ON a.authorID = b.authorID
-- --------------------------------------
--  7.2 Authors per book
-- --------------------------------------
SELECT BookTitle, FirstName, LastName
FROM Books b
JOIN Authors a
	ON  b.authorID = a.authorID

-- --------------------------------------
--  7.3 Author royalties on book
-- --------------------------------------
SELECT FirstName, LastName, BookTitle, Price, RoyaltyPayment, Round((RoyaltyPayment * Price),2) as PerSale
FROM Authors a
JOIN Books b
	ON a.authorID = b.authorID
ORDER BY LastName, FirstName, BookTitle

-- --------------------------------------
--  7.4 Book royalties per author
-- --------------------------------------
SELECT CONCAT(LastName, ", ", FirstName) as AuthorName, round(sum(Price *RoyaltyPayment*Quantity),2) as TotalRoyalties
FROM Authors a
JOIN Books b
	ON a.AuthorID = b.AuthorID
JOIN OrderDetails od
	ON b.BookID = od.BookID
GROUP BY AuthorName
ORDER BY AuthorName

-- --------------------------------------
--  7.5 Books in a genre
-- --------------------------------------
SELECT Genre, Booktitle
FROM Books
ORDER BY Genre

-- --------------------------------------
--  7.6 Books published by a publisher
-- --------------------------------------
SELECT PublisherName, BookTitle 
FROM Books b
JOIN Publishers p 
	ON b.PublisherID = p.PublisherID
ORDER BY PublisherName

-- --------------------------------------
--  7.7 Editor per book
-- --------------------------------------
SELECT EditorName, BookTitle
FROM Editors e
JOIN Books b
	ON e.editorID = b.editorID
ORDER BY EditorName

-- --------------------------------------
--  7.8 Books per editor
-- --------------------------------------
SELECT BookTitle, EditorName
FROM Books b
JOIN Editors e
	ON b.editorID = e.editorID
ORDER BY BookTitle

-- --------------------------------------
--  7.9 Books in an order
-- --------------------------------------
SELECT o.OrderID, BookTitle, Quantity
FROM Orders o
JOIN OrderDetails od
	ON o.OrderID = od.OrderID
JOIN Books b
	ON  od.BookID = b.BookID
ORDER BY o.OrderID

-- --------------------------------------
--  7.10 Orders for a book
-- --------------------------------------
SELECT BookTitle, sum(Quantity) as QuantitySold
FROM Orders o
JOIN OrderDetails od
	ON o.OrderID = od.OrderID
JOIN Books b
	ON  od.BookID = b.BookID
GROUP BY BookTitle

-- --------------------------------------
--  7.11 Customer orders
-- --------------------------------------
SELECT CustomerName, o.OrderID, BookTitle, o.OrderDate
FROM Customers c
JOIN Orders o
	ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
	ON o.OrderID = od.OrderID
JOIN Books b
	ON od.BookID = b.BookID
ORDER BY CustomerName, OrderID, BookTitle

-- --------------------------------------
--  7.12 Orders per customer
-- --------------------------------------
SELECT CustomerName, count(OrderID) as Orders
FROM Customers c
JOIN Orders o
	ON c.CustomerID = o.CustomerID
GROUP BY CustomerName
ORDER BY CustomerName