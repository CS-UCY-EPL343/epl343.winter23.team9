CREATE PROCEDURE spSIGNUP 
@Email VARCHAR(30),
@Phone_Number VARCHAR(8),
@First_Name VARCHAR(30),
@Last_Name VARCHAR(30),
@UserName VARCHAR(30),
@Passwd VARCHAR(256),
@Birth_Date DATE
AS 
BEGIN
IF EXISTS (
  SELECT *
  FROM [dbo].CUSTOMER
  WHERE [UserName] = @UserName
) BEGIN PRINT 'Error: Username already exists'
END
ELSE BEGIN
INSERT INTO [dbo].CUSTOMER
VALUES (
    RTRIM(@Email),
    RTRIM(@Phone_Number),
    RTRIM(@First_Name),
    RTRIM(@Last_Name),
    RTRIM(@UserName),
    RTRIM(@Passwd),
    @Birth_Date,
    CONVERT(INT, '0')
  );
END
END
GO 

CREATE PROCEDURE spLOGIN @UserName VARCHAR(30),
  @Passwd VARCHAR(20) 
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].CUSTOMER
    WHERE [UserName] = @UserName
      AND [Passwd] = @Passwd
  )  BEGIN PRINT 'Error: Invalid username or password' PRINT HASHBYTES('SHA2_256', @Passwd)
END
END
GO 

CREATE PROCEDURE spADMINLOGIN @UserName VARCHAR(30),
  @Passwd VARCHAR(20) 
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].CUSTOMER
    WHERE [UserName] = @UserName AND @UserName = 'administrator'
      AND [Passwd] = @Passwd
  )  BEGIN PRINT 'Error: Invalid username or password' PRINT HASHBYTES('SHA2_256', @Passwd)
END
END
GO 

CREATE PROCEDURE spProduct (@ProductArg CHAR(50) = NULL) 
AS 
BEGIN
SELECT [Product_Name],
  [Price],
  [Image_path]
FROM [dbo].[PRODUCT]
WHERE Category = @ProductArg
END
GO 

CREATE PROCEDURE spProducts 
AS 
BEGIN
SELECT [Product_Name],
  [Price],
  [Image_path]
FROM [dbo].[PRODUCT]
WHERE Category = 'Mod'
  OR Category = 'Atomizer'
  OR Category = 'Battery'
  OR Category = 'Coil'
END
GO 

CREATE PROCEDURE spViewProduct
@Product_Name VARCHAR(50)
AS
BEGIN
SELECT *
FROM [dbo].[PRODUCT]
WHERE [Product_Name] = @Product_Name
END
GO

CREATE PROCEDURE spAddProduct
  @Product_Name VARCHAR(50),
  @Price FLOAT,
  @Description VARCHAR(500),
  @Stock INT,
  @Category VARCHAR(30),
  @Image_path VARCHAR(200)
  AS 
  BEGIN
IF @Stock < 0 BEGIN PRINT 'Error: Stock cannot be negative' RETURN
END
IF @Price < 0 BEGIN PRINT 'Error: Price cannot be negative' RETURN
END
IF NOT (@Category='Mod' OR @Category='Atomizer' OR @Category='Battery' OR @Category='Liquid' OR @Category='Booster' OR @Category='Coil' OR @Category='Pod')
BEGIN PRINT 'Error: Invalid category' RETURN
END
BEGIN
INSERT INTO [dbo].PRODUCT
VALUES (
    RTRIM(@Product_Name),
    @Price,
    RTRIM(@Description),
    @Stock,
    @Category,
    RTRIM(@Image_path)
  );
  PRINT 'Success: Product added/updated.'
END
END
GO

CREATE PROCEDURE spDeleteProduct @Product_ID INT
AS
BEGIN
IF NOT EXISTS (
    SELECT *
    FROM [dbo].[PRODUCT]
    WHERE [Product_ID] = @Product_ID
  ) BEGIN PRINT 'Error: Product ID does not exist.' RETURN
END
DELETE FROM [dbo].[PRODUCT]
    WHERE [Product_ID] = @Product_ID
PRINT 'Success: Product deleted'
END
GO

CREATE PROCEDURE spEditProduct
  @p_Name VARCHAR(50),
  @p_ID INT,
  @p_Price FLOAT,
  @p_Description VARCHAR(500),
  @p_Stock INT,
  @p_Category VARCHAR(30),
  @p_Image_path VARCHAR(200)
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].[PRODUCT]
    WHERE [Product_ID] = @p_ID
  ) BEGIN PRINT 'Error: Product does not exist' RETURN
END
  EXEC spDeleteProduct @Product_ID=@p_ID;
  EXEC spAddProduct @Product_Name=@p_Name, @Price=@p_Price, @Description=@p_Description, @Stock=@p_Stock, @Category=@p_Category, @Image_path=@p_Image_path;

END
GO

CREATE PROCEDURE spAllProducts
AS
BEGIN
SELECT P.*
FROM [dbo].[PRODUCT] P
END
GO

CREATE PROCEDURE spGetProduct 
@Product_ID INT
AS 
BEGIN
SELECT *
FROM [dbo].[PRODUCT]
WHERE [Product_ID] = @Product_ID
END
GO

CREATE PROCEDURE spDeleteAccount 
@UserName VARCHAR(30)
AS
BEGIN 
IF NOT EXISTS (
    SELECT *
    FROM [dbo].[CUSTOMER]
    WHERE [UserName] = @UserName    
  ) BEGIN PRINT 'Error: Username does not exist.' RETURN
END
DELETE FROM [dbo].[CUSTOMER]
    WHERE [UserName] = @UserName
PRINT 'Success: Account deleted'
END
GO

CREATE PROCEDURE spGetCustomer
@UserName VARCHAR(30)
AS 
BEGIN
SELECT *
FROM [dbo].[CUSTOMER]
WHERE [Username] = @UserName
END
GO

CREATE PROCEDURE spEditAccount
 @c_Email VARCHAR(30),
 @c_Phone_Number VARCHAR(8),
 @c_First_Name VARCHAR(30),
 @c_Last_Name VARCHAR(30),
 @c_UserName VARCHAR(30), --php stores the current username and send it to the stored procedure
 @c_newUserName VARCHAR(30), --new username from customer
 @c_Passwd VARCHAR(256),
 @c_Birth_Date DATE
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].[CUSTOMER]
    WHERE [UserName] = @c_UserName
  ) BEGIN PRINT 'Error: Account does not exist' RETURN
END
  EXEC spDeleteAccount @Username=@c_UserName;
  EXEC spSIGNUP @Email=@c_Email, @Phone_Number=@c_Phone_Number, @First_Name=@c_First_Name, @Last_Name=@c_Last_Name, @UserName=@c_newUserName, @Passwd=@c_Passwd, @Birth_Date=@c_Birth_Date;
END
GO

