// flutter_notes.dart
// Bu dosya tamamen ÖĞRENME NOTLARIDIR. Uygulama içinde kullanılmaz.
// İstediğin zaman açıp okuyabileceğin bir mini özet gibi düşün. 😊

// =====================================================
// 1) FLUTTER TEMEL KAVRAMLAR
// =====================================================
//
// - Flutter: Google'ın geliştirdiği, tek kod tabanı ile iOS/Android/Web/Desktop
//   uygulaması geliştirmemizi sağlayan UI toolkit.
// - Her şey "widget" mantığı ile çalışır.
// - MaterialApp, Scaffold, AppBar, Text, Row, Column hepsi birer widget.
// - Flutter UI'si 3 katmandan oluşur:
//   1) Widget Tree  → yazdığımız widget sınıfları (immutable config)
//   2) Element Tree → widget instanceları + context + lifecycle
//   3) Render Tree  → boyut, pozisyon ve çizim işlemleri
//
// - build() metodu:
//   - Widget'ın UI'ını tanımladığımız yer.
//   - setState(), ekran döndürme, tema değişimi vb. durumlarda tekrar çalışır.
//   - Flutter tüm ekranı baştan çizmeye çalışmaz, sadece değişen kısımları render eder.


// =====================================================
// 2) STATELESS vs STATEFUL WIDGET
// =====================================================
//
// StatelessWidget:
// - İçinde state tutmayan widget.
// - UI sadece constructor parametrelerine göre değişir.
// - Örnek: sabit bir başlık, logo, ikon, buton tasarımı.
// - Değişkenlik yok → her rebuild'de sıfırdan config verirsin.
//
// StatefulWidget:
// - İçinde state (durum) tutan widget.
// - Örnek: sayaç, form alanı, API'den veri çekilen ekran, toggle, slider vs.
// - State, State<T> sınıfı içinde tutulur.
// - State değiştiğinde setState() çağrılır → sadece bu widget rebuild olur.
//
// Temel lifecycle metotları:
// - initState(): Widget ilk oluşturulduğunda BİR KEZ çalışır.
//   * API çağrısı başlatma
//   * Controller oluşturma (TextEditingController, AnimationController vb.)
// - didChangeDependencies(): initState'den sonra ve dependency değişince çalışır.
//   * context'e bağlı işlemler (Theme.of, MediaQuery, Provider.of vs.)
// - build(): UI'ı çizdiğimiz yer.
// - deactivate(): Widget ağaçtan geçici çıkartıldığında.
// - dispose(): Widget tamamen yok edilirken çağrılır.
//   * Controller.dispose(), subscription.cancel(), timer.cancel() gibi temizlikler burada yapılır.


// =====================================================
// 3) DART ASENKRON YAPILAR: FUTURE, STREAM, ISOLATE
// =====================================================
//
// Future:
// - Bir kere sonuç üreten asenkron işlem (ör: API çağrısı, dosya okuma).
// - async/await ile kullanılır.
//   Örn: final data = await getData();
//
// Stream:
// - Birden fazla kez veri üreten asenkron yapı (ör: Firebase real-time, socket).
// - StreamBuilder ile UI her yeni veri geldiğinde otomatik güncellenir.
//
// Isolate:
// - Dart'ın multi-thread yapısı.
// - Ağır işlemleri (büyük JSON parse, resim işleme, kripto, ağır hesaplama) UI thread'inden ayırmak için
//   isolate kullanılır → böylece UI donmaz.
// - Flutter'da compute() helper fonksiyonu ile basit isolate kullanımı yapılabilir.


// =====================================================
// 4) STATE MANAGEMENT GENEL BAKIŞ
// =====================================================
//
// Temel yöntemler:
// - setState: Basit ekranlarda iş görür. Tek ekranda küçük state değişiklikleri için ideal.
// - InheritedWidget / InheritedNotifier: Flutter'ın native çözümleri.
// - Provider: En popüler state management paketlerinden biri.
// - Riverpod: Provider'ın daha gelişmiş, context bağımsız versiyonu.
// - Bloc / Cubit: Event → State mantığıyla çalışan, büyük projeler için güçlü yapı.
//
// Provider (ChangeNotifier) mantığı:
// - ChangeNotifier extends eden bir sınıfta state tutulur.
// - State değiştiğinde notifyListeners() çağrılır.
// - UI tarafında context.watch / context.read ile state okunur.
// - Küçük/orta ölçekli projelerde gayet yeterlidir.
//
// Bloc mantığı (yüksek seviye):
// - Event → Bloc → State akışı vardır.
// - State immutable tutulur.
// - Büyük ekipler ve karmaşık projelerde okunabilirlik ve test edilebilirlik sağlar.
//
// Riverpod (yüksek seviye fikir):
// - Provider gibi ama context bağımlı değil.
// - Provider override, auto dispose, global erişim gibi artıları var.


// =====================================================
// 5) REST API ENTEGRASYONU – TEMEL NOTLAR
// =====================================================
//
// Amaç: Backend'den RESTful API ile veri çekmek/göndermek.
//
// Temel adımlar:
// 1) http veya dio paketini projeye ekle.
// 2) Bir endpoint belirle (ör: https://jsonplaceholder.typicode.com/posts).
// 3) GET/POST isteği at.
// 4) Gelen JSON'u model sınıfına dönüştür (fromJson / toJson).
// 5) Error handling (try/catch, timeout, statusCode kontrolü) yap.
// 6) Bu işlemi mümkünse Data/Repository katmanında tut, UI'de doğrudan http çağrısı yapma.
//
// Model örneği (mantık):
// class Product {
//   final int id;
//   final String name;
//   Product({required this.id, required this.name});
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json['id'],
//     name: json['name'],
//   );
// }
//
// Mülakat cümlesi kafanda kalsın:
// - "REST API entegrasyonunda modeli fromJson/toJson ile temsil edip, hata yönetimini
//    try/catch ve statusCode kontrolleriyle yapıyorum. Mümkün olduğunca HTTP logic'ini
//    UI'dan ayrı bir service/repository katmanında tutuyorum."

// =====================================================
// 6) CLEAN ARCHITECTURE & SOLID – ÖZET
// =====================================================
//
// Amaç: Kodun sorumluluklarını katmanlara ayırmak ve daha iyi ölçeklenebilir bir yapı kurmak.
//
// Temel katmanlar (yüksek seviye):
//
// lib/
//  ├─ presentation/   → UI (Widget, Screen, ViewModel, Bloc, Provider vs.)
//  ├─ domain/         → İş kuralları (UseCase, Entity, Repository interface'leri)
//  └─ data/           → API, DB, Firebase, Cache (Repository implementation, Models, DataSource)
//
// - Presentation: Sadece çizim ve kullanıcı etkileşimi.
// - Domain: "Ne yapılacak?" sorusunun cevabı. (business rules)
// - Data: "Veriyi nereden getiriyoruz?" sorusunun cevabı. (API, local db, firebase)
//
// SOLID (çok kısa):
// - S: Single Responsibility → Her sınıfın tek bir işi olmalı.
// - O: Open/Closed → Yeni özellik eklemeye açık, modifiye edilmeye kapalı.
// - L: Liskov Substitution → Alt sınıflar, üst sınıfların yerine sorunsuz geçebilmeli.
// - I: Interface Segregation → Büyük interface'ler yerine küçük, odaklı interface'ler.
// - D: Dependency Inversion → Üst seviye sınıflar, alt seviye implementasyona değil,
//                              soyutlamalara (interface/abstract) bağlı olmalı.


// =====================================================
// 7) GIT – VERSİYON KONTROL TEMEL NOTLARI
// =====================================================
//
// - Git, kodun versiyon yönetimi için kullanılır.
// - Temel komutlar:
//   * git status        → durum
//   * git add .         → değişiklikleri ekle
//   * git commit -m ""  → değişiklikleri kaydet
//   * git push          → remote'a gönder
//
// - Branch kullanımı:
//   * main/master → ana dal
//   * feature/x  → yeni özellik
//   * hotfix/x   → acil düzeltme
//
// - İyi bir pratik:
//   * "feature/product-list" gibi branch aç
//   * İşin bittiğinde PR/MR aç
//   * Commit mesajlarını anlaşılır yaz (feat:, fix:, refactor: prefixleri güzel görünür)


// =====================================================
// 8) PERFORMANS VE MONİTÖRİNG
// =====================================================
//
// Performans için temel prensipler:
// - const keyword kullan: Değişmeyen widget'ları const yap.
// - Widget'ı küçük parçalara böl: Büyük build metotlarından kaçın.
// - ListView.builder / GridView.builder kullan (büyük listelerde).
// - Gereksiz rebuild'i azaltmak için:
//   * Selector (Provider'da) veya select (Riverpod) kullanılabilir.
//   * Stateless/Stateful ayrımını doğru yap.
// - Debug modda değil, profile modda ölçüm yap.
//
// Flutter DevTools:
// - Rebuild count, frame süresi, jank gibi değerleri görebilirsin.
// - UI yavaşsa, hangi widget'ın ağır olduğunu inceleyebilirsin.
//
// Firebase tarafı (monitoring):
// - Crashlytics → Hataları, exception'ları takip etmek için.
// - Performance → Endpoint süresi, ekran açılış süreleri, yavaşlık analizi.


// =====================================================
// 9) FIREBASE TEMEL NOTLARI
// =====================================================
//
// Firebase yaygın servisleri:
// - Auth        → Kullanıcı girişi (email/password, Google, Apple vs.)
// - Firestore   → NoSQL gerçek zamanlı database (collection/document yapısı).
// - Messaging   → Push bildirimleri (FCM).
// - Analytics   → Event takibi, kullanıcı davranışı analizi.
// - Crashlytics → Hata raporlama.
//
// Firestore yapısı:
// - collection → document → fields
//   Örn: users / {userId} / todos / {todoId}
//
// Temel güvenlik kuralları (security rules) örneği:
// - Sadece giriş yapmış kullanıcı okuyabilsin/yazabilsin:
//
//   allow read, write: if request.auth != null;
//
// - Kullanıcı sadece kendi kaydını görsün:
//
//   match /users/{userId} {
//     allow read, write: if request.auth != null && request.auth.uid == userId;
//   }
//
// İndeksleme:
// - where + orderBy gibi sorgularda Firestore bazen "index required" hatası verir.
// - Console'daki linke tıklayıp ilgili composite index'i oluşturman gerekir.


// =====================================================
// 10) GENEL MÜLAKAT İPUÇLARI (KISA CÜMLELER)
// =====================================================
//
// - "Flutter'da state management için genellikle Provider veya Bloc kullanıyorum.
//    Küçük ekranlarda setState, orta/büyük projelerde ise Provider/Bloc tercih ediyorum."
//
// - "REST API entegrasyonunda Dio/http ile çalışıp, JSON modellerini fromJson/toJson
//    metodlarıyla temsil etmeye dikkat ediyorum. Error handling'i ayrı bir katmanda
//    yönetmeye çalışıyorum."
//
// - "Clean Architecture yaklaşımıyla UI'yı Presentation katmanında, iş kurallarını
//    Domain katmanında, veri kaynaklarını ise Data katmanında tutmayı tercih ediyorum."
//
// - "Performans tarafında gereksiz rebuild'i azaltmak için const, küçük widget'lar,
//    ListView.builder ve gerektiğinde Flutter DevTools kullanıyorum."
//
// - "Firebase tarafında Auth + Firestore + Crashlytics + Analytics kombinasyonu ile
//    hem kullanıcı yönetimi hem de hata ve event takibi yapıyorum."
//
//
// Bu notları okurken, yanlarına kendi örneklerini (kullandığın ekranlar, repo linklerin,
// gerçek projelerinden referanslar) yazarsan çok daha kalıcı olur.