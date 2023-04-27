
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (1, 'John', 'Doe', 'john.doe@example.com'),
       (2, 'Jane', 'Smith', 'jane.smith@example.com'),
       (3, 'Alice', 'Johnson', 'alice.johnson@example.com');

INSERT INTO Orders (OrderID, CustomerID, ProductName, Quantity)
VALUES (1, 1, 'Laptop', 1),
       (2, 1, 'Mouse', 1),
       (3, 2, 'Monitor', 2);

SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.ProductName, o.Quantity
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;
