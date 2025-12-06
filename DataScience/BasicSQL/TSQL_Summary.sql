--1) TRIGGER – Ne işe yarar?

--Veri değiştiği anda otomatik çalışan kod.

--✔ Kullanım:

--INSERT / UPDATE / DELETE olduğunda otomatik tetiklenir

Loglama, veri bütünlüğü, tarihçe, audit, senkronizasyon

✔ Avantaj:

Arka planda otomatik kontrol mekanizması

✔ Dezavantaj:

Fazla kullanılırsa performansı düşürür

Hatalar görünmez çünkü arka planda çalışır

✔ Özet:

Trigger = Olay gerçekleşince otomatik devreye giren tetikleyici.

--TRANSACTION – Ne işe yarar?

Birden fazla SQL komutunu tek bir paket (atomik işlem) hâline getirir.

✔ Kullanım:

İşlem yarım kalmasın

Ya hep ya hiç mantığı

✔ Örnek:
BEGIN TRAN
   UPDATE Accounts SET Balance -= 100 WHERE ID = 1
   UPDATE Accounts SET Balance += 100 WHERE ID = 2
IF @@ERROR <> 0
   ROLLBACK
ELSE
   COMMIT

✔ Özet:

Transaction = İşlemler ya tamamen yapılır ya da hiç yapılmaz.

-- STORED PROCEDURE – Ne işe yarar?

Parametre alabilen, çalıştırılabilir SQL kodudur.

✔ Kullanım:

Raporlama

Karmaşık sorgular

CRUD işlemleri

İş kuralları

Batch işlemler

✔ Avantaj:

Cache’lenir → Hızlıdır

Parametre alır

İçinde transaction kullanılabilir

✔ Özet:

SP = Tek satırla çağrılabilen hazır SQL fonksiyonudur. Sistemin iş mantığını taşır.

-- FUNCTION – Ne işe yarar?

Değer döndüren SQL bileşenidir (UDF).
Select içinde kullanılabilir.

✔ Türleri:

Scalar Function → tek değer döner

Table-Valued Function → tablo döner

✔ Kısıtlar:

Transaction içermez

Insert/Update/Delete yapamaz

Trigger veya job tetiklemez

Sadece deterministic işler yapmalı

✔ Özet:

Function = Hesaplama yapar, değer döner. Yan etki (INSERT/UPDATE) yoktur.

--VIEW – Ne işe yarar?

Hazır SELECT tanımıdır (sanal tablo).

✔ Kullanım:

Raporlar

Karmaşık sorguları basitleştirmek

Güvenlik → sadece gerekli kolonları göstermek

✔ Özet:

View = Kaynağı belli olan sanal tablo.

--CURSOR – Ne işe yarar?

Kayıtlar üzerinde satır satır dolaşır. (Loop mantığı)

✔ Kullanım:

Çok karmaşık satır bazlı işlemler

Bir sonraki kaydın önceki sonuca göre değişmesi

✔ Dezavantaj:

En yavaş SQL yapılarından biridir

Set-based yaklaşım çok daha hızlıdır

✔ Özet:

Cursor = Satır satır işlem yapan döngü yapısı.

-- SQL JOB (Agent Job) – Ne işe yarar?

Zamanlanmış görevler.

✔ Kullanım:

Her gece 03:00’de otomatik rapor üret

Her 1 saatte bir veri temizliği

Log yedekleme

✔ Özet:

Job = Arka planda zamanlanmış otomatik işlem.

🔥 Aralarındaki En Net Farklar (Tek Cümlelik Müthiş Özet)
Yapı	Ne Yapar?	Öne Çıkan Fark
Trigger	Veri değişince otomatik çalışır	Kullanıcı çağırmaz, kendisi tetiklenir
Transaction	İşlemleri atomik hale getirir	Hata olursa rollback
Stored Procedure	Çalıştırılabilir SQL modülü	Parametre alır, işlem yapar
Function	Değer döndürür	SELECT içinde çağrılır, yan etki yok
View	Sanal tablo	SELECT sonucu gibi davranır
Cursor	Satır satır işlem yapar	En yavaş yöntem ama bazı şeyler için şart
Job	Zamanlanmış işlem	Arka planda belirli saatlerde çalışır