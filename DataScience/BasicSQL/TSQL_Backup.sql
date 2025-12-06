--Tsql'de Backup Alma İşlemi
--Veritabanının tam yedeğini almak için BACKUP DATABASE komutu kullanılır.
--Aşağıdaki örnek, "MyDatabase" adlı veritabanının tam yedeğini "C:\Backups\MyDatabase.bak" dosyasına alır.
BACKUP DATABASE MyDatabase
TO DISK = 'C:\Backups\MyDatabase.bak'
WITH FORMAT,
     MEDIANAME = 'MyDatabaseBackup',
     NAME = 'Full Backup of MyDatabase';
GO
--Farklı yedekleme türleri de mevcuttur:
--1. Fark Yedeği (Differential Backup): Sadece son tam yedekten sonra değişen verileri yedekler.
BACKUP DATABASE MyDatabase
TO DISK = 'C:\Backups\MyDatabase_Diff.bak'
WITH DIFFERENTIAL,
     NAME = 'Differential Backup of MyDatabase';
GO
--2. Günlük Yedeği (Transaction Log Backup): Veritabanı günlük dosyasını yedekler.
BACKUP LOG MyDatabase
TO DISK = 'C:\Backups\MyDatabase_Log.bak'
WITH NAME = 'Transaction Log Backup of MyDatabase';
GO
--Not: Yedekleme işlemi sırasında uygun izinlere sahip olmanız gerektiğini unutmayın.
--Ayrıca, yedekleme dosyasının kaydedileceği dizinin SQL Server hizmeti tarafından erişilebilir olması gerekir. 
--Yedekleme işlemi tamamlandıktan sonra, yedekleme dosyasını güvenli bir yerde saklamanız önemlidir.
--Yedekleme işlemi sırasında oluşabilecek hataları kontrol etmek için TRY...CATCH blokları kullanılabilir.
BEGIN TRY
    BACKUP DATABASE MyDatabase
    TO DISK = 'C:\Backups\MyDatabase.bak'
    WITH FORMAT,
         MEDIANAME = 'MyDatabaseBackup',
         NAME = 'Full Backup of MyDatabase';
END TRY
BEGIN CATCH
    PRINT 'Yedekleme işlemi sırasında bir hata oluştu: ' + ERROR_MESSAGE();
END CATCH;
GO
--Yedekleme işlemi tamamlandığında, yedekleme dosyasının bütünlüğünü doğrulamak için RESTORE VERIFYONLY komutu kullanılabilir.
RESTORE VERIFYONLY
FROM DISK = 'C:\Backups\MyDatabase.bak';
GO
--Bu komut, yedekleme dosyasının geçerli olup olmadığını kontrol eder ancak veritabanını geri yüklemez.
--Yedekleme işlemi tamamlandıktan sonra, yedekleme dosyasını güvenli bir yerde saklamanız önemlidir.
--Yedekleme işlemi sırasında oluşabilecek hataları kontrol etmek için TRY...CATCH blokları kullanılabilir.
BEGIN TRY
    BACKUP DATABASE MyDatabase
    TO DISK = 'C:\Backups\MyDatabase.bak'
    WITH FORMAT,
         MEDIANAME = 'MyDatabaseBackup',
         NAME = 'Full Backup of MyDatabase';
END TRY
BEGIN CATCH
    PRINT 'Yedekleme işlemi sırasında bir hata oluştu: ' + ERROR_MESSAGE();
END CATCH;
GO
--Yedekleme işlemi tamamlandığında, yedekleme dosyasının bütünlüğünü doğrulamak için RESTORE VERIFYONLY komutu kullanılabilir.
RESTORE VERIFYONLY
FROM DISK = 'C:\Backups\MyDatabase.bak';
GO
--Bu komut, yedekleme dosyasının geçerli olup olmadığını kontrol eder ancak veritabanını geri yüklemez.
--Yedekleme dosyasının güvenliğini sağlamak için şifreleme seçenekleri de kullanılabilir.
--Aşağıdaki örnek, yedekleme dosyasını şifrelemek için
--AES_256 algoritmasını kullanır.
BACKUP DATABASE MyDatabase
TO DISK = 'C:\Backups\MyDatabase_Encrypted.bak'

WITH ENCRYPTION
(
    ALGORITHM = AES_256,
    SERVER CERTIFICATE = MyBackupCertificate
),
NAME = 'Encrypted Full Backup of MyDatabase';
GO
--Not: Şifreleme işlemi için önceden bir sertifika oluşturmanız ve SQL Server'a yüklemeniz gerekmektedir.
--Sertifika oluşturma örneği:
CREATE CERTIFICATE MyBackupCertificate
WITH SUBJECT = 'Backup Encryption Certificate';
GO
--Yedekleme işlemi tamamlandıktan sonra, yedekleme dosyasını güvenli bir yerde saklamanız önemlidir.
--Yedekleme işlemi sırasında oluşabilecek hataları kontrol etmek için TRY...CATCH blokları kullanılabilir.
BEGIN TRY
    BACKUP DATABASE MyDatabase
    TO DISK = 'C:\Backups\MyDatabase_Encrypted.bak'
    WITH ENCRYPTION
    (
        ALGORITHM = AES_256,
        SERVER CERTIFICATE = MyBackupCertificate
    ),
    NAME = 'Encrypted Full Backup of MyDatabase';
END TRY
BEGIN CATCH
    PRINT 'Yedekleme işlemi sırasında bir hata oluştu: ' + ERROR_MESSAGE();
END CATCH;
GO
--Yedekleme işlemi tamamlandığında, yedekleme dosyasının bütünlüğünü doğrulamak için RESTORE VERIFYONLY komutu kullanılabilir.
RESTORE VERIFYONLY
FROM DISK = 'C:\Backups\MyDatabase_Encrypted.bak';
GO
--Bu komut, yedekleme dosyasının geçerli olup olmadığını kontrol eder ancak veritabanını geri yüklemez. 
--Yedekleme dosyasının güvenliğini sağlamak için şifreleme seçenekleri de kullanılabilir.