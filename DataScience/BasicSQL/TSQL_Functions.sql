--TSQL Functions Konusu------
--GETDATE() Fonksiyonu Kullanımı
SELECT GETDATE() AS 'CurrentDateTime';
GO
--Bu kod, GETDATE() fonksiyonunu kullanarak mevcut tarih ve saat bilgisini getirir.
--DATEADD() Fonksiyonu Kullanımı
SELECT DATEADD(DAY, 10, GETDATE()) AS 'DateAfter10Days';
GO
--Bu kod, DATEADD() fonksiyonunu kullanarak mevcut tarihe 10 gün ekler.
--DATEDIFF() Fonksiyonu Kullanımı
SELECT DATEDIFF(DAY, '2024-01-01', GETDATE()) AS 'DaysSinceStartOfYear';
GO
--Bu kod, DATEDIFF() fonksiyonunu kullanarak 2024 yılının başından bu yana geçen gün sayısını hesaplar.
--CONVERT() Fonksiyonu Kullanımı
SELECT CONVERT(NVARCHAR(30), GETDATE(), 103) AS 'FormattedDate';
GO
--Bu kod, CONVERT() fonksiyonunu kullanarak mevcut tarihi 'dd/mm/yyyy' formatında getirir.
--ISNULL() Fonksiyonu Kullanımı
DECLARE @Maas DECIMAL(10, 2) = NULL;
SELECT ISNULL(@Maas, 0) AS 'MaasValue';
GO
--Bu kod, ISNULL() fonksiyonunu kullanarak eğer @Maas değişkeni NULL ise 0 değerini döndürür.
--COALESCE() Fonksiyonu Kullanımı
DECLARE @Deger1 NVARCHAR(50) = NULL;
DECLARE @Deger2 NVARCHAR(50) = 'Merhaba';
SELECT COALESCE(@Deger1, @Deger2, 'Varsayilan Deger') AS 'FirstNonNullValue';
GO
--Bu kod, COALESCE() fonksiyonunu kullanarak NULL olmayan ilk değeri döndürür.

--Scalar,inner ve aggregate fonksiyonlar hakkında temel bilgiler içermektedir. Bu kodlar, T-SQL'de yaygın olarak kullanılan bazı fonksiyonların nasıl kullanılacağını göstermektedir. 
--Scalar fonksiyonlar tek bir değer döndürürken, aggregate fonksiyonlar birden fazla değeri işleyerek tek bir sonuç döndürür. Inner fonksiyonlar ise genellikle diğer fonksiyonların içinde kullanılır.
--İnner fonksiyon örneği olarak, CONVERT() fonksiyonu GETDATE() fonksiyonunun içinde kullanılmıştır.
--Aggregate fonksiyon örneği olarak, COUNT(), SUM(), AVG() gibi fonksiyonlar kullanılabilir.
--TSQL Functions Konusu Sonu------

--Fonksiyon ile stored procedure arasındaki farklar:
--1. Fonksiyonlar bir değer döndürürken, stored procedure'ler birden fazla sonuç seti döndürebilir veya işlem yapabilir.
--2. Fonksiyonlar SELECT, WHERE gibi ifadelerde kullanılabilirken, stored procedure'ler EXEC komutu ile çağrılır.
--3. Fonksiyonlar genellikle veri dönüşümleri ve hesaplamalar için kullanılırken, stored procedure'ler daha karmaşık işlemler ve iş mantığı için kullanılır.
--4. Fonksiyonlar genellikle yan etki oluşturmazken, stored procedure'ler veri tabanında değişiklik yapabilir (INSERT, UPDATE, DELETE).
--5. Fonksiyonlar genellikle daha kısıtlıdır ve transaction yönetimi gibi bazı özellikleri desteklemezken, stored procedure'ler bu tür işlemleri gerçekleştirebilir.
--Bu farklar, fonksiyonlar ve stored procedure'lerin kullanım amaçlarına ve senaryolarına göre seçim yaparken dikkate alınmalıdır.
