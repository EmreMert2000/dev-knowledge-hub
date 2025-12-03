--TSQL Stored Procedures Konusu------

--Stored Procedure Oluşturma
CREATE PROCEDURE GetEmployeeDetails
    @EmployeeID INT
AS
BEGIN
    SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;
END;
GO
--Bu kod, belirli bir EmployeeID'ye sahip çalışan detaylarını getiren bir stored
--procedure oluşturur.
--Stored Procedure Kullanma
EXEC GetEmployeeDetails @EmployeeID = 1;
GO
--Bu kod, GetEmployeeDetails stored procedure'ünü çağırır ve EmployeeID'si 1 olan
--çalışanın detaylarını getirir.
--Stored Procedure Güncelleme
ALTER PROCEDURE GetEmployeeDetails
    @EmployeeID INT
AS
BEGIN
    SELECT Ad, Soyad, Pozisyon, Maas FROM Employees WHERE EmployeeID = @EmployeeID;
END;
GO
--Bu kod, GetEmployeeDetails stored procedure'ünü günceller ve sadece Ad, Soyad,
--Pozisyon ve Maas sütunlarını getirir.
--Stored Procedure Silme
DROP PROCEDURE GetEmployeeDetails;
GO
--Bu kod, GetEmployeeDetails stored procedure'ünü siler.
--Stored Procedures, veritabanı işlemlerini kapsüllemek ve tekrar kullanılabilir hale getirmek için kullanılır. Bu kodlar, bir stored procedure'ün nasıl oluşturulacağını, kullanılacağını, güncelleneceğini ve silineceğini göstermektedir.


CREATE Procedure PDKS_GunlukPersonelGirisCikis
@Tarih DateTime
@KullaniciID Int
@Ad Varchar(50)
@Soyad Varchar(50)
@GirisSaati DateTime
@CikisSaati DateTime
@Durum Varchar(20)
AS
BEGIN
    INSERT INTO PDKS_GunlukPersonelGirisCikis (Tarih, KullaniciID, Ad, Soyad, GirisSaati, CikisSaati, Durum)
    VALUES (@Tarih, @KullaniciID, @Ad, @Soyad, @GirisSaati, @CikisSaati, @Durum);
END;
GO
--Bu kod, PDKS_GunlukPersonelGirisCikis adında bir stored procedure oluşturur ve
--günlük personel giriş çıkış bilgilerini PDKS_GunlukPersonelGirisCikis tablosuna ekler.
--Stored Procedure Kullanma
EXEC PDKS_GunlukPersonelGirisCikis 
    @Tarih = '2024-06-01',
    @KullaniciID = 123,
    @Ad = 'Ahmet',
    @Soyad = 'Yılmaz',
    @GirisSaati = '2024-06-01 08:00:00',
    @CikisSaati = '2024-06-01 17:00:00',
    @Durum = 'Çalıştı';
GO
--Bu kod, PDKS_GunlukPersonelGirisCikis stored procedure'nü çağırır ve belirtilen parametrelerle
--günlük personel giriş çıkış bilgilerini ekler.

--Stored Procedure Güncelleme
ALTER PROCEDURE PDKS_GunlukPersonelGirisCikis
@Tarih DateTime,
@KullaniciID Int,
@Ad Varchar(50),
@Soyad Varchar(50),
@GirisSaati DateTime,
@CikisSaati DateTime,
@Durum Varchar(20)
AS
BEGIN
    INSERT INTO PDKS_GunlukPersonelGirisCikis (Tarih, KullaniciID, Ad, Soyad, GirisSaati, CikisSaati, Durum)
    VALUES (@Tarih, @KullaniciID, @Ad, @Soyad, @GirisSaati, @CikisSaati, @Durum);
END;
GO
--Pdks_GunlukPersonelGirisCikis stored procedure'ünü günceller.

