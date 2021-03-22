SELECT S.StudentID, S.FirstName, S.LastName,
C.CollegeID, C.Name
FROM Students S
INNER JOIN Colleges C
ON S.CollegeID = C.CollegeID
-- WHERE Phone REGEXP '[(]?[0-9]{3}[)]?[[:space:]]?[0-9]' 
-- WHERE Email LIKE '%@gmail.com' OR Phone LIKE '%(541)' 
-- WHERE Birthdate > '1990-01-01' AND region = 'TX'
-- WHERE City='Cambridge'