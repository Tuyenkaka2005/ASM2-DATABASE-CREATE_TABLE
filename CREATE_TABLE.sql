use [ShoeSalesManager]

CREATE TABLE Category(
	CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

CREATE TABLE Product_Shoes(
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100) NOT NULL,
	ProductCode NVARCHAR(100) NOT NULL,
	ProductPrice DECIMAL(10,2) NOT NULL,
	InventoryQuantity INT NOT NULL,
	ProductImage NVARCHAR(MAX),
	CategoryID INT,
	BrandID INT,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
	FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeCode NVARCHAR(50) NOT NULL,
    EmployeeName NVARCHAR(100) NOT NULL,
	Position NVARCHAR(50),
    AuthorityLevel NVARCHAR(50),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
	PasswordChanged BIT DEFAULT 0
);

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerCode NVARCHAR(50) NOT NULL,
    CustomerName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20),
	Email NVARCHAR(50),
    Address NVARCHAR(255)
);

CREATE TABLE "Order"(
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	OrderDate DATETIME NOT NULL,
	CustomerID INT,
	EmployeeID INT,
	TotalAmount DECIMAL(10, 2),
	Profit DECIMAL(10, 2),
	Status NVARCHAR(20)

	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    QuantitySold INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product_Shoes(ProductID)
);

CREATE TABLE Import (
    ImportID INT PRIMARY KEY IDENTITY(1,1),
    ImportDate DATETIME NOT NULL,
    EmployeeID INT,
    TotalQuantity INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE ImportDetail (
    ImportDetailID INT PRIMARY KEY IDENTITY(1,1),
    ImportID INT,
    ProductID INT,
    QuantityImported INT NOT NULL,
    ImportCost DECIMAL(10, 2),
	SupplierID INT,
    FOREIGN KEY (ImportID) REFERENCES Import(ImportID),
    FOREIGN KEY (ProductID) REFERENCES Product_Shoes(ProductID),
	FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE Brand(
	BrandID INT PRIMARY KEY IDENTITY(1,1),
	BrandName NVARCHAR(50)
);

CREATE TABLE Supplier(
	SupplierID INT PRIMARY KEY IDENTITY(1,1),
	SupplierName NVARCHAR (50),
	Phone INT,
	Email NVARCHAR(255)
);
