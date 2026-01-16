// ============================================
// 🎯 FLUTTER & DART MÜLAKATı HAZIRLIK DOSYASI
// ============================================
// Bu dosya mülakat sorularına hazırlık için
// temel kavramları ve örnekleri içerir.
//
// ============================================
// 📌 BÖLÜM 1: DART TEMELLERİ (BASICS)
// ============================================
//20.01.2026
// --------------------------------------------
// 1.1 DEĞİŞKEN TİPLERİ (Variable Types)
// --------------------------------------------

void variableTypes() {
  // 🔹 var - Tip çıkarımı (Type inference)
  // Dart, değere bakarak tipi otomatik belirler
  var name = "Emre"; // String olarak çıkarıldı
  var age = 25; // int olarak çıkarıldı
  var isActive = true; // bool olarak çıkarıldı

  // 🔹 Explicit Type - Açık tip tanımlama
  String city = "Istanbul";
  int year = 2026;
  double price = 99.99;
  bool isStudent = false;

  // 🔹 dynamic - Herhangi bir tip olabilir, runtime'da değişebilir
  // ⚠️ Mülakat Sorusu: var vs dynamic farkı nedir?
  dynamic anything = "Hello";
  anything = 123; // ✅ Hata vermez, tip değişebilir
  anything = true; // ✅ Yine değişebilir

  // 🔹 final - Bir kez atanır, değiştirilemez (runtime'da belirlenir)
  final DateTime now = DateTime.now(); // Runtime'da değeri belirlenir
  final username = "user123";
  // username = "newUser"; // ❌ HATA! final değiştirilemez

  // 🔹 const - Compile-time sabiti
  // ⚠️ Mülakat Sorusu: final vs const farkı nedir?
  const double pi = 3.14159; // Derleme zamanında belli
  const maxItems = 100;
  // const currentTime = DateTime.now(); // ❌ HATA! DateTime.now() runtime

  // 🔹 late - Sonradan initialize edilecek non-nullable değişken
  late String description;
  // description kullanılmadan önce mutlaka değer atanmalı
  description = "Bu bir açıklama";
}

// --------------------------------------------
// 1.2 FINAL vs CONST DETAYLI KARŞILAŞTIRMA
// --------------------------------------------

// ⚠️ ÖNEMLİ MÜLAKAT SORUSU!
void finalVsConst() {
  // FINAL:
  // - Runtime'da değer atanabilir
  // - Sadece bir kez atanır
  // - Instance variable olabilir
  final timestamp = DateTime.now(); // ✅ Runtime değeri OK

  // CONST:
  // - Compile-time'da değer belli olmalı
  // - Daha performanslı (tek instance)
  // - Instance variable olamaz (static olmalı)
  const greeting = "Merhaba"; // ✅ Compile-time sabiti

  // 📍 Liste örneği ile fark:
  final List<int> finalList = [1, 2, 3];
  finalList.add(4); // ✅ İçeriği değişebilir
  // finalList = [5, 6]; // ❌ Referans değişemez

  const List<int> constList = [1, 2, 3];
  // constList.add(4); // ❌ İçeriği de değişemez!
  // constList = [5, 6]; // ❌ Referans da değişemez
}

// --------------------------------------------
// 1.3 NULL SAFETY
// --------------------------------------------

// ⚠️ ÖNEMLİ MÜLAKAT SORUSU: Dart'ta Null Safety nedir?
void nullSafety() {
  // 🔹 Non-nullable - Varsayılan olarak null olamaz
  String name = "Emre";
  // name = null; // ❌ HATA!

  // 🔹 Nullable - ? ile null olabilir
  String? nickname; // null olabilir
  nickname = null; // ✅ OK
  nickname = "Em";

  // 🔹 Null-aware operatörler
  String? maybeNull;

  // ?? - Null ise varsayılan değer
  String result = maybeNull ?? "Varsayılan";

  // ??= - Null ise ata
  maybeNull ??= "Atandı";

  // ?. - Null değilse çağır
  int? length = maybeNull?.length; // null ise length da null olur

  // ! - Null olmadığından eminsen (tehlikeli!)
  // String definitelyNotNull = maybeNull!; // Runtime hatası riski!
}

// --------------------------------------------
// 1.4 COLLECTION TYPES (Koleksiyon Tipleri)
// --------------------------------------------

void collectionTypes() {
  // 🔹 List - Sıralı, indeksli koleksiyon
  List<String> fruits = ["Elma", "Armut", "Muz"];
  var numbers = [1, 2, 3, 4, 5]; // List<int>
  fruits.add("Çilek"); // ["Elma", "Armut", "Muz", "Çilek"]
  fruits[0]; // "Elma"

  // 🔹 Set - Benzersiz elemanlar, sırasız
  Set<int> uniqueNumbers = {1, 2, 3, 3, 3}; // {1, 2, 3}
  uniqueNumbers.add(4); // {1, 2, 3, 4}
  uniqueNumbers.contains(2); // true

  // 🔹 Map - Anahtar-değer çiftleri
  Map<String, int> ages = {
    "Emre": 25,
    "Ahmet": 30,
  };
  ages["Emre"]; // 25
  ages["Mehmet"] = 28; // Ekleme

  print(ages); // {Emre: 25, Ahmet: 30, Mehmet: 28}

  // 🔹 Spread Operator (...)
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1, 4]; // [0, 1, 2, 3, 4]

  // 🔹 Collection if ve for
  bool isLoggedIn = true;
  var menu = [
    "Ana Sayfa",
    if (isLoggedIn) "Profil", // Koşullu ekleme
    "Ayarlar",
  ];

  var squares = [
    for (var i = 1; i <= 5; i++) i * i, // [1, 4, 9, 16, 25]
  ];
}

// --------------------------------------------
// 1.5 FUNCTIONS (Fonksiyonlar)
// --------------------------------------------

// 🔹 Normal fonksiyon
int add(int a, int b) {
  return a + b;
}

// 🔹 Arrow function (tek satırlık)
int multiply(int a, int b) => a * b;

// 🔹 Named Parameters (İsimli parametreler)
// ⚠️ Mülakat Sorusu: Named vs Positional parameter farkı?
void greet({required String name, int age = 18}) {
  print("Merhaba $name, yaşınız: $age");
}
// Kullanım: greet(name: "Emre", age: 25);
// Kullanım: greet(name: "Ahmet"); // age = 18 varsayılan

// 🔹 Positional Optional Parameters
void showInfo(String name, [int? age, String? city]) {
  print("$name - $age - $city");
}
// Kullanım: showInfo("Emre");
// Kullanım: showInfo("Emre", 25);
// Kullanım: showInfo("Emre", 25, "Istanbul");

// 🔹 Higher-Order Functions
// Fonksiyonu parametre olarak alan veya döndüren fonksiyonlar
void processNumbers(List<int> numbers, Function(int) processor) {
  for (var num in numbers) {
    processor(num);
  }
}

// 🔹 Anonymous Functions (Lambda)
void anonymousFunctionExample() {
  var numbers = [1, 2, 3, 4, 5];

  // map, where, reduce kullanımı
  var doubled = numbers.map((n) => n * 2).toList(); // [2, 4, 6, 8, 10]
  var evens = numbers.where((n) => n % 2 == 0).toList(); // [2, 4]
  var sum = numbers.reduce((a, b) => a + b); // 15
  var sum2 = numbers.fold(0, (a, b) => a + b); // 15
}

// ============================================
// 📌 BÖLÜM 2: OOP (Nesne Yönelimli Programlama)
// ============================================

// --------------------------------------------
// 2.1 CLASS TEMELLERI
// --------------------------------------------

class Person {
  // 🔹 Instance variables
  String name;
  int age;
  String? email; // Nullable

  // 🔹 Static variable (sınıfa ait)
  static int totalPersons = 0;

  // 🔹 Constructor
  Person(this.name, this.age, [this.email]) {
    totalPersons++;
  }

  // 🔹 Named Constructor
  Person.guest()
      : name = "Misafir",
        age = 0;

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        email = json['email'];

  // 🔹 Instance method
  void introduce() {
    print("Merhaba, ben $name, $age yaşındayım.");
  }

  // 🔹 Getter
  bool get isAdult => age >= 18;

  // 🔹 Setter
  set setAge(int value) {
    if (value >= 0) age = value;
  }

  // 🔹 Static method
  static void showTotal() {
    print("Toplam kişi sayısı: $totalPersons");
  }

  // 🔹 toString override
  @override
  String toString() => "Person(name: $name, age: $age)";
}

// --------------------------------------------
// 2.2 INHERITANCE (Kalıtım)
// --------------------------------------------

class Animal {
  String name;
  Animal(this.name);

  void makeSound() {
    print("Ses çıkardı");
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print("Hav hav!");
  }

  void fetch() {
    print("$name topu getiriyor");
  }
}

// --------------------------------------------
// 2.3 ABSTRACT CLASS
// --------------------------------------------

// ⚠️ Mülakat Sorusu: Abstract class ne zaman kullanılır?
abstract class Shape {
  // Abstract method - gövdesi yok
  double calculateArea();

  // Normal method - gövdesi var
  void describe() {
    print("Bu bir şekildir");
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double calculateArea() => 3.14159 * radius * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double calculateArea() => width * height;
}

// --------------------------------------------
// 2.4 MIXIN
// --------------------------------------------

// ⚠️ Mülakat Sorusu: Mixin nedir? Abstract class'tan farkı?
// - Mixin: Birden fazla sınıfa davranış ekler (with)
// - Constructor'ı olmaz
// - Çoklu kalıtım sağlar

mixin Flyable {
  void fly() {
    print("Uçuyor!");
  }
}

mixin Swimmable {
  void swim() {
    print("Yüzüyor!");
  }
}

class Duck extends Animal with Flyable, Swimmable {
  Duck(String name) : super(name);
}
// Duck hem uçabilir hem yüzebilir!

// --------------------------------------------
// 2.5 INTERFACE (Implicit)
// --------------------------------------------

// ⚠️ Dart'ta explicit interface keyword'ü yok
// Her class aynı zamanda bir interface'dir

class Printable {
  void printInfo() {
    print("Yazdırılıyor...");
  }
}

class Document implements Printable {
  @override
  void printInfo() {
    print("Belge yazdırılıyor...");
  }
}

// ============================================
// 📌 BÖLÜM 3: ASYNC PROGRAMMING
// ============================================

// --------------------------------------------
// 3.1 FUTURE
// --------------------------------------------

// ⚠️ Mülakat Sorusu: Future nedir?
// Future: Gelecekte tamamlanacak bir değeri temsil eder

Future<String> fetchUserName() async {
  // API çağrısı simülasyonu
  await Future.delayed(Duration(seconds: 2));
  return "Emre";
}

Future<void> futureExample() async {
  print("Yükleniyor...");

  // 🔹 await ile bekleme
  String name = await fetchUserName();
  print("Hoşgeldin $name");

  // 🔹 then ile zincirleme
  fetchUserName().then((name) {
    print("Hoşgeldin $name");
  }).catchError((error) {
    print("Hata: $error");
  });
}

// --------------------------------------------
// 3.2 STREAM
// --------------------------------------------

// ⚠️ Mülakat Sorusu: Stream vs Future farkı?
// Future: Tek bir değer döner
// Stream: Birden fazla değer döner (sürekli veri akışı)

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Her saniye bir değer yayar
  }
}

void streamExample() {
  countStream(5).listen((number) {
    print("Sayı: $number");
  });
}

// ============================================
// 📌 BÖLÜM 4: FLUTTER WIDGET LIFECYCLE
// ============================================

// --------------------------------------------
// 4.1 STATELESS WIDGET
// --------------------------------------------

// ⚠️ Mülakat Sorusu: StatelessWidget ne zaman kullanılır?
// - State (durum) değişmeyen widget'lar için
// - Sadece build metodu var
// - Immutable - değişmez

/*
class MyStatelessWidget extends StatelessWidget {
  final String title;
  
  const MyStatelessWidget({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
*/

// --------------------------------------------
// 4.2 STATEFUL WIDGET LIFECYCLE
// --------------------------------------------

// ⚠️ Mülakat Sorusu: StatefulWidget'ın lifecycle metodları nelerdir?

/*
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  
  // 1️⃣ createState() - Widget oluşturulduğunda çağrılır
  
  // 2️⃣ initState() - State ilk kez oluşturulduğunda (bir kez)
  @override
  void initState() {
    super.initState();
    // API çağrıları, subscription'lar burada başlatılır
  }
  
  // 3️⃣ didChangeDependencies() - Bağımlılıklar değiştiğinde
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // InheritedWidget değişikliklerinde çağrılır
  }
  
  // 4️⃣ build() - UI oluşturulurken (her setState'de çağrılır)
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  // 5️⃣ didUpdateWidget() - Parent widget yeniden build olduğunda
  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Yeni widget ile eski widget karşılaştırılabilir
  }
  
  // 6️⃣ deactivate() - Widget tree'den geçici olarak çıkarıldığında
  @override
  void deactivate() {
    super.deactivate();
  }
  
  // 7️⃣ dispose() - Widget kalıcı olarak yok edildiğinde (bir kez)
  @override
  void dispose() {
    // Controller'lar, subscription'lar burada temizlenir
    super.dispose();
  }
}
*/

// ============================================
// 📌 BÖLÜM 5: STATE MANAGEMENT
// ============================================

// ⚠️ ÇOK ÖNEMLİ MÜLAKAT KONUSU!

// --------------------------------------------
// 5.1 setState (Built-in)
// --------------------------------------------

// En basit state yönetimi - Sadece küçük uygulamalar için

/*
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  
  void _increment() {
    setState(() {
      _counter++;  // UI yeniden build olur
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_counter'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('Artır'),
        ),
      ],
    );
  }
}
*/

// 🔴 setState Dezavantajları:
// - Prop drilling (state'i alt widget'lara geçirmek zor)
// - Tüm widget yeniden build olur
// - Büyük uygulamalarda karmaşık

// --------------------------------------------
// 5.2 INHERITED WIDGET
// --------------------------------------------

// ⚠️ Mülakat Sorusu: InheritedWidget nedir?
// - Widget tree'de veri paylaşımı sağlar
// - Provider, Riverpod gibi kütüphanelerin temeli
// - of(context) pattern ile kullanılır

/*
class ThemeData {
  final Color primaryColor;
  ThemeData({required this.primaryColor});
}

class ThemeProvider extends InheritedWidget {
  final ThemeData theme;
  
  const ThemeProvider({
    required this.theme,
    required Widget child,
  }) : super(child: child);
  
  static ThemeData of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    return provider!.theme;
  }
  
  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return theme.primaryColor != oldWidget.theme.primaryColor;
  }
}

// Kullanım:
// ThemeProvider(
//   theme: ThemeData(primaryColor: Colors.blue),
//   child: MyApp(),
// )
//
// Erişim:
// final theme = ThemeProvider.of(context);
*/

// --------------------------------------------
// 5.3 PROVIDER (Önerilen - Basit projeler)
// --------------------------------------------

// ⚠️ Mülakat Sorusu: Provider nedir ve nasıl çalışır?
// - InheritedWidget üzerine kurulu
// - Dependency injection sağlar
// - Google tarafından öneriliyor (basit projeler için)

/*
// 1. Model tanımla (ChangeNotifier ile)
class CounterModel extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();  // Dinleyicilere haber ver
  }
  
  void decrement() {
    _count--;
    notifyListeners();
  }
}

// 2. Provider'ı sağla
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

// 3. Widget'ta kullan
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 🔹 context.watch - Değişiklikleri dinler, rebuild eder
    final counter = context.watch<CounterModel>();
    
    // 🔹 context.read - Sadece okur, rebuild etmez
    // final counter = context.read<CounterModel>();
    
    // 🔹 Consumer - Sadece belirli kısmı rebuild eder
    return Consumer<CounterModel>(
      builder: (context, counter, child) {
        return Text('Count: ${counter.count}');
      },
    );
  }
}

// 4. Aksiyon çağır
ElevatedButton(
  onPressed: () => context.read<CounterModel>().increment(),
  child: Text('Artır'),
)
*/

// Provider Türleri:
// - Provider<T> - Değişmeyen değerler
// - ChangeNotifierProvider<T> - Değişen state
// - FutureProvider<T> - Async veriler
// - StreamProvider<T> - Stream verileri
// - MultiProvider - Birden fazla provider

// --------------------------------------------
// 5.4 RIVERPOD (Önerilen - Orta/Büyük projeler)
// --------------------------------------------

// ⚠️ Mülakat Sorusu: Riverpod vs Provider farkı?
// - Compile-time safety (derleme zamanında hata yakalama)
// - Context bağımlılığı yok
// - Daha test edilebilir
// - Auto-dispose özelliği

/*
// 1. Provider tanımla (global)
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);  // Başlangıç değeri
  
  void increment() => state++;
  void decrement() => state--;
}

// 2. Ana App'i ProviderScope ile sar
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// 3. Widget'ta kullan (ConsumerWidget)
class CounterDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🔹 ref.watch - Değişiklikleri dinler
    final count = ref.watch(counterProvider);
    
    // 🔹 ref.read - Sadece okur
    // ref.read(counterProvider.notifier).increment();
    
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          child: Text('Artır'),
        ),
      ],
    );
  }
}

// 4. ConsumerStatefulWidget (state gerekiyorsa)
class MyWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return Text('$count');
  }
}
*/

// Riverpod Provider Türleri:
// - Provider<T> - Sadece okunur değer
// - StateProvider<T> - Basit state
// - StateNotifierProvider<T, S> - Karmaşık state
// - FutureProvider<T> - Async veriler
// - StreamProvider<T> - Stream verileri
// - NotifierProvider<T, S> - Riverpod 2.0+ (yeni syntax)

// --------------------------------------------
// 5.5 BLoC PATTERN (Business Logic Component)
// --------------------------------------------

// ⚠️ Mülakat Sorusu: BLoC pattern nedir?
// - İş mantığını UI'dan ayırır
// - Stream tabanlı
// - Event-driven architecture
// - Büyük ekipler ve enterprise projeler için ideal

/*
// 1. Events - Kullanıcı aksiyonları
abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}

// 2. States - UI durumları
abstract class CounterState {}
class CounterInitial extends CounterState {}
class CounterLoaded extends CounterState {
  final int count;
  CounterLoaded(this.count);
}

// 3. BLoC - İş mantığı
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      final currentState = state;
      if (currentState is CounterLoaded) {
        emit(CounterLoaded(currentState.count + 1));
      } else {
        emit(CounterLoaded(1));
      }
    });
    
    on<DecrementEvent>((event, emit) {
      final currentState = state;
      if (currentState is CounterLoaded) {
        emit(CounterLoaded(currentState.count - 1));
      }
    });
  }
}

// 4. UI'da kullan
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterLoaded) {
            return Column(
              children: [
                Text('Count: ${state.count}'),
                ElevatedButton(
                  onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
                  child: Text('Artır'),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
*/

// BLoC Widget'ları:
// - BlocProvider - BLoC'u sağlar
// - BlocBuilder - State değişikliklerinde rebuild
// - BlocListener - Side-effect'ler için (navigation, snackbar)
// - BlocConsumer - Builder + Listener birlikte

// --------------------------------------------
// 5.6 STATE MANAGEMENT KARŞILAŞTIRMASI
// --------------------------------------------

/*
┌─────────────────┬──────────────┬─────────────┬─────────────────┐
│                 │   Provider   │  Riverpod   │      BLoC       │
├─────────────────┼──────────────┼─────────────┼─────────────────┤
│ Öğrenme Eğrisi  │    Kolay     │    Orta     │      Zor        │
│ Boilerplate     │    Az        │    Az       │      Çok        │
│ Test Edilebilir │    Orta      │   Çok iyi   │    Çok iyi      │
│ Ölçeklenebilir  │    Orta      │    İyi      │    Çok iyi      │
│ Performans      │    İyi       │  Çok iyi    │    Çok iyi      │
│ Context Bağımlı │    Evet      │   Hayır     │      Evet       │
│ Proje Boyutu    │  Küçük/Orta  │  Orta/Büyük │  Büyük/Enterprise│
└─────────────────┴──────────────┴─────────────┴─────────────────┘
*/

// ============================================
// 📌 BÖLÜM 6: FLUTTER WEB & RESPONSIVE DESIGN
// ============================================

// ⚠️ Mülakat Sorusu: Responsive vs Adaptive farkı nedir?
// (Flutter Docs - Adaptive Apps sayfasından)

// 🔹 RESPONSIVE Design:
//    - UI'ı mevcut alana SIĞDIRMAK
//    - Aynı layout, farklı boyutlar
//    - Örnek: GridView column sayısını değiştirme

// 🔹 ADAPTIVE Design:
//    - UI'ı mevcut alanda KULLANILABILIR yapmak
//    - Farklı platformlar için farklı UI/UX
//    - Örnek: Tablet'te bottom nav yerine side panel

// --------------------------------------------
// 6.1 MEDIAQUERY
// --------------------------------------------

void mediaQueryExample() {
  // BuildContext'e ihtiyaç var (build metodu içinde)
  // final size = MediaQuery.of(context).size;
  // final width = size.width;
  // final height = size.height;
  // final orientation = MediaQuery.of(context).orientation;
  // final padding = MediaQuery.of(context).padding;  // SafeArea
  // final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
}

/*
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1200;
    final isTablet = size.width > 600 && size.width <= 1200;
    final isMobile = size.width <= 600;
    
    if (isDesktop) {
      return DesktopLayout();
    } else if (isTablet) {
      return TabletLayout();
    } else {
      return MobileLayout();
    }
  }
}
*/

// --------------------------------------------
// 6.2 LAYOUTBUILDER
// --------------------------------------------

// ⚠️ Mülakat Sorusu: MediaQuery vs LayoutBuilder farkı?
// MediaQuery: Tüm ekran boyutu
// LayoutBuilder: Parent widget'ın verdiği constraints

/*
class AdaptiveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // constraints.maxWidth - Mevcut max genişlik
        // constraints.maxHeight - Mevcut max yükseklik
        
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Expanded(child: Sidebar()),
              Expanded(flex: 3, child: MainContent()),
            ],
          );
        } else {
          return Column(
            children: [
              MainContent(),
              BottomNavigation(),
            ],
          );
        }
      },
    );
  }
}
*/

// --------------------------------------------
// 6.3 SAFEAREA
// --------------------------------------------

// Notch, status bar, bottom indicator'dan koruma

/*
class SafeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,      // Status bar
      bottom: true,   // Bottom indicator (iPhone X+)
      left: true,
      right: true,
      child: Scaffold(
        body: Text('Güvenli bölge'),
      ),
    );
  }
}
*/

// --------------------------------------------
// 6.4 FLEX & FLEXIBLE WIDGETS
// --------------------------------------------

/*
class FlexibleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔹 Expanded - Kalan tüm alanı kaplar (flex: 1 varsayılan)
        Expanded(
          flex: 2,  // 2 birim alan kaplar
          child: Container(color: Colors.red),
        ),
        
        // 🔹 Flexible - İhtiyacı kadar alan kaplar, esnek
        Flexible(
          flex: 1,  // 1 birim alan (max)
          fit: FlexFit.loose,  // İhtiyacı kadar kullanır
          child: Container(color: Colors.blue),
        ),
        
        // 🔹 Spacer - Boşluk bırakır
        Spacer(flex: 1),
        
        Expanded(
          flex: 1,
          child: Container(color: Colors.green),
        ),
      ],
    );
  }
}
*/

// --------------------------------------------
// 6.5 RESPONSIVE BREAKPOINTS
// --------------------------------------------

class ScreenSize {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  
  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < desktop;
  static bool isDesktop(double width) => width >= desktop;
}

// --------------------------------------------
// 6.6 ADAPTIVE WIDGETS (Platform-aware)
// --------------------------------------------

/*
// Platform'a göre farklı widget'lar
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class AdaptiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  
  const AdaptiveButton({
    required this.onPressed,
    required this.label,
  });
  
  @override
  Widget build(BuildContext context) {
    // Web kontrolü
    if (kIsWeb) {
      return ElevatedButton(onPressed: onPressed, child: Text(label));
    }
    
    // Platform kontrolü
    if (Platform.isIOS) {
      return CupertinoButton(onPressed: onPressed, child: Text(label));
    } else {
      return ElevatedButton(onPressed: onPressed, child: Text(label));
    }
  }
}
*/

// --------------------------------------------
// 6.7 GRIDVIEW RESPONSIVE
// --------------------------------------------

/*
class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Genişliğe göre column sayısı
        int crossAxisCount;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;  // Desktop
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 3;  // Tablet
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;  // Large mobile
        } else {
          crossAxisCount = 1;  // Mobile
        }
        
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(child: Center(child: Text('Item $index')));
          },
        );
      },
    );
  }
}
*/

// --------------------------------------------
// 6.8 ASPECT RATIO & FRACTIONALLYSIZEDBOX
// --------------------------------------------

/*
// AspectRatio - En-boy oranını korur
AspectRatio(
  aspectRatio: 16 / 9,  // Video oranı
  child: Container(color: Colors.blue),
)

// FractionallySizedBox - Parent'ın yüzdesi kadar boyut
FractionallySizedBox(
  widthFactor: 0.8,   // Parent genişliğinin %80'i
  heightFactor: 0.5,  // Parent yüksekliğinin %50'si
  child: Container(color: Colors.red),
)
*/

// ============================================
// 📌 BÖLÜM 7: NAVIGATION & ROUTING
// ============================================

// --------------------------------------------
// 7.1 TEMEL NAVIGATION (Navigator 1.0)
// --------------------------------------------

/*
// Push - Yeni sayfa ekle
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);

// Pop - Geri dön
Navigator.pop(context);

// PushReplacement - Mevcut sayfayı değiştir
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);

// PushAndRemoveUntil - Stack'i temizle
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
  (route) => false,  // Tüm route'ları kaldır
);

// Named Routes
Navigator.pushNamed(context, '/second');
Navigator.pushReplacementNamed(context, '/home');
*/

// --------------------------------------------
// 7.2 GO_ROUTER (Önerilen)
// --------------------------------------------

// ⚠️ Mülakat Sorusu: GoRouter avantajları nelerdir?
// - Declarative routing
// - Deep linking desteği
// - Web URL desteği
// - Nested navigation
// - Redirect & guard desteği

/*
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        // Nested route
        GoRoute(
          path: 'details/:id',  // Path parameter
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return DetailsPage(id: id!);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
  
  // Auth redirect
  redirect: (context, state) {
    final isLoggedIn = authService.isLoggedIn;
    final isLoggingIn = state.matchedLocation == '/login';
    
    if (!isLoggedIn && !isLoggingIn) return '/login';
    if (isLoggedIn && isLoggingIn) return '/';
    return null;  // Redirect yok
  },
  
  // Error page
  errorBuilder: (context, state) => ErrorPage(),
);

// Kullanım:
// context.go('/');
// context.go('/details/123');
// context.push('/details/456');  // Stack'e ekler
// context.pop();
*/

// ============================================
// 📌 BÖLÜM 8: DEPENDENCY INJECTION
// ============================================

// ⚠️ Mülakat Sorusu: Dependency Injection nedir?
// - Bağımlılıkları dışarıdan enjekte etme
// - Loose coupling (gevşek bağlantı)
// - Test edilebilirlik
// - Single Responsibility Principle

// --------------------------------------------
// 8.1 GETIT (Service Locator)
// --------------------------------------------

/*
// 1. GetIt instance'ı oluştur
final getIt = GetIt.instance;

// 2. Servisleri kaydet
void setupDependencies() {
  // 🔹 registerSingleton - Tek instance (eager)
  getIt.registerSingleton<ApiService>(ApiService());
  
  // 🔹 registerLazySingleton - Tek instance (lazy, ilk kullanımda oluşur)
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
  
  // 🔹 registerFactory - Her seferinde yeni instance
  getIt.registerFactory<UserRepository>(() => UserRepository(
    apiService: getIt<ApiService>(),
  ));
  
  // 🔹 registerFactoryParam - Parametreli factory
  getIt.registerFactoryParam<UserBloc, String, void>(
    (userId, _) => UserBloc(userId: userId),
  );
}

// 3. Kullanım
class MyWidget extends StatelessWidget {
  final apiService = getIt<ApiService>();
  final userRepo = getIt<UserRepository>();
  
  // Parametreli
  final userBloc = getIt<UserBloc>(param1: "user123");
}
*/

// --------------------------------------------
// 8.2 INJECTABLE (GetIt + Code Generation)
// --------------------------------------------

/*
// 1. Annotation ile işaretle
@injectable
class ApiService {
  Future<List<User>> getUsers() async => [];
}

@lazySingleton
class DatabaseService {
  void init() {}
}

@singleton
class AuthService {
  bool get isLoggedIn => false;
}

// 2. Abstract class ile interface
abstract class UserRepository {
  Future<User> getUser(String id);
}

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;
  
  UserRepositoryImpl(this._apiService);  // Auto-inject
  
  @override
  Future<User> getUser(String id) async => User();
}

// 3. Environment based registration
@Environment('dev')
@Injectable(as: ApiService)
class MockApiService implements ApiService {}

@Environment('prod')
@Injectable(as: ApiService)
class RealApiService implements ApiService {}
*/

// ============================================
// 📌 BÖLÜM 9: API INTEGRATION
// ============================================

// --------------------------------------------
// 9.1 DIO (HTTP Client)
// --------------------------------------------

/*
// 1. Dio instance oluştur
final dio = Dio(BaseOptions(
  baseUrl: 'https://api.example.com',
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 3),
  headers: {
    'Content-Type': 'application/json',
  },
));

// 2. Interceptor ekle
dio.interceptors.add(InterceptorsWrapper(
  onRequest: (options, handler) {
    // Token ekle
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  },
  onResponse: (response, handler) {
    // Response işle
    handler.next(response);
  },
  onError: (error, handler) {
    // Hata işle
    if (error.response?.statusCode == 401) {
      // Token yenile
    }
    handler.next(error);
  },
));

// 3. HTTP istekleri
class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  
  // GET
  Future<List<User>> getUsers() async {
    final response = await _dio.get('/users');
    return (response.data as List)
        .map((json) => User.fromJson(json))
        .toList();
  }
  
  // POST
  Future<User> createUser(User user) async {
    final response = await _dio.post('/users', data: user.toJson());
    return User.fromJson(response.data);
  }
  
  // PUT
  Future<User> updateUser(String id, User user) async {
    final response = await _dio.put('/users/$id', data: user.toJson());
    return User.fromJson(response.data);
  }
  
  // DELETE
  Future<void> deleteUser(String id) async {
    await _dio.delete('/users/$id');
  }
}
*/

// --------------------------------------------
// 9.2 RETROFIT (Type-safe API Client)
// --------------------------------------------

/*
// 1. API interface tanımla
@RestApi(baseUrl: 'https://api.example.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  
  @GET('/users')
  Future<List<User>> getUsers();
  
  @GET('/users/{id}')
  Future<User> getUser(@Path('id') String id);
  
  @POST('/users')
  Future<User> createUser(@Body() User user);
  
  @PUT('/users/{id}')
  Future<User> updateUser(@Path('id') String id, @Body() User user);
  
  @DELETE('/users/{id}')
  Future<void> deleteUser(@Path('id') String id);
  
  @GET('/search')
  Future<List<User>> searchUsers(@Query('q') String query);
  
  @Multipart()
  @POST('/upload')
  Future<void> uploadFile(@Part() File file);
}

// 2. Kullanım
final dio = Dio();
final client = ApiClient(dio);
final users = await client.getUsers();
*/

// ============================================
// 📌 BÖLÜM 10: LOCAL STORAGE
// ============================================

// --------------------------------------------
// 10.1 SHARED PREFERENCES (Key-Value)
// --------------------------------------------

/*
// Basit veri saklama - String, int, double, bool, List<String>

class LocalStorage {
  static Future<SharedPreferences> get _prefs async => 
      await SharedPreferences.getInstance();
  
  // Kaydet
  static Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString('auth_token', token);
  }
  
  static Future<void> saveUserId(int id) async {
    final prefs = await _prefs;
    await prefs.setInt('user_id', id);
  }
  
  static Future<void> saveIsLoggedIn(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool('is_logged_in', value);
  }
  
  // Oku
  static Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString('auth_token');
  }
  
  // Sil
  static Future<void> clearAll() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
*/

// --------------------------------------------
// 10.2 HIVE (NoSQL Database)
// --------------------------------------------

/*
// Hızlı, hafif NoSQL veritabanı

// 1. Model tanımla
@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String email;
  
  User({required this.id, required this.name, required this.email});
}

// 2. Başlat (main.dart)
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());  // Generated
  await Hive.openBox<User>('users');
  runApp(MyApp());
}

// 3. CRUD işlemleri
class UserRepository {
  final Box<User> _userBox = Hive.box<User>('users');
  
  // Create
  Future<void> addUser(User user) async {
    await _userBox.put(user.id, user);
  }
  
  // Read
  User? getUser(String id) => _userBox.get(id);
  
  List<User> getAllUsers() => _userBox.values.toList();
  
  // Update
  Future<void> updateUser(User user) async {
    await user.save();  // HiveObject method
  }
  
  // Delete
  Future<void> deleteUser(String id) async {
    await _userBox.delete(id);
  }
  
  // Listen to changes
  ValueListenable<Box<User>> get listenable => _userBox.listenable();
}
*/

// --------------------------------------------
// 10.3 SQFLITE (SQL Database)
// --------------------------------------------

/*
// İlişkisel veritabanı

class DatabaseHelper {
  static Database? _database;
  
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }
  
  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            email TEXT NOT NULL
          )
        ''');
      },
    );
  }
  
  // INSERT
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }
  
  // SELECT
  Future<List<User>> getUsers() async {
    final db = await database;
    final maps = await db.query('users');
    return maps.map((map) => User.fromMap(map)).toList();
  }
  
  // UPDATE
  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }
  
  // DELETE
  Future<int> deleteUser(String id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
*/

// ============================================
// 📌 BÖLÜM 11: TESTING
// ============================================

// ⚠️ Mülakat Sorusu: Flutter'da test türleri nelerdir?
// 1. Unit Test - İş mantığı
// 2. Widget Test - UI bileşenleri
// 3. Integration Test - Tam uygulama

// --------------------------------------------
// 11.1 UNIT TEST
// --------------------------------------------

/*
// test/calculator_test.dart

import 'package:flutter_test/flutter_test.dart';

class Calculator {
  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
}

void main() {
  late Calculator calculator;
  
  // Her test öncesi çalışır
  setUp(() {
    calculator = Calculator();
  });
  
  // Grup
  group('Calculator', () {
    test('should add two numbers', () {
      // Arrange
      final a = 5;
      final b = 3;
      
      // Act
      final result = calculator.add(a, b);
      
      // Assert
      expect(result, 8);
    });
    
    test('should subtract two numbers', () {
      expect(calculator.subtract(5, 3), 2);
    });
  });
}

// Komut: flutter test test/calculator_test.dart
*/

// --------------------------------------------
// 11.2 WIDGET TEST
// --------------------------------------------

/*
// test/counter_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments when button tapped', (tester) async {
    // Build widget
    await tester.pumpWidget(MaterialApp(home: CounterPage()));
    
    // Verify initial state
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    
    // Tap the button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();  // Rebuild
    
    // Verify new state
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  
  testWidgets('finds a Text widget', (tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));
    
    // Find by text
    expect(find.text('Hello'), findsOneWidget);
    
    // Find by key
    expect(find.byKey(Key('my_button')), findsOneWidget);
    
    // Find by type
    expect(find.byType(ElevatedButton), findsNWidgets(2));
    
    // Find by icon
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}

// Komut: flutter test test/counter_widget_test.dart
*/

// --------------------------------------------
// 11.3 INTEGRATION TEST
// --------------------------------------------

/*
// integration_test/app_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group('end-to-end test', () {
    testWidgets('complete login flow', (tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();  // Animasyonları bekle
      
      // Email gir
      await tester.enterText(
        find.byKey(Key('email_field')),
        'test@example.com',
      );
      
      // Password gir
      await tester.enterText(
        find.byKey(Key('password_field')),
        'password123',
      );
      
      // Login butonuna tıkla
      await tester.tap(find.byKey(Key('login_button')));
      await tester.pumpAndSettle();
      
      // Home page'de olduğunu doğrula
      expect(find.text('Welcome'), findsOneWidget);
    });
  });
}

// Komut: flutter test integration_test/app_test.dart
*/

// --------------------------------------------
// 11.4 MOCKING (Mockito)
// --------------------------------------------

/*
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late UserRepository userRepository;
  
  setUp(() {
    mockApiService = MockApiService();
    userRepository = UserRepository(mockApiService);
  });
  
  test('should return user list', () async {
    // Arrange - Mock davranış tanımla
    when(mockApiService.getUsers()).thenAnswer(
      (_) async => [User(id: '1', name: 'Test')],
    );
    
    // Act
    final users = await userRepository.getUsers();
    
    // Assert
    expect(users.length, 1);
    verify(mockApiService.getUsers()).called(1);
  });
}
*/

// ============================================
// 📌 BÖLÜM 12: PERFORMANCE OPTIMIZATION
// ============================================

// ⚠️ Mülakat Sorusu: Flutter'da performans nasıl optimize edilir?

// --------------------------------------------
// 12.1 WIDGET OPTIMIZATION
// --------------------------------------------

/*
// 🔹 1. const constructors kullan
const MyWidget();  // Yeniden build etmez

// 🔹 2. RepaintBoundary - Gereksiz repaint'i önle
RepaintBoundary(
  child: ExpensiveWidget(),
)

// 🔹 3. ListView.builder - Lazy loading
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemWidget(items[index]),
)

// 🔹 4. Keys kullan - Widget reuse
ListView(
  children: items.map((item) => ItemWidget(key: ValueKey(item.id), item)).toList(),
)

// 🔹 5. Selector/Consumer ile hedefli rebuild (Provider)
Selector<MyModel, int>(
  selector: (_, model) => model.counter,  // Sadece counter değişirse
  builder: (_, counter, __) => Text('$counter'),
)

// 🔹 6. AutomaticKeepAliveClientMixin - Tab state koruma
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);  // Önemli!
    return Container();
  }
}
*/

// --------------------------------------------
// 12.2 IMAGE OPTIMIZATION
// --------------------------------------------

/*
// 🔹 1. Doğru boyutta resim yükle
Image.network(
  url,
  width: 100,
  height: 100,
  cacheWidth: 200,   // 2x for retina
  cacheHeight: 200,
)

// 🔹 2. CachedNetworkImage kullan
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
)

// 🔹 3. Precache images
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  precacheImage(AssetImage('assets/large_image.png'), context);
}
*/

// --------------------------------------------
// 12.3 MEMORY MANAGEMENT
// --------------------------------------------

/*
// 🔹 1. dispose() içinde temizlik yap
@override
void dispose() {
  _controller.dispose();
  _subscription.cancel();
  _focusNode.dispose();
  super.dispose();
}

// 🔹 2. GlobalKey'leri dikkatli kullan
// Gerekmedikçe kullanma, memory leak riski

// 🔹 3. Large lists için pagination
Future<void> loadMore() async {
  if (_isLoading) return;
  _isLoading = true;
  final newItems = await api.getItems(page: _currentPage);
  setState(() {
    items.addAll(newItems);
    _currentPage++;
    _isLoading = false;
  });
}
*/

// ============================================
// 📌 BÖLÜM 13: SOLID PRINCIPLES & CLEAN ARCHITECTURE
// ============================================

// ⚠️ Mülakat Sorusu: SOLID prensipleri nelerdir?

// --------------------------------------------
// 13.1 SOLID PRINCIPLES
// --------------------------------------------

/*
📌 S - Single Responsibility Principle
   Her class tek bir sorumluluğa sahip olmalı
*/
// ❌ Kötü
class UserManager {
  void saveUser(User user) {}
  void sendEmail(String email) {}  // Başka sorumluluk!
  void generateReport() {}         // Başka sorumluluk!
}

// ✅ İyi
class UserRepository {
  void saveUser(User user) {}
}
class EmailService {
  void sendEmail(String email) {}
}
class ReportGenerator {
  void generateReport() {}
}

/*
📌 O - Open/Closed Principle
   Genişlemeye açık, değişikliğe kapalı
*/
// ❌ Kötü
class PaymentProcessor {
  void process(String type) {
    if (type == 'credit') { /* ... */ }
    else if (type == 'paypal') { /* ... */ }
    // Yeni tip eklemek için kodu değiştirmeli
  }
}

// ✅ İyi
abstract class PaymentMethod {
  void process();
}
class CreditCardPayment implements PaymentMethod {
  @override void process() {}
}
class PaypalPayment implements PaymentMethod {
  @override void process() {}
}
// Yeni tip eklemek için yeni class

/*
📌 L - Liskov Substitution Principle
   Alt sınıflar, üst sınıfların yerine kullanılabilmeli
*/

/*
📌 I - Interface Segregation Principle
   Büyük interface'ler yerine küçük, özelleşmiş interface'ler
*/
// ❌ Kötü
abstract class Animal {
  void eat();
  void fly();   // Balık uçamaz!
  void swim();  // Kuş yüzemez!
}

// ✅ İyi
abstract class Eatable { void eat(); }
abstract class Flyable { void fly(); }
abstract class Swimmable { void swim(); }

class Bird implements Eatable, Flyable {
  @override void eat() {}
  @override void fly() {}
}

/*
📌 D - Dependency Inversion Principle
   Üst seviye modüller alt seviye modüllere bağımlı olmamalı
   Her ikisi de soyutlamalara bağımlı olmalı
*/
// ❌ Kötü
class UserService {
  final MySqlDatabase db = MySqlDatabase();  // Concrete bağımlılık
}

// ✅ İyi
abstract class Database {
  void save(dynamic data);
}
class UserService2 {
  final Database db;  // Abstract bağımlılık
  UserService2(this.db);  // Dependency Injection
}

// --------------------------------------------
// 13.2 CLEAN ARCHITECTURE LAYERS
// --------------------------------------------

/*
┌─────────────────────────────────────────────┐
│              PRESENTATION                   │
│    (UI, Widgets, ViewModels, BLoCs)        │
├─────────────────────────────────────────────┤
│                 DOMAIN                      │
│    (Entities, Use Cases, Repository        │
│     Interfaces)                            │
├─────────────────────────────────────────────┤
│                  DATA                       │
│    (Repository Impl, Data Sources,         │
│     Models, API, Database)                 │
└─────────────────────────────────────────────┘

📁 Klasör Yapısı:
lib/
├── core/
│   ├── error/
│   ├── network/
│   └── utils/
├── features/
│   └── user/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── main.dart
*/

// --------------------------------------------
// 13.3 USE CASE EXAMPLE
// --------------------------------------------

/*
// Domain Layer - Use Case
class GetUserUseCase {
  final UserRepository repository;
  
  GetUserUseCase(this.repository);
  
  Future<Either<Failure, User>> call(String userId) {
    return repository.getUser(userId);
  }
}

// Domain Layer - Repository Interface
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, List<User>>> getUsers();
}

// Data Layer - Repository Implementation
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  
  @override
  Future<Either<Failure, User>> getUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final user = await localDataSource.getCachedUser(id);
        return Right(user);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
*/

// ============================================
// 📌 MÜLAKAT SORULARI - ÖZET
// ============================================

/*
❓ SIKÇA SORULAN SORULAR:

1. var vs dynamic vs Object farkı nedir?
   - var: Compile-time'da tip belirlenir, değiştirilemez
   - dynamic: Runtime'da tip belirlenir, değişebilir
   - Object: Tüm tiplerin üst sınıfı

2. final vs const farkı nedir?
   - final: Runtime'da bir kez atanır
   - const: Compile-time sabiti

3. Null Safety nedir?
   - Değişkenlerin varsayılan olarak null olamaması
   - ? ile nullable, ! ile non-null assertion

4. Abstract class vs Mixin farkı?
   - Abstract: Tek kalıtım, constructor olabilir
   - Mixin: Çoklu davranış ekleme, constructor yok

5. Future vs Stream farkı?
   - Future: Tek değer, async
   - Stream: Birden fazla değer, sürekli akış

6. Hot Reload vs Hot Restart farkı?
   - Hot Reload: State korunur, hızlı
   - Hot Restart: State sıfırlanır, tam yeniden başlatma

7. StatelessWidget vs StatefulWidget farkı?
   - Stateless: State yok, sadece build, immutable
   - Stateful: State var, lifecycle metodları, mutable

8. Provider vs Riverpod vs BLoC karşılaştırması?
   - Provider: Basit, InheritedWidget tabanlı, küçük projeler
   - Riverpod: Compile-safe, context-free, orta/büyük projeler
   - BLoC: Event-driven, stream tabanlı, enterprise projeler

9. MediaQuery vs LayoutBuilder farkı?
   - MediaQuery: Tüm ekran boyutunu verir
   - LayoutBuilder: Parent widget constraints verir

10. Responsive vs Adaptive Design farkı?
    - Responsive: UI'ı alana sığdırma
    - Adaptive: UI'ı platformda kullanılabilir yapma

11. Navigator 1.0 vs GoRouter farkı?
    - Navigator 1.0: Imperative, basit
    - GoRouter: Declarative, deep link, web URL desteği

12. BuildContext nedir?
    - Widget'ın tree'deki konumunu temsil eder
    - Theme, MediaQuery, Navigator erişimi sağlar
    - InheritedWidget'lara erişim için kullanılır

13. Key nedir ve ne zaman kullanılır?
    - Widget'ları benzersiz tanımlar
    - Liste item'ları için (reorder, remove)
    - GlobalKey: Widget'a dışarıdan erişim

14. Widget, Element, RenderObject farkı?
    - Widget: Yapılandırma (immutable)
    - Element: Widget instance'ı (mutable)
    - RenderObject: Çizim ve layout işlemleri

15. Dependency Injection nedir ve neden kullanılır?
    - Bağımlılıkları dışarıdan enjekte etme
    - Loose coupling, test edilebilirlik
    - GetIt (Service Locator), Injectable (code gen)

16. Dio vs http paketi farkı?
    - http: Basit, Flutter team'den
    - Dio: Interceptor, cancel token, FormData desteği

17. SharedPreferences vs Hive vs SQLite?
    - SharedPrefs: Basit key-value (settings)
    - Hive: NoSQL, hızlı, binary format
    - SQLite: İlişkisel, karmaşık sorgular

18. Unit vs Widget vs Integration Test farkı?
    - Unit: İş mantığı, hızlı
    - Widget: UI bileşenleri
    - Integration: Tam uygulama, gerçek cihaz

19. const constructor performansa nasıl etki eder?
    - Widget yeniden build edilmez
    - Aynı instance kullanılır
    - Memory tasarrufu sağlar

20. SOLID prensipleri nelerdir?
    - Single Responsibility, Open/Closed
    - Liskov Substitution, Interface Segregation
    - Dependency Inversion

21. Clean Architecture katmanları nelerdir?
    - Presentation (UI, BLoC)
    - Domain (Entities, Use Cases)
    - Data (Repository, DataSources)

22. Flutter'da memory leak nasıl önlenir?
    - dispose() içinde controller/subscription temizliği
    - GlobalKey dikkatli kullanımı
    - Büyük listeler için pagination
*/
