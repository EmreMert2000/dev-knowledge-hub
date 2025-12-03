--Örnek TSQL Sorgusu

--Declare a variable to hold the employee ID
DECLARE @EmployeeID INT;
SET @EmployeeID = 1;
GO
--Select employee details based on the variable
SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;
GO
--This code demonstrates how to declare a variable, assign a value to it, and use it in a SELECT statement to filter results based on that variable.

declare @Ad NVARCHAR(50),@Soyad NVARCHAR(50);
select @Ad=Ad,@Soyad=Soyad from Employees where EmployeeID=1;
print 'Calisan Adi: '+@Ad+' Calisan Soyadi: '+@Soyad;
GO
--Bu kod, bir değişkenin nasıl tanımlanacağını, değer atanacağını ve bu
--İf/Else yapısını kullanarak değişken değerine göre farklı çıktılar üretmeyi göstermektedir.
--değişkenlerin nasıl kullanılacağını göstermektedir.
--Tsql Kodları Temel Yapısı
--Değişken Atama ve Kullanımı
--Tsql Kodları Temel Yapısı Sonu
--Bu kodlar, T-SQL değişkenlerinin temel kullanımını göstermektedir: değişken
--if/else yapısı ile değişken değerine göre çıktı üretme
DECLARE @Maas DECIMAL(10, 2);
SET @Maas = 7000.00;
declare @MaasEski NVARCHAR(50);
SET @MaasEski = 6000.00;                 
GO
IF @Maas > @MaasEski
    PRINT 'Yuksek Maas';
    else
    PRINT 'Dusuk Maas';
GO
--Bu kod, bir değişkenin nasıl tanımlanacağını, değer atanacağını ve bu
--While Döngüsü ile belirli bir koşul sağlandığı sürece işlemler yapmayı göstermektedir.
DECLARE @Sayac INT;
SET @Sayac = 1;
GO
WHILE @Sayac <= 5
BEGIN
    PRINT 'Sayac Degeri: ' + CAST(@Sayac AS NVARCHAR(10));
    SET @Sayac = @Sayac + 1;
END;
GO
--Bu kod, bir değişkenin nasıl tanımlanacağını, değer atanacağını ve bu
--For Döngüsü ile belirli bir sayıda işlemler yapmayı göstermektedir.
DECLARE @i INT;
GO

FOR @i = 1 TO 5
BEGIN
    PRINT 'i Degeri: ' + CAST(@i AS NVARCHAR(10));
END;
GO
--Bu kod, bir değişkenin nasıl tanımlanacağını, değer atanacağını ve bu
--Geçici Tablo Oluşturma ve Kullanımı
CREATE TABLE #GeciciCalisanlar (
    CalisanID INT,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50)
);
GO
INSERT INTO #GeciciCalisanlar (CalisanID, Ad, Soyad)
VALUES (1, 'Ali', 'Veli'),
       (2, 'Ayse', 'Fatma');
GO
SELECT * FROM #GeciciCalisanlar;
GO
DROP TABLE #GeciciCalisanlar;
GO
--Bu kod, geçici tabloların nasıl oluşturulacağını, veri ekleme, sorgulama ve silme işlemlerini göstermektedir.
--