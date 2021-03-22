-- SELECT * 
-- FROM books b
-- JOIN collegebooks cb
--     ON b.bookID = cb.bookID
-- JOIN colleges c
--     ON c.collegeID = cb.collegeID
SELECT * 
FROM colleges c
JOIN collegebooks cb
    ON c.collegeID = cb.collegeID
JOIN books b
    ON b.bookID = cb.bookID