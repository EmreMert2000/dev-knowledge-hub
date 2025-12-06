--DML Trigger sql script
CREATE TRIGGER trg_AfterInsert_UpdateStock
ON OrderDetails
AFTER INSERT
AS
BEGIN
    -- Stok miktarını güncelle
    UPDATE Products
    SET StockQuantity = StockQuantity - i.Quantity
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;
GO
--Bu kod, OrderDetails tablosuna yeni bir kayıt eklendiğinde tetiklenen bir trigger oluşturur.
--Trigger, eklenen sipariş detaylarına göre Products tablosundaki stok miktarını günceller.
--Trigger'lar, belirli bir tablo üzerinde veri değişiklikleri (INSERT, UPDATE, DELETE) gerçekleştiğinde otomatik olarak çalışan özel prosedürlerdir.
--Bu kod, bir trigger'ün nasıl oluşturulacağını ve işlevini göstermektedir.
--Trigger Kullanma
--Trigger'lar otomatik olarak tetiklendiği için doğrudan çağrılmazlar
--Ancak, OrderDetails tablosuna bir kayıt ekleyerek trigger'ın çalışmasını sağlayabilirsiniz.
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 101, 2, 50.00);
GO
--Bu kod, OrderDetails tablosuna yeni bir kayıt ekler ve trg_AfterInsert_UpdateStock trigger'ının tetiklenmesini sağlar.
--Trigger Güncelleme
ALTER TRIGGER trg_AfterInsert_UpdateStock
ON OrderDetails
AFTER INSERT
AS
BEGIN
    -- Stok miktarını güncelle ve son güncelleme tarihini ayarla    

    UPDATE Products
    SET StockQuantity = StockQuantity - i.Quantity,

        LastUpdated = GETDATE()
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;
GO
--Bu kod, trg_AfterInsert_UpdateStock trigger'ünü günceller ve stok miktarını güncellerken
--aynı zamanda LastUpdated sütununu da mevcut tarih ile ayarlar.
-- kullanıcı kaydı eklenince log tablosuna otomatik kayıt atmak
--Triggerı diğerlerinden ayıran en büyük özellik, otomatik olarak tetiklenmesidir.
--Bu nedenle, trigger'lar doğrudan çağrılmazlar.
--Trigger Silme
DROP TRIGGER trg_AfterInsert_UpdateStock;
GO
--Bu kod, trg_AfterInsert_UpdateStock trigger'ünü siler.
--Trigger'lar, veritabanı işlemlerini otomatikleştirmek ve veri bütünlüğünü sağlamak için kullanılır. Bu kodlar, bir trigger'ün nasıl oluşturulacağını, kullanılacağını, güncelleneceğini ve silineceğini göstermektedir.
--Trigger'lar, belirli bir tablo üzerinde veri değişiklikleri gerçekleştiğinde otomatik olarak çalışır ve bu sayede manuel müdahale gerektirmezler.
CREATE TRIGGER trg_UpdateSalary
ON Employees
FOR UPDATE
AS
BEGIN
    INSERT INTO SalaryLog (EmployeeID, OldSalary, NewSalary, UpdatedDate)
    SELECT
        d.EmployeeID,
        d.Salary AS OldSalary,
        i.Salary AS NewSalary,
        GETDATE()
    FROM deleted d
    INNER JOIN inserted i ON d.EmployeeID = i.EmployeeID
END


GO--Bu kod, Employees tablosunda bir güncelleme işlemi gerçekleştiğinde tetiklenen bir trigger oluşturur.
--Trigger, güncellenen çalışanların eski ve yeni maaş bilgilerini SalaryLog tablosuna ekler.
--Trigger'lar, belirli bir tablo üzerinde veri değişiklikleri (INSERT, UPDATE, DELETE) gerçekleştiğinde otomatik olarak çalışan özel prosedürlerdir.
--Bu kod, bir trigger'ün nasıl oluşturulacağını ve işlevini göstermektedir.
--Trigger Kullanma
--Trigger'lar otomatik olarak tetiklendiği için doğrudan çağrılmazlar
--Ancak, Employees tablosunda bir kayıt güncelleyerek trigger'ın çalışmasını sağlayabilirsiniz.
UPDATE Employees
SET Salary = Salary * 1.1
WHERE EmployeeID = 1;
GO
--Bu kod, Employees tablosunda EmployeeID'si 1 olan çalışanın maaşını %10 artırır ve trg_UpdateSalary trigger'ının tetiklenmesini sağlar.
--Trigger Güncelleme
ALTER TRIGGER trg_UpdateSalary
ON Employees
FOR UPDATE
AS
BEGIN
    INSERT INTO SalaryLog (EmployeeID, OldSalary, NewSalary, UpdatedDate, UpdatedBy)
    SELECT
        d.EmployeeID,
        d.Salary AS OldSalary,
        i.Salary AS NewSalary,
        GETDATE(),
        SYSTEM_USER
    FROM deleted d
    INNER JOIN inserted i ON d.EmployeeID = i.EmployeeID
END;
GO
--Bu kod, trg_UpdateSalary trigger'ünü günceller ve SalaryLog tablosuna
--güncellemeyi yapan kullanıcı bilgisini de ekler.
