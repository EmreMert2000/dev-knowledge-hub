--Transactions in T-SQL
--Start a transaction
BEGIN TRANSACTION;
--Perform some operations
INSERT INTO Employees (Name, Position) VALUES ('John Doe', 'Developer');
UPDATE Employees SET Position = 'Senior Developer' WHERE Name = 'John Doe';
--Check for errors
IF @@ERROR <> 0
BEGIN
    --If there was an error, roll back the transaction
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back due to an error.';
END
ELSE
BEGIN
    --If everything is fine, commit the transaction
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
END
--Transaction nedir ?
--Transaction, veritabanında bir dizi işlemi tek bir birim olarak gerçekleştiren
--bir işlemdir. Bir transaction içindeki tüm işlemler başarılı olursa, transaction
--commit edilir ve veritabanına kalıcı olarak kaydedilir. Eğer herhangi bir işlem
--başarısız olursa, transaction rollback edilir ve veritabanı önceki durumuna geri döner.
--Transaction'lar veri bütünlüğünü sağlamak ve hataları önlemek için kullanılır.        
--Transaction'ın dört temel özelliği vardır: ACID
--Atomicity (Atomiklik): Transaction içindeki tüm işlemler ya tamamen başarılı olur
--veya tamamen başarısız olur.
--Consistency (Tutarlılık): Transaction tamamlandığında, veritabanı tutarlı bir
--durumda olmalıdır.
--Isolation (Yalıtım): Bir transaction'ın işlemleri, diğer transaction'lardan
--izole edilmelidir.
--Durability (Dayanıklılık): Bir transaction commit edildikten sonra, veritabanı
--çökse bile değişiklikler kalıcı olmalıdır.
--Transaction kullanımı, özellikle birden fazla işlemin birlikte yapılması
--gerektiği durumlarda önemlidir. Örneğin, bir banka transferi işlemi
--yaparken, para çekme ve para yatırma işlemlerinin her ikisi de başarılı
--olmalıdır; aksi takdirde, her iki işlem de geri alınmalıdır.
--Bu nedenle, transaction'lar veri bütünlüğünü korumak için kritik öneme sahiptir.

--Örnek: Bir banka transferi işlemi
BEGIN TRANSACTION;
DECLARE @FromAccount INT = 1;
DECLARE @ToAccount INT = 2;
DECLARE @Amount DECIMAL(10, 2) = 100.00;
--Para çekme işlemi
UPDATE Accounts SET Balance = Balance - @Amount WHERE AccountID = @FromAccount;
--Para yatırma işlemi
UPDATE Accounts SET Balance = Balance + @Amount WHERE AccountID = @ToAccount;
--Hata kontrolü
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back due to an error in transfer.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully for transfer.';
END
--Bu örnekte, para çekme ve para yatırma işlemleri bir transaction
--içinde gerçekleştirilir. Eğer herhangi bir işlem başarısız olursa,
--transaction rollback edilir ve her iki işlem de geri alınır.
--Eğer her iki işlem de başarılı olursa, transaction commit edilir
--ve değişiklikler kalıcı olur.
--Transaction isolation levels
--Transaction isolation levels, bir transaction'ın diğer transaction'lardan
--ne kadar izole olduğunu belirler. SQL Server'da dört temel isolation level vardır:
--Read Uncommitted: En düşük izolasyon seviyesidir. Bir transaction, diğer
--transaction'ların commit edilmemiş verilerini okuyabilir. Bu, "dirty reads"
--olarak bilinir.
--Read Committed: Varsayılan izolasyon seviyesidir. Bir transaction, diğer
--transaction'ların commit edilmiş verilerini okuyabilir. Commit edilmemiş
--veriler okunamaz.
--Repeatable Read: Bir transaction, diğer transaction'ların commit edilmiş
--verilerini okuyabilir ve aynı veriyi tekrar okuduğunda değişmemiş olmasını
--sağlar. Ancak, diğer transaction'lar yeni satırlar ekleyebilir.
--Serializable: En yüksek izolasyon seviyesidir. Bir transaction, diğer
--transaction'ların commit edilmiş verilerini okuyabilir ve aynı veriyi tekrar
--okuduğunda değişmemiş olmasını sağlar. Ayrıca, diğer transaction'lar yeni
--satırlar ekleyemez.
--Isolation level'ı ayarlamak için SET TRANSACTION ISOLATION LEVEL
--komutu kullanılır. Örneğin:
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--Bu komut, mevcut session için isolation level'ı Serializable olarak ayarlar.
--Isolation level'lar, veri bütünlüğünü korumak ve performansı optimize etmek
--için önemlidir. Daha yüksek izolasyon seviyeleri, veri tutarlılığ
--sağlarken, performansı düşürebilir. Bu nedenle, uygulamanın ihtiyaçlarına
--göre uygun izolasyon seviyesi seçilmelidir.
--Savepoints in Transactions
--Savepoints, bir transaction içinde belirli noktalara geri dönmeyi
--sağlayan işaretlerdir. Savepoint'ler, transaction'ın bir bölümünü
--geri almak için kullanılır, ancak tüm transaction'ı geri almak
--gerektirmez.
--Savepoint oluşturmak için SAVE TRANSACTION komutu kullanılır.
BEGIN TRANSACTION;
--İlk işlem
INSERT INTO Employees (Name, Position) VALUES ('Jane Smith', 'Manager');
--Savepoint oluşturma
SAVE TRANSACTION Savepoint1;
--İkinci işlem
INSERT INTO Employees (Name, Position) VALUES ('Mike Johnson', 'Analyst');
--Hata kontrolü
IF @@ERROR <> 0
BEGIN
    --Savepoint'e geri dönme
    ROLLBACK TRANSACTION Savepoint1;
    PRINT 'Rolled back to Savepoint1 due to an error.';
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
END
--Bu örnekte, ikinci INSERT işlemi başarısız olursa,
--transaction Savepoint1'e geri döner ve ilk INSERT işlemi
--korunur. Eğer her iki işlem de başarılı olursa, transaction
--commit edilir ve her iki değişiklik de kalıcı olur.
--Savepoint'ler, karmaşık transaction'larda esneklik sağlar
--ve belirli işlemleri geri almak için kullanışlıdır.
--Ancak, savepoint'ler transaction'ın tamamını geri almak
--gerektirmez, bu nedenle dikkatli kullanılmalıdır.
--Nested Transactions in T-SQL
--Nested transactions, bir transaction içinde başka bir transaction
--başlatılmasıdır. SQL Server'da nested transaction'lar desteklenir,
--ancak dış transaction commit edilmeden iç transaction commit edilemez.
--Örnek:
BEGIN TRANSACTION OuterTransaction;
--Dış transaction işlemi
INSERT INTO Employees (Name, Position) VALUES ('Alice Brown', 'Designer');
BEGIN TRANSACTION InnerTransaction;
--İç transaction işlemi
INSERT INTO Employees (Name, Position) VALUES ('Bob White', 'Tester');
--Hata kontrolü
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION InnerTransaction;
    PRINT 'Inner transaction rolled back due to an error.';
END
ELSE
BEGIN
    COMMIT TRANSACTION InnerTransaction;
    PRINT 'Inner transaction committed successfully.';
END
--Dış transaction hata kontrolü
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION OuterTransaction;
    PRINT 'Outer transaction rolled back due to an error.';
END
ELSE
BEGIN


    COMMIT TRANSACTION OuterTransaction;
    PRINT 'Outer transaction committed successfully.';
END
--Bu örnekte, iç transaction başarılı olursa commit edilir,
--ancak dış transaction commit edilmeden önce hata kontrolü yapılır. Eğer dış transaction'da bir hata oluşursa, tüm işlemler geri alınır.
--Nested transaction    'lar, karmaşık işlemler sırasında esneklik sağlar,
--ancak dikkatli kullanılmalıdır çünkü dış transaction'ın durumu iç transaction'ları etkiler.
--Genel olarak, transaction yönetimi veri bütünlüğünü sağlamak için kritik öneme sahiptir
--ve doğru kullanıldığında veritabanı işlemlerinin güvenilirliğini artırır.
--Transaction log nedir ?
--Transaction log, bir veritabanında yapılan tüm değişikliklerin kaydedildiği
--bir dosyadır. SQL Server gibi ilişkisel veritabanı yönetim sistemlerinde,
--transaction log, veri bütünlüğünü sağlamak, veri kurtarma işlemlerini
--desteklemek ve performansı optimize etmek için kullanılır.
--Transaction log'un temel işlevleri şunlardır:
--1. Veri Bütünlüğü: Transaction log, bir transaction'ın tamamlanıp
--tamamlanmadığını izler. Eğer bir transaction tamamlanmazsa,
--transaction log, veritabanını önceki tutarlı durumuna geri döndürmek
--için kullanılır.
--2. Veri Kurtarma: Transaction log, veritabanı çökmesi veya donması
--gibi durumlarda veri kurtarma işlemlerini destekler. Log dosyası,
--değişikliklerin kaydedildiği bir geçmiş sağlar ve bu sayede
--veritabanı, belirli bir zamana geri döndürülebilir.
--3. Performans Optimizasyonu: Transaction log, veritabanı işlemlerinin
--daha hızlı gerçekleştirilmesini sağlar. Değişiklikler önce log dosyasına
--yazılır ve daha sonra veritabanına uygulanır, bu da performansı artırır.
--Transaction log dosyaları genellikle ".ldf" uzantısına sahiptir
--ve veritabanı ile birlikte yönetilir. Veritabanı yöneticileri,
--transaction log dosyalarının boyutunu ve performansını izlemek
--için düzenli bakım yapmalıdır.
--Transaction log dosyasının düzgün yönetilmemesi,
--veritabanı performansını olumsuz etkileyebilir ve veri kaybına
--neden olabilir. Bu nedenle, transaction log'un önemi büyüktür
--ve veritabanı yönetiminde kritik bir rol oynar.
--Transaction log backup nedir ?
--Transaction log backup, bir veritabanının transaction log dosyasının
--yedeklenmesi işlemidir. SQL Server gibi ilişkisel veritabanı yönetim
--sistemlerinde, transaction log backup'ları veri bütünlüğünü sağlamak,
--veri kurtarma işlemlerini desteklemek ve veritabanı performansını optimize
--etmek için kullanılır.
--Transaction log backup'un temel işlevleri şunlardır:
--1. Veri Kurtarma: Transaction log backup'ları, veritabanı çökmesi veya
--donması gibi durumlarda veri kurtarma işlemlerini destekler. Log yedekleri,
--değişikliklerin kaydedildiği bir geçmiş sağlar ve bu sayede veritabanı,
--belirli bir zamana geri döndürülebilir.
--2. Veri Bütünlüğü: Transaction log backup'ları, veritabanının tutarlı
--durumunu korumaya yardımcı olur. Eğer bir transaction tamamlanmazsa,
--log yedekleri, veritabanını önceki tutarlı durumuna geri döndürmek için kullanılır.
--3. Performans Optimizasyonu: Transaction log backup'ları, veritabanı işlemlerinin
--daha hızlı gerçekleştirilmesini sağlar. Log dosyası düzenli olarak yedeklendiğinde,
--log dosyasının boyutu kontrol altında tutulur ve performans artırılır.
--Transaction log backup'ları genellikle tam yedekleme stratejisinin bir parçası
--olarak kullanılır. Veritabanı yöneticileri, transaction log backup'larının
--düzenli olarak alınmasını ve yedeklerin güvenli bir şekilde saklanmasını sağlamalıdır.
--Transaction log backup'larının düzgün yönetilmemesi,
--veritabanı performansını olumsuz etkileyebilir ve veri kaybına
--neden olabilir. Bu nedenle, transaction log backup'larının önemi büyüktür
--ve veritabanı yönetiminde kritik bir rol oynar.
