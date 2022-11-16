/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name as ProductName, C.Name as CategoryName
 FROM products as P
 INNER JOIN categories AS C 
 ON C.CategoryID = P.CategoryID
 WHERE C.Nameproducts = 'Computers';
 
 SELECT products.Name, categories.Name
 FROM products
 INNER JOIN categories on categories.CategoryID = products.CategoryID
 WHERE categories.Name = "Computers";
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating from products as p
 INNER JOIN reviews as r on r.ProductsID = p.ProductIDProductID
 WHERE r.Rating = 5;
 
SELECT products.Name as "Product Name", products.Price as "Product Price", reviews.Rating
FROM products
LEFT JOIN reviews ON reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total
FROM sales as s
INNER JOIN employers AS e ON e.EmployeesID = s.EmployeesID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

SELECT * FROM sales
WHERE EmployeesID = 33809;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.NAME as 'Department Name', c.Name as 'Category Name' FROM departments as d
INNER JOIN categories as c ON C.DepartmentsID = d.DepartmentID
WHERE c.NAME = 'Appliances' OR c.NONE = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.NAME, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 FROM products as p
 INNER JOIN sales as s on s.ProductID = p.ProductID
 WHERE P.ProductID = 97;
 
SELECT * 
FROM sales
WHERE ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Rating, r.Comment 
FROM products as p
INNER JOIN reviews as r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold
FROM sales as s
INNER JOIN employees as e on e.EmployeesID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.FirstName;