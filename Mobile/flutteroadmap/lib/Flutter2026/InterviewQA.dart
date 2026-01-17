// ============================================
// 🎯 CODER BYTE MÜLAKAT HAZIRLIK
// 📚 100 SORU-CEVAP: VERİ YAPILARI, UI, STATE MANAGEMENT
// ============================================
// Bu dosya mülakat için kritik 100 soruyu içerir
// ============================================

// ============================================
// 📌 BÖLÜM 1: DART TEMELLERİ (1-20)
// ============================================

/*
❓ SORU 1: var, dynamic ve Object farkı nedir?
✅ CEVAP:
   - var: Compile-time'da tip çıkarımı yapılır, sonra değiştirilemez
   - dynamic: Runtime'da tip belirlenir, değişebilir, tehlikeli
   - Object: Tüm tiplerin üst sınıfı, metot çağrısı için cast gerekir

var name = "Emre";    // String, değiştirilemez
dynamic x = 5;        // int, sonra x = "hello" olabilir
Object o = 10;        // Object, (o as int) + 5 gerekir


❓ SORU 2: final ve const farkı nedir?
✅ CEVAP:
   - final: Runtime'da bir kez atanır
   - const: Compile-time sabiti, daha performanslı

final DateTime now = DateTime.now();  // ✅ Runtime değer
const pi = 3.14;                      // ✅ Compile-time sabit
// const time = DateTime.now();       // ❌ HATA! Runtime değer olamaz

final List<int> finalList = [1, 2, 3];
finalList.add(4);  // ✅ İçerik değişebilir

const List<int> constList = [1, 2, 3];
// constList.add(4); // ❌ İçerik de değişemez


❓ SORU 3: Null Safety nedir?
✅ CEVAP:
   Değişkenlerin varsayılan olarak null olamaması:
   - String name = "Emre";   // Null olamaz
   - String? name;           // Null olabilir
   - name?.length            // Null ise çağırma
   - name ?? "default"       // Null ise varsayılan
   - name!                   // Null olmadığından eminim (tehlikeli!)


❓ SORU 4: late keyword ne işe yarar?
✅ CEVAP:
   Non-nullable değişkeni sonra initialize etmek için:
   
late String description;
// Kullanmadan önce mutlaka değer atanmalı
description = "Açıklama";

// Lazy initialization için de kullanılır:
late final expensiveValue = calculateExpensiveValue();


❓ SORU 5: Named parameter vs Positional parameter farkı?
✅ CEVAP:
   
// Named parameters - {} ile, isim vererek çağrılır
void greet({required String name, int age = 18}) {}
greet(name: "Emre", age: 25);

// Positional parameters - sıraya göre
void showInfo(String name, [int? age]) {}
showInfo("Emre", 25);
showInfo("Emre"); // age opsiyonel


❓ SORU 6: Arrow function (=>) ne zaman kullanılır?
✅ CEVAP:
   Tek satırlık expression'lar için:
   
int add(int a, int b) => a + b;        // Tek satır
bool isEven(int n) => n % 2 == 0;      // Tek expression
// Birden fazla satır için normal {} kullan


❓ SORU 7: Cascade notation (..) nedir?
✅ CEVAP:
   Aynı nesne üzerinde zincirleme işlem:
   
var list = <int>[]
  ..add(1)
  ..add(2)
  ..add(3);
  
// Eşdeğer:
// list.add(1);
// list.add(2);
// list.add(3);


❓ SORU 8: Spread operator (...) nasıl kullanılır?
✅ CEVAP:
   Koleksiyonları birleştirmek için:
   
var list1 = [1, 2, 3];
var list2 = [0, ...list1, 4]; // [0, 1, 2, 3, 4]

// Null-aware spread:
var list3 = [...?nullableList]; // Null ise boş


❓ SORU 9: Collection if ve for nedir?
✅ CEVAP:
   Koleksiyon içinde koşul ve döngü:
   
var menu = [
  "Home",
  if (isLoggedIn) "Profile",  // Koşullu ekleme
  "Settings",
];

var squares = [
  for (var i = 1; i <= 5; i++) i * i,  // [1, 4, 9, 16, 25]
];


❓ SORU 10: Factory constructor nedir?
✅ CEVAP:
   Yeni instance döndürmek zorunda olmayan constructor:
   
class Logger {
  static final Logger _instance = Logger._internal();
  
  factory Logger() {
    return _instance;  // Singleton pattern
  }
  
  Logger._internal();
}


❓ SORU 11: Abstract class vs Mixin farkı?
✅ CEVAP:
   - Abstract class: Tek kalıtım, constructor olabilir
   - Mixin: Çoklu davranış ekleme, constructor yok
   
abstract class Animal {
  void eat();  // Abstract method
  void sleep() => print("Zzz");  // Concrete method
}

mixin Flyable {
  void fly() => print("Uçuyor");  // Davranış ekler
}

class Duck extends Animal with Flyable {
  @override
  void eat() => print("Yiyor");
}


❓ SORU 12: implements vs extends farkı?
✅ CEVAP:
   - extends: Kalıtım, parent metodları kullanabilir
   - implements: Interface, TÜM metodları yeniden yazmalı
   
class Dog extends Animal {}    // Kalıtım, super.eat() kullanabilir
class Cat implements Animal {} // TÜM metodları override etmeli


❓ SORU 13: Covariant keyword ne işe yarar?
✅ CEVAP:
   Alt sınıfta parametre tipini daraltmak için:
   
class Animal {
  void chase(covariant Animal x) {}
}

class Dog extends Animal {
  @override
  void chase(Dog x) {}  // Sadece Dog alabilir
}


❓ SORU 14: Generic (T) nasıl kullanılır?
✅ CEVAP:
   Tip güvenli, yeniden kullanılabilir kod:
   
class Box<T> {
  T value;
  Box(this.value);
}

var intBox = Box<int>(5);
var stringBox = Box<String>("Hello");

// Constraint ile:
class NumberBox<T extends num> {
  T value;
  NumberBox(this.value);
}


❓ SORU 15: Future nedir?
✅ CEVAP:
   Gelecekte tamamlanacak değeri temsil eder:
   
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data";
}

// Kullanım:
final data = await fetchData();
// veya
fetchData().then((data) => print(data));


❓ SORU 16: Stream nedir? Future'dan farkı?
✅ CEVAP:
   - Future: TEK değer döner
   - Stream: BİRDEN FAZLA değer döner (sürekli akış)
   
Stream<int> countStream() async* {
  for (int i = 0; i < 5; i++) {
    yield i;  // Her seferinde bir değer yayar
  }
}

// Dinleme:
countStream().listen((n) => print(n));


❓ SORU 17: async* ve yield ne işe yarar?
✅ CEVAP:
   async*: Stream döndüren generator function
   yield: Stream'e değer ekler
   yield*: Başka stream'i ekler
   
Stream<int> generateNumbers() async* {
  yield 1;
  yield 2;
  yield* anotherStream();  // Başka stream'i yay
}


❓ SORU 18: Isolate nedir?
✅ CEVAP:
   Dart'ta gerçek paralel çalışma (ayrı memory):
   - Main UI thread'i bloklamaz
   - Heavy computation için kullanılır
   - compute() fonksiyonu ile kolay kullanım
   
final result = await compute(heavyTask, inputData);


❓ SORU 19: Extension methods nedir?
✅ CEVAP:
   Mevcut sınıflara metot ekleme:
   
extension StringExtension on String {
  String get reversed => split('').reversed.join('');
  bool get isEmail => contains('@');
}

print("hello".reversed);  // "olleh"
print("test@mail.com".isEmail);  // true


❓ SORU 20: Typedef ne işe yarar?
✅ CEVAP:
   Fonksiyon tipleri için alias:
   
typedef IntCallback = void Function(int);
typedef JsonMap = Map<String, dynamic>;

void processNumbers(List<int> nums, IntCallback callback) {
  for (var n in nums) callback(n);
}
*/

// ============================================
// 📌 BÖLÜM 2: VERİ YAPILARI (21-40)
// ============================================

/*
❓ SORU 21: List vs Set vs Map farkı?
✅ CEVAP:
   - List: Sıralı, indeksli, tekrar olabilir [1, 2, 2, 3]
   - Set: Sırasız, benzersiz elemanlar {1, 2, 3}
   - Map: Anahtar-değer çiftleri {key: value}


❓ SORU 22: Array vs LinkedList farkı?
✅ CEVAP:
   Array (List):
   - İndeks erişimi O(1)
   - Ekleme/silme O(n)
   - Bitişik memory
   
   LinkedList:
   - İndeks erişimi O(n)
   - Ekleme/silme O(1)
   - Dağınık memory, pointer ile bağlı


❓ SORU 23: Stack nedir? Ne zaman kullanılır?
✅ CEVAP:
   LIFO (Last In First Out) yapısı:
   - push(): Ekleme
   - pop(): Çıkarma
   - peek(): Üste bakma
   
   Kullanım alanları:
   - Parantez eşleştirme
   - Undo/Redo
   - DFS algoritması
   - Call stack


❓ SORU 24: Queue nedir? Ne zaman kullanılır?
✅ CEVAP:
   FIFO (First In First Out) yapısı:
   - enqueue(): Sona ekleme
   - dequeue(): Baştan çıkarma
   
   Kullanım alanları:
   - BFS algoritması
   - Task scheduling
   - Print queue


❓ SORU 25: Hash Table / HashMap nasıl çalışır?
✅ CEVAP:
   Key -> Hash Function -> Bucket Index
   - O(1) ortalama arama, ekleme, silme
   - Collision handling: Chaining veya Open Addressing
   - Dart'ta Map zaten hash table kullanır


❓ SORU 26: Binary Search Tree (BST) nedir?
✅ CEVAP:
   - Her node'un sol alt ağacı küçük değerler
   - Sağ alt ağacı büyük değerler
   - O(log n) arama, ekleme (dengeli ise)
   - Worst case O(n) (skewed tree)


❓ SORU 27: Tree traversal türleri nelerdir?
✅ CEVAP:
   - In-order (Sol -> Kök -> Sağ): BST'de sıralı sonuç
   - Pre-order (Kök -> Sol -> Sağ): Clone tree
   - Post-order (Sol -> Sağ -> Kök): Delete tree
   - Level-order (BFS): Seviye bazlı


❓ SORU 28: Heap nedir? Priority Queue ile ilişkisi?
✅ CEVAP:
   Complete binary tree:
   - Min Heap: Parent <= children
   - Max Heap: Parent >= children
   - O(1) min/max erişimi
   - O(log n) ekleme/çıkarma
   - Priority Queue implementasyonunda kullanılır


❓ SORU 29: Graph nedir? Temsil yöntemleri?
✅ CEVAP:
   Node (vertex) ve Edge'lerden oluşur:
   
   Temsil yöntemleri:
   1. Adjacency Matrix: 2D array, O(1) edge check, O(V²) space
   2. Adjacency List: Her vertex için komşu listesi, O(V+E) space


❓ SORU 30: DFS vs BFS farkı?
✅ CEVAP:
   DFS (Depth First Search):
   - Stack kullanır (veya recursive)
   - Derinlemesine gider
   - Path finding, cycle detection
   
   BFS (Breadth First Search):
   - Queue kullanır
   - Seviye seviye gider
   - Shortest path (unweighted)


❓ SORU 31: Big O Notation nedir?
✅ CEVAP:
   Algoritma karmaşıklığını gösterir:
   - O(1): Sabit - array[0]
   - O(log n): Logaritmik - binary search
   - O(n): Lineer - tek döngü
   - O(n log n): Merge sort, Quick sort
   - O(n²): Quadratic - iç içe döngü
   - O(2^n): Exponential - her adımda ikiye katla


❓ SORU 32: Space Complexity nedir?
✅ CEVAP:
   Algoritmanın kullandığı ekstra bellek:
   - O(1): Sabit, extra değişkenler
   - O(n): Input boyutunda extra array
   - O(log n): Recursive call stack (binary search)


❓ SORU 33: Sorting algoritmalarını karşılaştır
✅ CEVAP:
   ┌──────────────┬─────────────┬───────────────┐
   │ Algoritma    │ Time        │ Space │ Stable │
   ├──────────────┼─────────────┼───────┼────────┤
   │ Bubble Sort  │ O(n²)       │ O(1)  │ Evet   │
   │ Selection    │ O(n²)       │ O(1)  │ Hayır  │
   │ Insertion    │ O(n²)       │ O(1)  │ Evet   │
   │ Merge Sort   │ O(n log n)  │ O(n)  │ Evet   │
   │ Quick Sort   │ O(n log n)* │ O(log)│ Hayır  │
   │ Heap Sort    │ O(n log n)  │ O(1)  │ Hayır  │
   └──────────────┴─────────────┴───────┴────────┘


❓ SORU 34: Two Pointer tekniği nedir?
✅ CEVAP:
   İki işaretçi ile problem çözme:
   - Sıralı array'de iki sum
   - Palindrome kontrolü
   - Container with most water

int twoSum(List<int> sortedNums, int target) {
  int left = 0, right = sortedNums.length - 1;
  while (left < right) {
    int sum = sortedNums[left] + sortedNums[right];
    if (sum == target) return sum;
    if (sum < target) left++;
    else right--;
  }
  return -1;
}


❓ SORU 35: Sliding Window tekniği nedir?
✅ CEVAP:
   Sabit veya değişken pencere ile problem çözme:
   - Maximum sum subarray of size k
   - Longest substring without repeating

int maxSumSubarray(List<int> nums, int k) {
  int windowSum = nums.take(k).reduce((a, b) => a + b);
  int maxSum = windowSum;
  
  for (int i = k; i < nums.length; i++) {
    windowSum += nums[i] - nums[i - k];
    if (windowSum > maxSum) maxSum = windowSum;
  }
  
  return maxSum;
}


❓ SORU 36: HashMap ile problem çözme
✅ CEVAP:
   O(1) lookup için kullanılır:
   - Two Sum
   - Anagram grouping
   - Character frequency

// Two Sum HashMap çözümü
List<int> twoSum(List<int> nums, int target) {
  Map<int, int> seen = {};
  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (seen.containsKey(complement)) {
      return [seen[complement]!, i];
    }
    seen[nums[i]] = i;
  }
  return [];
}


❓ SORU 37: Recursion vs Iteration
✅ CEVAP:
   Recursion:
   - Kendini çağıran fonksiyon
   - Base case olmalı
   - Call stack kullanır
   - Daha okunabilir (bazen)
   
   Iteration:
   - Döngü ile çözüm
   - Memory efficient
   - Stack overflow riski yok


❓ SORU 38: Memoization nedir?
✅ CEVAP:
   Önceki sonuçları cache'leme:

Map<int, int> memo = {};

int fib(int n) {
  if (n <= 1) return n;
  if (memo.containsKey(n)) return memo[n]!;
  
  memo[n] = fib(n - 1) + fib(n - 2);
  return memo[n]!;
}
// O(2^n) -> O(n)'e düşer


❓ SORU 39: Dynamic Programming nedir?
✅ CEVAP:
   Overlapping subproblems + optimal substructure:
   
   Yaklaşımlar:
   1. Top-down (Memoization): Recursive + cache
   2. Bottom-up (Tabulation): Iterative, küçükten büyüğe
   
   Örnekler: Fibonacci, Coin Change, Knapsack


❓ SORU 40: Greedy vs Dynamic Programming
✅ CEVAP:
   Greedy:
   - Her adımda lokal optimum seç
   - Global optimum garantisi yok
   - Daha hızlı, basit
   
   Dynamic Programming:
   - Tüm alt problemleri çöz
   - Global optimum garantisi
   - Daha yavaş, karmaşık
*/

// ============================================
// 📌 BÖLÜM 3: FLUTTER UI & WIDGET'LAR (41-60)
// ============================================

/*
❓ SORU 41: StatelessWidget vs StatefulWidget farkı?
✅ CEVAP:
   StatelessWidget:
   - State yok, immutable
   - Sadece build() metodu
   - Performanslı, hafif
   
   StatefulWidget:
   - State var, mutable
   - Lifecycle metodları
   - setState() ile UI güncelleme


❓ SORU 42: Widget, Element, RenderObject farkı?
✅ CEVAP:
   Widget:
   - Yapılandırma (blueprint)
   - Immutable
   - Ucuz, sık oluşturulabilir
   
   Element:
   - Widget instance'ı
   - Mutable
   - Tree management
   
   RenderObject:
   - Gerçek çizim ve layout
   - Expensive
   - Paint, hit testing


❓ SORU 43: Key nedir? Ne zaman kullanılır?
✅ CEVAP:
   Widget'ları benzersiz tanımlar:
   
   Türleri:
   - ValueKey: Değere göre (item.id)
   - UniqueKey: Her seferinde yeni
   - GlobalKey: Dış erişim, form validation
   
   Kullanım:
   - Liste item'larında
   - Reorder işlemlerinde
   - Form state koruma


❓ SORU 44: BuildContext nedir?
✅ CEVAP:
   Widget'ın tree'deki konumunu temsil eder:
   - Theme.of(context)
   - MediaQuery.of(context)
   - Navigator.of(context)
   - InheritedWidget erişimi


❓ SORU 45: const constructor avantajı nedir?
✅ CEVAP:
   - Widget yeniden build edilmez
   - Tek instance (memory tasarrufu)
   - Compile-time sabiti
   - Flutter DevTools'da "const" flag'i görünür


❓ SORU 46: ListView vs ListView.builder farkı?
✅ CEVAP:
   ListView:
   - Tüm child'ları oluşturur
   - Az sayıda item için
   
   ListView.builder:
   - Lazy loading (sadece görünenleri oluşturur)
   - Performanslı
   - Binlerce item için


❓ SORU 47: SafeArea ne işe yarar?
✅ CEVAP:
   Notch, status bar, bottom indicator'dan korur:
   
SafeArea(
  child: Scaffold(...),
)

// MediaQuery.of(context).padding değerlerini kullanır


❓ SORU 48: MediaQuery vs LayoutBuilder farkı?
✅ CEVAP:
   MediaQuery:
   - TÜM ekran boyutunu verir
   - Device bilgileri
   - MediaQuery.of(context).size
   
   LayoutBuilder:
   - PARENT widget constraints verir
   - constraints.maxWidth, constraints.maxHeight
   - Parent'a göre responsive


❓ SORU 49: Expanded vs Flexible farkı?
✅ CEVAP:
   Expanded:
   - Kalan TÜM alanı kaplar
   - flex parametresi ile oran
   - FlexFit.tight (default)
   
   Flexible:
   - İhtiyacı KADAR alan kaplar
   - FlexFit.loose (default)
   - Minimum ile yetinir


❓ SORU 50: Sliver nedir?
✅ CEVAP:
   CustomScrollView içinde kullanılan scrollable widget'lar:
   - SliverAppBar
   - SliverList
   - SliverGrid
   - SliverToBoxAdapter
   
   Avantajları:
   - Daha fazla kontrol
   - Performans
   - Karmaşık scroll efektleri


❓ SORU 51: AnimatedContainer vs TweenAnimationBuilder?
✅ CEVAP:
   AnimatedContainer:
   - Implicit animation
   - Property değişince otomatik animate
   - Basit kullanım
   
   TweenAnimationBuilder:
   - Daha fazla kontrol
   - Custom Tween
   - Başlangıç/bitiş değerleri


❓ SORU 52: AnimationController nedir?
✅ CEVAP:
   Explicit animation controller:
   - vsync ile TickerProvider
   - forward(), reverse(), repeat()
   - Duration kontrolü
   - dispose() unutma!


❓ SORU 53: Hero animation nedir?
✅ CEVAP:
   Sayfa geçişlerinde widget animasyonu:
   - Aynı tag ile eşleşen widget'lar
   - Shared element transition
   
Hero(
  tag: 'hero-image',
  child: Image.network(url),
)


❓ SORU 54: RepaintBoundary ne işe yarar?
✅ CEVAP:
   Gereksiz repaint'i önler:
   - Child widget kendi layer'ında çizilir
   - Performans optimizasyonu
   - Karmaşık widget'lar için


❓ SORU 55: SingleChildScrollView vs ListView?
✅ CEVAP:
   SingleChildScrollView:
   - TÜM child'ı oluşturur
   - Küçük içerik için
   - Column ile birlikte
   
   ListView:
   - Header/footer ile liste
   - itemBuilder ile lazy loading
   - Uzun listeler için


❓ SORU 56: Form validation nasıl yapılır?
✅ CEVAP:

final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Boş olamaz';
      }
      return null;
    },
  ),
)

// Submit:
if (_formKey.currentState!.validate()) {
  // Form geçerli
}


❓ SORU 57: FocusNode ne işe yarar?
✅ CEVAP:
   Keyboard focus kontrolü:
   - Programatik focus
   - unfocus() ile dismiss keyboard
   - requestFocus() ile focus al
   - dispose() unutma!


❓ SORU 58: PageView vs TabView farkı?
✅ CEVAP:
   PageView:
   - Swipe ile sayfa geçişi
   - PageController ile kontrol
   - Tam sayfa içerik
   
   TabBar + TabBarView:
   - Tab header ile
   - DefaultTabController
   - Tab indicator animasyonu


❓ SORU 59: Pull-to-refresh nasıl yapılır?
✅ CEVAP:

RefreshIndicator(
  onRefresh: () async {
    await fetchData();
  },
  child: ListView(...),
)


❓ SORU 60: Infinite scroll (pagination) nasıl yapılır?
✅ CEVAP:

final ScrollController _controller = ScrollController();

@override
void initState() {
  super.initState();
  _controller.addListener(() {
    if (_controller.position.pixels == 
        _controller.position.maxScrollExtent) {
      loadMoreData();
    }
  });
}
*/

// ============================================
// 📌 BÖLÜM 4: STATE MANAGEMENT (61-80)
// ============================================

/*
❓ SORU 61: State nedir?
✅ CEVAP:
   - Uygulamanın o anki verisi
   - UI'ın nasıl görüneceğini belirler
   - Kullanıcı etkileşimiyle değişir


❓ SORU 62: Ephemeral vs App State farkı?
✅ CEVAP:
   Ephemeral (Local) State:
   - Tek widget'a ait
   - TextField değeri, tab seçimi
   - setState yeterli
   
   App State:
   - Birden fazla widget paylaşır
   - User info, cart, theme
   - Provider, Riverpod, BLoC


❓ SORU 63: setState nasıl çalışır?
✅ CEVAP:

void _increment() {
  setState(() {
    _counter++;  // State'i değiştir
  });
  // build() tekrar çağrılır, UI güncellenir
}


❓ SORU 64: setState dezavantajları nelerdir?
✅ CEVAP:
   1. Prop drilling (state'i alt widget'lara geçirmek zor)
   2. Tüm widget yeniden build olur
   3. İş mantığı UI ile karışık
   4. Test etmek zor
   5. Büyük uygulamalarda karmaşık


❓ SORU 65: InheritedWidget nedir?
✅ CEVAP:
   Widget tree'de veri paylaşımı:
   - Provider, Riverpod'un temeli
   - of(context) pattern ile erişim
   - updateShouldNotify ile kontrol


❓ SORU 66: ChangeNotifier nedir?
✅ CEVAP:
   Observable pattern implementasyonu:
   - notifyListeners() ile haber verir
   - Provider ile birlikte kullanılır
   
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();  // Dinleyicilere haber ver
  }
}


❓ SORU 67: Provider context.watch vs context.read farkı?
✅ CEVAP:
   context.watch:
   - Provider'ı dinler
   - Değiştiğinde rebuild eder
   - build() içinde kullan
   
   context.read:
   - Sadece okur, rebuild etmez
   - Event handler'larda kullan
   - One-time okuma


❓ SORU 68: Consumer widget ne işe yarar?
✅ CEVAP:
   Sadece belirli kısmı rebuild eder:
   
Consumer<CounterModel>(
  builder: (context, counter, child) {
    return Text('${counter.count}');
  },
  child: ExpensiveWidget(),  // Rebuild olmaz
)


❓ SORU 69: Selector ne işe yarar?
✅ CEVAP:
   Sadece belirli değer değiştiğinde rebuild:
   
Selector<UserModel, String>(
  selector: (_, model) => model.name,
  builder: (_, name, __) {
    return Text(name);  // Sadece name değişirse rebuild
  },
)


❓ SORU 70: Riverpod'un Provider'dan farkları?
✅ CEVAP:
   1. Compile-time safety
   2. Context bağımsız (ref kullanır)
   3. Auto-dispose desteği
   4. Aynı tipte birden fazla provider
   5. Daha iyi test edilebilirlik


❓ SORU 71: Riverpod ref.watch vs ref.read vs ref.listen?
✅ CEVAP:
   ref.watch:
   - Dinler, değişince rebuild
   - build() içinde
   
   ref.read:
   - Sadece okur
   - Event handler'larda
   
   ref.listen:
   - Side-effect için (snackbar, navigation)
   - Rebuild yapmaz


❓ SORU 72: StateNotifier vs Notifier (Riverpod 2.0)?
✅ CEVAP:
   StateNotifier (legacy):
   - super(initialState)
   - state = newState
   
   Notifier (2.0+):
   - build() ile initial state
   - ref erişimi var


❓ SORU 73: AsyncNotifier nedir?
✅ CEVAP:
   Async state yönetimi:
   - FutureProvider alternatifi
   - Loading, error, data states
   - AsyncValue pattern


❓ SORU 74: BLoC pattern nedir?
✅ CEVAP:
   Business Logic Component:
   - Event-driven architecture
   - Stream tabanlı
   - UI ve iş mantığı ayrı
   
   Event -> Bloc -> State -> UI


❓ SORU 75: BLoC Event vs State farkı?
✅ CEVAP:
   Event:
   - Kullanıcı aksiyonu (Input)
   - IncrementEvent, LoadDataEvent
   
   State:
   - UI durumu (Output)
   - Loading, Loaded, Error


❓ SORU 76: Cubit vs Bloc farkı?
✅ CEVAP:
   Cubit:
   - Metot çağırarak state değiştirir
   - Daha basit, az boilerplate
   - Event tracing yok
   
   Bloc:
   - Event göndererek state değiştirir
   - Daha fazla boilerplate
   - Full traceability


❓ SORU 77: BlocBuilder vs BlocListener farkı?
✅ CEVAP:
   BlocBuilder:
   - UI rebuild için
   - Her state değişikliğinde
   
   BlocListener:
   - Side-effect için
   - Snackbar, navigation, analytics
   - UI rebuild yapmaz


❓ SORU 78: BlocConsumer ne zaman kullanılır?
✅ CEVAP:
   Builder + Listener birlikte:
   
BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is AuthError) {
      showSnackbar(state.message);
    }
  },
  builder: (context, state) {
    if (state is AuthLoading) return Loading();
    return LoginForm();
  },
)


❓ SORU 79: Bloc buildWhen ve listenWhen ne işe yarar?
✅ CEVAP:
   Koşullu rebuild/listen:
   
BlocBuilder<CounterBloc, int>(
  buildWhen: (previous, current) {
    return current > 10;  // Sadece 10'dan büyükse rebuild
  },
  builder: (context, count) => Text('$count'),
)


❓ SORU 80: State management seçimi nasıl yapılır?
✅ CEVAP:
   setState: Basit, local state
   Provider: Küçük-orta projeler, kolay öğrenme
   Riverpod: Orta-büyük, type safety, test
   BLoC: Enterprise, büyük ekipler, strict architecture
*/

// ============================================
// 📌 BÖLÜM 5: İLERİ KONULAR (81-100)
// ============================================

/*
❓ SORU 81: Navigation 1.0 vs GoRouter farkı?
✅ CEVAP:
   Navigator 1.0:
   - Imperative (push, pop)
   - Basit kullanım
   
   GoRouter:
   - Declarative
   - Deep linking
   - Web URL desteği
   - Redirect, guard


❓ SORU 82: Deep linking nedir?
✅ CEVAP:
   URL ile uygulamaya yönlendirme:
   - myapp://product/123
   - https://myapp.com/product/123
   - GoRouter ile kolay implementasyon


❓ SORU 83: GetIt (Service Locator) nedir?
✅ CEVAP:
   Dependency injection container:
   
final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerFactory<UserRepository>(() => UserRepository());
}

// Kullanım:
final api = getIt<ApiService>();


❓ SORU 84: Dio vs http paketi farkı?
✅ CEVAP:
   http:
   - Flutter team'den
   - Basit kullanım
   - Temel özellikler
   
   Dio:
   - Interceptor desteği
   - Cancel token
   - FormData, file upload
   - Request/response transformers


❓ SORU 85: Interceptor ne işe yarar?
✅ CEVAP:
   Request/response araya girme:
   - Token ekleme
   - Error handling
   - Logging
   - Retry logic


❓ SORU 86: SharedPreferences vs Hive vs SQLite?
✅ CEVAP:
   SharedPreferences:
   - Key-value (basit tipler)
   - Settings için
   
   Hive:
   - NoSQL, hızlı
   - TypeAdapter ile custom types
   - Binary format
   
   SQLite:
   - İlişkisel, SQL sorguları
   - Karmaşık veri modelleri


❓ SORU 87: Unit Test vs Widget Test vs Integration Test?
✅ CEVAP:
   Unit Test:
   - İş mantığı
   - Hızlı, izole
   - flutter test
   
   Widget Test:
   - UI bileşenleri
   - tester.tap, tester.pump
   
   Integration Test:
   - Tam uygulama
   - Gerçek cihaz/emulator
   - End-to-end senaryolar


❓ SORU 88: Mockito nasıl kullanılır?
✅ CEVAP:

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApi;
  
  setUp(() {
    mockApi = MockApiService();
  });
  
  test('should return users', () async {
    when(mockApi.getUsers()).thenAnswer((_) async => [User()]);
    
    final result = await mockApi.getUsers();
    
    expect(result.length, 1);
    verify(mockApi.getUsers()).called(1);
  });
}


❓ SORU 89: Performance optimization teknikleri?
✅ CEVAP:
   1. const constructor kullan
   2. ListView.builder (lazy loading)
   3. RepaintBoundary
   4. Selector/Consumer (hedefli rebuild)
   5. cached_network_image
   6. dispose() ile cleanup
   7. Keys ile widget reuse


❓ SORU 90: Memory leak nasıl önlenir?
✅ CEVAP:
   1. dispose() içinde cleanup:
      - Controller.dispose()
      - Stream subscription cancel
      - Timer cancel
   2. GlobalKey dikkatli kullan
   3. Circular reference'lardan kaçın
   4. DevTools ile profiling


❓ SORU 91: Hot Reload vs Hot Restart farkı?
✅ CEVAP:
   Hot Reload:
   - State korunur
   - Hızlı (saniyeler)
   - Sadece kod değişiklikleri
   
   Hot Restart:
   - State sıfırlanır
   - Tam yeniden başlatma
   - initState yeniden çalışır


❓ SORU 92: SOLID prensipleri nelerdir?
✅ CEVAP:
   S - Single Responsibility: Tek sorumluluk
   O - Open/Closed: Genişlemeye açık, değişikliğe kapalı
   L - Liskov Substitution: Alt sınıf yerine kullanılabilir
   I - Interface Segregation: Küçük, özelleşmiş interface'ler
   D - Dependency Inversion: Soyutlamalara bağımlılık


❓ SORU 93: Clean Architecture katmanları?
✅ CEVAP:
   Presentation Layer:
   - UI, Widgets, BLoC/ViewModel
   
   Domain Layer:
   - Entities (iş nesneleri)
   - Use Cases (iş mantığı)
   - Repository interfaces
   
   Data Layer:
   - Repository implementations
   - Data sources (API, DB)
   - Models (DTO)


❓ SORU 94: Repository pattern nedir?
✅ CEVAP:
   Data source soyutlaması:
   - Uygulamayı data source'dan ayırır
   - Test edilebilirlik
   - Caching logic


❓ SORU 95: Use Case nedir?
✅ CEVAP:
   Tek iş işlemi:
   
class GetUserUseCase {
  final UserRepository repository;
  
  GetUserUseCase(this.repository);
  
  Future<User> call(String userId) {
    return repository.getUser(userId);
  }
}


❓ SORU 96: Either pattern (dartz) nedir?
✅ CEVAP:
   Başarı veya hata döndürme:
   
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final user = await api.fetchUser(id);
    return Right(user);  // Başarı
  } catch (e) {
    return Left(ServerFailure());  // Hata
  }
}

// Kullanım:
final result = await getUser('123');
result.fold(
  (failure) => showError(failure.message),
  (user) => showUser(user),
);


❓ SORU 97: freezed paketi ne işe yarar?
✅ CEVAP:
   Immutable data classes + Union types:
   
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    @Default('') String email,
  }) = _User;
  
  factory User.fromJson(Map<String, dynamic> json) => 
      _$UserFromJson(json);
}

// copyWith otomatik:
final updated = user.copyWith(name: 'New Name');


❓ SORU 98: auto_route vs go_router farkı?
✅ CEVAP:
   go_router:
   - Flutter team'den
   - Basit setup
   - Declarative
   
   auto_route:
   - Code generation
   - Type-safe arguments
   - Nested navigation
   - Guards (middleware)


❓ SORU 99: flutter_gen ne işe yarar?
✅ CEVAP:
   Asset code generation:
   - Type-safe asset erişimi
   - Font, image, color generation
   
// Öncesi:
Image.asset('assets/images/logo.png')

// Sonrası:
Assets.images.logo.image()


❓ SORU 100: CI/CD pipeline Flutter için nasıl kurulur?
✅ CEVAP:
   GitHub Actions örneği:
   
name: Flutter CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --release
*/

// ============================================
// 📌 HIZLI REFERANS TABLOSU
// ============================================

/*
┌────────────────────────────────────────────────────────────┐
│                    QUICK REFERENCE                          │
├────────────────────────────────────────────────────────────┤
│ VAR/DYNAMIC/OBJECT                                          │
│ var → compile-time type, unchangeable type                  │
│ dynamic → runtime type, can change                          │
│ Object → needs casting for method calls                     │
├────────────────────────────────────────────────────────────┤
│ FINAL/CONST                                                 │
│ final → runtime once, content changeable (list.add)         │
│ const → compile-time, immutable completely                  │
├────────────────────────────────────────────────────────────┤
│ LIST OPERATIONS                                             │
│ map → transform each element                                │
│ where → filter elements                                     │
│ reduce → combine to single value                            │
│ fold → reduce with initial value                            │
│ any/every → boolean checks                                  │
├────────────────────────────────────────────────────────────┤
│ COMPLEXITY CHEAT SHEET                                      │
│ O(1) → constant (hashmap lookup)                            │
│ O(log n) → logarithmic (binary search)                      │
│ O(n) → linear (single loop)                                 │
│ O(n log n) → merge sort, quick sort                         │
│ O(n²) → nested loops                                        │
├────────────────────────────────────────────────────────────┤
│ STATE MANAGEMENT CHOICE                                     │
│ Local/Simple → setState                                     │
│ Small/Medium → Provider                                     │
│ Medium/Large → Riverpod                                     │
│ Enterprise → BLoC                                           │
├────────────────────────────────────────────────────────────┤
│ PROVIDER                                                    │
│ watch → rebuild on change (in build)                        │
│ read → one-time read (in callbacks)                         │
├────────────────────────────────────────────────────────────┤
│ RIVERPOD                                                    │
│ ref.watch → rebuild on change                               │
│ ref.read → one-time read                                    │
│ ref.listen → side effects                                   │
├────────────────────────────────────────────────────────────┤
│ BLOC                                                        │
│ Event → user action input                                   │
│ State → UI output                                           │
│ BlocBuilder → UI rebuild                                    │
│ BlocListener → side effects                                 │
├────────────────────────────────────────────────────────────┤
│ WIDGET LIFECYCLE                                            │
│ initState → once, setup                                     │
│ build → on every rebuild                                    │
│ didUpdateWidget → parent rebuild                            │
│ dispose → cleanup                                           │
└────────────────────────────────────────────────────────────┘
*/

void main() {
  print("100 Flutter Interview Q&A - Study Material");
  print("Sections:");
  print("1. Dart Basics (1-20)");
  print("2. Data Structures (21-40)");
  print("3. Flutter UI & Widgets (41-60)");
  print("4. State Management (61-80)");
  print("5. Advanced Topics (81-100)");
}
