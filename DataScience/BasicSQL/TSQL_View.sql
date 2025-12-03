--Tsql Kodları Temel Yapısı
--Veritabanı Oluşturma
CREATE DATABASE OrnekVeritabani;
GO
--Veritabanını Kullanma
USE OrnekVeritabani;
GO
--Tablo Oluşturma
CREATE TABLE Calisanlar (
    CalisanID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Pozisyon NVARCHAR(50),
    Maas DECIMAL(10, 2)
);
GO
--Veri Ekleme
INSERT INTO Calisanlar (CalisanID, Ad, Soyad, Pozisyon, Maas)
VALUES (1, 'Ahmet', 'Yilmaz', 'Yazilimci', 5000.00),
       (2, 'Ayse', 'Kara', 'Tasarimci', 4500.00),
       (3, 'Mehmet', 'Demir', 'Yonetici', 7000.00);
GO
--Veri Sorgulama
SELECT * FROM Calisanlar;
GO
--Veri Güncelleme
UPDATE Calisanlar
SET Maas = Maas + 500
WHERE CalisanID = 1;
GO
--Veri Silme
DELETE FROM Calisanlar
WHERE CalisanID = 2;
GO
--Tablo Silme
DROP TABLE Calisanlar;
GO
--Veritabanı Silme
DROP DATABASE OrnekVeritabani;
GO
--Tsql Kodları Temel Yapısı Sonu
--Bu kodlar, temel T-SQL işlemlerini içermektedir: veritabanı oluşturma, tablo oluşturma, veri ekleme, sorgulama, güncelleme, silme ve son olarak tablo ve veritabanı silme işlemleri.
--TSQL View Konusunu------

--View Oluşturma
CREATE VIEW CalisanView AS
SELECT Ad, Soyad, Pozisyon
FROM Calisanlar;
GO
--View Kullanma
SELECT * FROM CalisanView;
GO
--View Güncelleme (Not: View üzerinden doğrudan güncelleme her zaman mümkün değildir)
--Örnek olarak, CalisanView üzerinden veri güncelleme işlemi yapılmamıştır çünkü bu view doğrudan güncellenebilir olmayabilir.
--View Silme
DROP VIEW CalisanView;
GO
--Bu kod, bir view'in nasıl oluşturulacağını, kullanılacağını ve silineceğini göstermektedir. View'ler, veritabanı sorgularını basitleştirmek ve veri
--görünümünü özelleştirmek için kullanılır.
--NewId Kullanımı
DECLARE @NewEmployeeID UNIQUEIDENTIFIER;
SET @NewEmployeeID = NEWID();
PRINT 'Yeni EmployeeID: ' + CAST(@NewEmployeeID AS NVARCHAR(50));
GO
--Bu kod, NEWID() fonksiyonunun nasıl kullanılacağını ve benzersiz bir kimlik oluşturmayı göstermektedir.
--