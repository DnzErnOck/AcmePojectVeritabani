SELECT MONTH(OrderDate) AS Ay,
Categories.CategoryName AS Kategori,
COUNT(Products.CategoryID) AS ToplamSatis FROM [Order]
LEFT JOIN Products ON ProductID = Products.ProductID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY MONTH(OrderDate),Products.CategoryID,Categories.CategoryName
ORDER BY Ay