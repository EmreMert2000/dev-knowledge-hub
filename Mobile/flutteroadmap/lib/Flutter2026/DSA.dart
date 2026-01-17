// ============================================
// 🎯 CODER BYTE MÜLAKAT HAZIRLIK
// 📚 DART TEMELLERİ & VERİ YAPILARI (DSA)
// ============================================
// Bu dosya Dart temelleri ve veri yapıları için
// mülakat hazırlık sorularını içerir.
// ============================================

// ============================================
// 📌 BÖLÜM 1: DART DİLİ TEMELLERİ
// ============================================

// --------------------------------------------
// 1.1 TEMEL VERİ TİPLERİ
// --------------------------------------------

void dartBasicTypes() {
  // 🔹 Numbers - Sayılar
  int age = 25;                    // Tam sayı
  double price = 19.99;            // Ondalıklı sayı
  num anyNumber = 42;              // int veya double olabilir
  
  // 🔹 Strings - Metinler
  String name = "Emre";
  String multiLine = '''
    Bu çok satırlı
    bir stringdir
  ''';
  String interpolation = "Merhaba $name, yaşın ${age + 1}"; // String interpolation
  
  // 🔹 Booleans
  bool isActive = true;
  bool isAdult = age >= 18;        // Expression result
  
  // 🔹 Type Conversion
  String numStr = "42";
  int parsed = int.parse(numStr);   // String -> int
  double parsedD = double.parse("3.14"); // String -> double
  String toStr = 42.toString();     // int -> String
  int toInt = 3.7.toInt();          // double -> int (truncate)
  int rounded = 3.7.round();        // Yuvarlama
}

// --------------------------------------------
// 1.2 OPERATORS - OPERATÖRLER
// --------------------------------------------

void dartOperators() {
  // 🔹 Arithmetic Operators
  int a = 10, b = 3;
  print(a + b);   // 13 - Toplama
  print(a - b);   // 7  - Çıkarma
  print(a * b);   // 30 - Çarpma
  print(a / b);   // 3.333... - Bölme (double döner)
  print(a ~/ b);  // 3  - Tam sayı bölme
  print(a % b);   // 1  - Mod (kalan)
  
  // 🔹 Increment/Decrement
  int x = 5;
  print(++x);     // 6 - Önce artır, sonra kullan
  print(x++);     // 6 - Önce kullan, sonra artır (x şimdi 7)
  
  // 🔹 Comparison Operators
  print(a == b);  // false
  print(a != b);  // true
  print(a > b);   // true
  print(a >= b);  // true
  
  // 🔹 Logical Operators
  bool p = true, q = false;
  print(p && q);  // false - AND
  print(p || q);  // true  - OR
  print(!p);      // false - NOT
  
  // 🔹 Null-aware Operators
  String? nullableStr;
  String result = nullableStr ?? "varsayılan";     // Null ise varsayılan
  nullableStr ??= "atandı";                        // Null ise ata
  int? length = nullableStr?.length;               // Null değilse çağır
  
  // 🔹 Cascade Notation (..)
  var list = <int>[]
    ..add(1)
    ..add(2)
    ..add(3);     // [1, 2, 3]
  
  // 🔹 Spread Operator
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1, 4];   // [0, 1, 2, 3, 4]
  
  // 🔹 Ternary Operator
  String status = a > 5 ? "Büyük" : "Küçük";
}

// --------------------------------------------
// 1.3 CONTROL FLOW - KONTROL AKIŞI
// --------------------------------------------

void controlFlow() {
  // 🔹 If-Else
  int score = 85;
  if (score >= 90) {
    print("A");
  } else if (score >= 80) {
    print("B");
  } else {
    print("C");
  }
  
  // 🔹 Switch-Case
  String grade = "A";
  switch (grade) {
    case "A":
      print("Mükemmel");
      break;
    case "B":
      print("İyi");
      break;
    default:
      print("Geçer");
  }
  
  // 🔹 Switch with pattern matching (Dart 3.0+)
  Object value = 42;
  switch (value) {
    case int n when n > 0:
      print("Pozitif: $n");
    case String s:
      print("String: $s");
    case [int a, int b]:
      print("İki elemanlı liste: $a, $b");
    default:
      print("Bilinmeyen");
  }
  
  // 🔹 For Loop
  for (int i = 0; i < 5; i++) {
    print(i);
  }
  
  // 🔹 For-in Loop
  List<String> names = ["Ali", "Veli", "Deli"];
  for (var name in names) {
    print(name);
  }
  
  // 🔹 While Loop
  int count = 0;
  while (count < 3) {
    print(count);
    count++;
  }
  
  // 🔹 Do-While Loop
  do {
    print("En az bir kez çalışır");
  } while (false);
  
  // 🔹 Break ve Continue
  for (int i = 0; i < 10; i++) {
    if (i == 3) continue;  // 3'ü atla
    if (i == 7) break;     // 7'de dur
    print(i);
  }
}

// ============================================
// 📌 BÖLÜM 2: VERİ YAPILARI (DATA STRUCTURES)
// ============================================

// --------------------------------------------
// 2.1 LIST (DİNAMİK DİZİ / ARRAY)
// --------------------------------------------

void listOperations() {
  // 🔹 List Oluşturma
  List<int> numbers = [1, 2, 3, 4, 5];
  var names = <String>[];           // Boş liste
  List<int> fixed = List.filled(5, 0); // [0, 0, 0, 0, 0]
  List<int> generated = List.generate(5, (i) => i * 2); // [0, 2, 4, 6, 8]
  
  // 🔹 Temel İşlemler
  numbers.add(6);                   // Sona ekle
  numbers.insert(0, 0);             // İndekse ekle
  numbers.remove(3);                // Değeri sil
  numbers.removeAt(0);              // İndeksteki elemanı sil
  int last = numbers.removeLast();  // Son elemanı sil ve döndür
  
  // 🔹 Erişim
  int first = numbers[0];           // İndeks ile erişim
  int firstElement = numbers.first; // İlk eleman
  int lastElement = numbers.last;   // Son eleman
  int len = numbers.length;         // Boyut
  bool isEmpty = numbers.isEmpty;   // Boş mu?
  
  // 🔹 Arama
  int index = numbers.indexOf(3);   // İndeks bul (-1 yoksa)
  bool contains = numbers.contains(5); // Var mı?
  
  // 🔹 Sıralama
  numbers.sort();                   // Artan sırala
  numbers.sort((a, b) => b.compareTo(a)); // Azalan sırala
  
  // 🔹 Dönüştürme
  numbers.reversed.toList();        // Ters çevir
  numbers.shuffle();                // Karıştır
  
  // 🔹 Fonksiyonel İşlemler
  var doubled = numbers.map((n) => n * 2).toList();
  var evens = numbers.where((n) => n % 2 == 0).toList();
  int sum = numbers.reduce((a, b) => a + b);
  int sum2 = numbers.fold(0, (a, b) => a + b);
  bool allPositive = numbers.every((n) => n > 0);
  bool anyEven = numbers.any((n) => n % 2 == 0);
  
  // 🔹 Sublist
  List<int> sub = numbers.sublist(1, 3); // [index 1, 3) arası
  numbers.getRange(0, 2);           // Iterable döner
}

// --------------------------------------------
// 2.2 SET (KÜME - BENZERSİZ ELEMANLAR)
// --------------------------------------------

void setOperations() {
  // 🔹 Set Oluşturma
  Set<int> numbers = {1, 2, 3, 4, 5};
  var emptySet = <String>{};
  Set<int> fromList = [1, 2, 2, 3, 3, 3].toSet(); // {1, 2, 3}
  
  // 🔹 Temel İşlemler
  numbers.add(6);                   // Ekle (zaten varsa eklenmez)
  numbers.remove(1);                // Sil
  numbers.clear();                  // Temizle
  
  // 🔹 Küme İşlemleri (Matematiksel)
  Set<int> a = {1, 2, 3, 4};
  Set<int> b = {3, 4, 5, 6};
  
  Set<int> union = a.union(b);           // Birleşim: {1, 2, 3, 4, 5, 6}
  Set<int> intersection = a.intersection(b); // Kesişim: {3, 4}
  Set<int> difference = a.difference(b); // Fark: {1, 2}
  
  // 🔹 Kontroller
  bool contains = a.contains(3);    // true
  bool isSubset = {1, 2}.containsAll({1}); // true
}

// --------------------------------------------
// 2.3 MAP (SÖZLÜK - ANAHTAR-DEĞER)
// --------------------------------------------

void mapOperations() {
  // 🔹 Map Oluşturma
  Map<String, int> ages = {
    "Emre": 25,
    "Ahmet": 30,
    "Mehmet": 28,
  };
  var emptyMap = <String, dynamic>{};
  
  // 🔹 Temel İşlemler
  ages["Ali"] = 35;                 // Ekle/Güncelle
  ages.remove("Mehmet");            // Sil
  ages.putIfAbsent("Veli", () => 22); // Yoksa ekle
  
  // 🔹 Erişim
  int? emreAge = ages["Emre"];      // Nullable döner
  int ahmetAge = ages["Ahmet"] ?? 0; // Varsayılan değer
  
  // 🔹 Kontroller
  bool hasKey = ages.containsKey("Emre");   // true
  bool hasValue = ages.containsValue(25);   // true
  bool isEmpty = ages.isEmpty;              // false
  
  // 🔹 Iterating
  ages.forEach((key, value) => print("$key: $value"));
  
  for (var entry in ages.entries) {
    print("${entry.key}: ${entry.value}");
  }
  
  List<String> keys = ages.keys.toList();
  List<int> values = ages.values.toList();
  
  // 🔹 Dönüştürme
  var updated = ages.map((key, value) => MapEntry(key.toUpperCase(), value + 1));
}

// --------------------------------------------
// 2.4 QUEUE (KUYRUK - FIFO)
// --------------------------------------------

import 'dart:collection';

void queueOperations() {
  // 🔹 Queue Oluşturma
  Queue<int> queue = Queue<int>();
  Queue<int> fromList = Queue.from([1, 2, 3]);
  
  // 🔹 Temel İşlemler (FIFO - First In First Out)
  queue.add(1);                     // Sona ekle
  queue.addFirst(0);                // Başa ekle
  queue.addAll([2, 3, 4]);          // Birden fazla ekle
  
  int first = queue.removeFirst();  // İlk elemanı çıkar
  int last = queue.removeLast();    // Son elemanı çıkar
  
  // 🔹 Erişim
  int firstElement = queue.first;
  int lastElement = queue.last;
  bool isEmpty = queue.isEmpty;
  int length = queue.length;
}

// --------------------------------------------
// 2.5 LINKEDLIST
// --------------------------------------------

// Dart'ta built-in LinkedList var ama pratik değil
// Kendi implementasyonumuzu yapalım:

class ListNode<T> {
  T value;
  ListNode<T>? next;
  
  ListNode(this.value, [this.next]);
}

class LinkedList<T> {
  ListNode<T>? head;
  ListNode<T>? tail;
  int _length = 0;
  
  int get length => _length;
  bool get isEmpty => head == null;
  
  // 🔹 Sona Ekle - O(1)
  void append(T value) {
    final node = ListNode(value);
    if (tail == null) {
      head = tail = node;
    } else {
      tail!.next = node;
      tail = node;
    }
    _length++;
  }
  
  // 🔹 Başa Ekle - O(1)
  void prepend(T value) {
    final node = ListNode(value);
    node.next = head;
    head = node;
    tail ??= node;
    _length++;
  }
  
  // 🔹 Belirli İndekse Ekle - O(n)
  void insertAt(int index, T value) {
    if (index == 0) {
      prepend(value);
      return;
    }
    if (index >= _length) {
      append(value);
      return;
    }
    
    var current = head;
    for (int i = 0; i < index - 1; i++) {
      current = current!.next;
    }
    final node = ListNode(value);
    node.next = current!.next;
    current.next = node;
    _length++;
  }
  
  // 🔹 Baştan Sil - O(1)
  T? removeFirst() {
    if (head == null) return null;
    final value = head!.value;
    head = head!.next;
    if (head == null) tail = null;
    _length--;
    return value;
  }
  
  // 🔹 Sondan Sil - O(n)
  T? removeLast() {
    if (head == null) return null;
    if (head == tail) {
      final value = head!.value;
      head = tail = null;
      _length--;
      return value;
    }
    
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }
    final value = tail!.value;
    current.next = null;
    tail = current;
    _length--;
    return value;
  }
  
  // 🔹 Arama - O(n)
  bool contains(T value) {
    var current = head;
    while (current != null) {
      if (current.value == value) return true;
      current = current.next;
    }
    return false;
  }
  
  // 🔹 Liste olarak döndür
  List<T> toList() {
    final result = <T>[];
    var current = head;
    while (current != null) {
      result.add(current.value);
      current = current.next;
    }
    return result;
  }
  
  @override
  String toString() => toList().toString();
}

// --------------------------------------------
// 2.6 STACK (YIĞIN - LIFO)
// --------------------------------------------

class Stack<T> {
  final List<T> _items = [];
  
  // 🔹 Temel İşlemler (LIFO - Last In First Out)
  void push(T item) => _items.add(item);       // O(1)
  T pop() => _items.removeLast();              // O(1)
  T get peek => _items.last;                   // O(1) - Silmeden bak
  
  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;
  
  @override
  String toString() => _items.toString();
}

// 🔹 Stack Kullanım Alanları:
// - Parantez eşleştirme
// - Undo/Redo işlemleri
// - DFS algoritması
// - Call stack

// --------------------------------------------
// 2.7 BINARY TREE
// --------------------------------------------

class TreeNode<T> {
  T value;
  TreeNode<T>? left;
  TreeNode<T>? right;
  
  TreeNode(this.value, {this.left, this.right});
}

class BinarySearchTree {
  TreeNode<int>? root;
  
  // 🔹 Ekleme - O(log n) ortalama, O(n) worst case
  void insert(int value) {
    root = _insertRecursive(root, value);
  }
  
  TreeNode<int> _insertRecursive(TreeNode<int>? node, int value) {
    if (node == null) return TreeNode(value);
    
    if (value < node.value) {
      node.left = _insertRecursive(node.left, value);
    } else {
      node.right = _insertRecursive(node.right, value);
    }
    return node;
  }
  
  // 🔹 Arama - O(log n) ortalama
  bool search(int value) {
    return _searchRecursive(root, value);
  }
  
  bool _searchRecursive(TreeNode<int>? node, int value) {
    if (node == null) return false;
    if (node.value == value) return true;
    
    if (value < node.value) {
      return _searchRecursive(node.left, value);
    } else {
      return _searchRecursive(node.right, value);
    }
  }
  
  // 🔹 In-Order Traversal (Sol -> Kök -> Sağ) - Sıralı döner
  List<int> inOrder() {
    final result = <int>[];
    _inOrderRecursive(root, result);
    return result;
  }
  
  void _inOrderRecursive(TreeNode<int>? node, List<int> result) {
    if (node == null) return;
    _inOrderRecursive(node.left, result);
    result.add(node.value);
    _inOrderRecursive(node.right, result);
  }
  
  // 🔹 Pre-Order Traversal (Kök -> Sol -> Sağ)
  List<int> preOrder() {
    final result = <int>[];
    _preOrderRecursive(root, result);
    return result;
  }
  
  void _preOrderRecursive(TreeNode<int>? node, List<int> result) {
    if (node == null) return;
    result.add(node.value);
    _preOrderRecursive(node.left, result);
    _preOrderRecursive(node.right, result);
  }
  
  // 🔹 Post-Order Traversal (Sol -> Sağ -> Kök)
  List<int> postOrder() {
    final result = <int>[];
    _postOrderRecursive(root, result);
    return result;
  }
  
  void _postOrderRecursive(TreeNode<int>? node, List<int> result) {
    if (node == null) return;
    _postOrderRecursive(node.left, result);
    _postOrderRecursive(node.right, result);
    result.add(node.value);
  }
  
  // 🔹 Level-Order Traversal (BFS - Seviye bazlı)
  List<int> levelOrder() {
    if (root == null) return [];
    
    final result = <int>[];
    final queue = Queue<TreeNode<int>>();
    queue.add(root!);
    
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      result.add(node.value);
      
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    return result;
  }
  
  // 🔹 Yükseklik hesapla
  int height() {
    return _heightRecursive(root);
  }
  
  int _heightRecursive(TreeNode<int>? node) {
    if (node == null) return 0;
    int leftHeight = _heightRecursive(node.left);
    int rightHeight = _heightRecursive(node.right);
    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
  }
}

// --------------------------------------------
// 2.8 HASH TABLE (Hash Map implementasyonu)
// --------------------------------------------

// Dart'ın Map'i zaten hash table kullanır, ama mantığı anlayalım:

class HashTable<K, V> {
  static const int _initialCapacity = 16;
  late List<List<MapEntry<K, V>>> _buckets;
  int _size = 0;
  
  HashTable() {
    _buckets = List.generate(_initialCapacity, (_) => []);
  }
  
  int get length => _size;
  
  // 🔹 Hash fonksiyonu
  int _getBucketIndex(K key) {
    return key.hashCode % _buckets.length;
  }
  
  // 🔹 Ekleme/Güncelleme - O(1) ortalama
  void put(K key, V value) {
    final index = _getBucketIndex(key);
    final bucket = _buckets[index];
    
    // Aynı key varsa güncelle
    for (int i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket[i] = MapEntry(key, value);
        return;
      }
    }
    
    // Yeni entry ekle
    bucket.add(MapEntry(key, value));
    _size++;
  }
  
  // 🔹 Değer al - O(1) ortalama
  V? get(K key) {
    final index = _getBucketIndex(key);
    final bucket = _buckets[index];
    
    for (var entry in bucket) {
      if (entry.key == key) return entry.value;
    }
    return null;
  }
  
  // 🔹 Silme - O(1) ortalama
  bool remove(K key) {
    final index = _getBucketIndex(key);
    final bucket = _buckets[index];
    
    for (int i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket.removeAt(i);
        _size--;
        return true;
      }
    }
    return false;
  }
  
  // 🔹 Key kontrolü - O(1) ortalama
  bool containsKey(K key) {
    return get(key) != null;
  }
}

// --------------------------------------------
// 2.9 HEAP (ÖNCELİK KUYRUĞU)
// --------------------------------------------

// Min Heap implementasyonu
class MinHeap {
  final List<int> _items = [];
  
  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;
  
  // 🔹 Ekleme - O(log n)
  void insert(int value) {
    _items.add(value);
    _bubbleUp(_items.length - 1);
  }
  
  void _bubbleUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_items[parentIndex] <= _items[index]) break;
      
      // Swap
      int temp = _items[parentIndex];
      _items[parentIndex] = _items[index];
      _items[index] = temp;
      
      index = parentIndex;
    }
  }
  
  // 🔹 Minimum elemanı çıkar - O(log n)
  int? extractMin() {
    if (_items.isEmpty) return null;
    
    int min = _items[0];
    _items[0] = _items.last;
    _items.removeLast();
    
    if (_items.isNotEmpty) {
      _bubbleDown(0);
    }
    
    return min;
  }
  
  void _bubbleDown(int index) {
    while (true) {
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;
      int smallest = index;
      
      if (leftChild < _items.length && _items[leftChild] < _items[smallest]) {
        smallest = leftChild;
      }
      if (rightChild < _items.length && _items[rightChild] < _items[smallest]) {
        smallest = rightChild;
      }
      
      if (smallest == index) break;
      
      // Swap
      int temp = _items[smallest];
      _items[smallest] = _items[index];
      _items[index] = temp;
      
      index = smallest;
    }
  }
  
  // 🔹 Minimum eleman (silmeden) - O(1)
  int? get peek => _items.isEmpty ? null : _items[0];
}

// --------------------------------------------
// 2.10 GRAPH (ÇİZGE)
// --------------------------------------------

class Graph {
  // Adjacency List representation
  final Map<String, List<String>> _adjacencyList = {};
  final bool isDirected;
  
  Graph({this.isDirected = false});
  
  // 🔹 Düğüm ekle
  void addVertex(String vertex) {
    if (!_adjacencyList.containsKey(vertex)) {
      _adjacencyList[vertex] = [];
    }
  }
  
  // 🔹 Kenar ekle
  void addEdge(String v1, String v2) {
    addVertex(v1);
    addVertex(v2);
    _adjacencyList[v1]!.add(v2);
    if (!isDirected) {
      _adjacencyList[v2]!.add(v1);
    }
  }
  
  // 🔹 Kenar sil
  void removeEdge(String v1, String v2) {
    _adjacencyList[v1]?.remove(v2);
    if (!isDirected) {
      _adjacencyList[v2]?.remove(v1);
    }
  }
  
  // 🔹 Düğüm sil
  void removeVertex(String vertex) {
    _adjacencyList.remove(vertex);
    for (var adj in _adjacencyList.values) {
      adj.remove(vertex);
    }
  }
  
  // 🔹 Komşuları al
  List<String> getNeighbors(String vertex) {
    return _adjacencyList[vertex] ?? [];
  }
  
  // 🔹 DFS - Depth First Search (Derinlik Öncelikli Arama)
  List<String> dfs(String start) {
    final result = <String>[];
    final visited = <String>{};
    
    void dfsRecursive(String vertex) {
      visited.add(vertex);
      result.add(vertex);
      
      for (var neighbor in getNeighbors(vertex)) {
        if (!visited.contains(neighbor)) {
          dfsRecursive(neighbor);
        }
      }
    }
    
    dfsRecursive(start);
    return result;
  }
  
  // 🔹 BFS - Breadth First Search (Genişlik Öncelikli Arama)
  List<String> bfs(String start) {
    final result = <String>[];
    final visited = <String>{start};
    final queue = Queue<String>();
    queue.add(start);
    
    while (queue.isNotEmpty) {
      String vertex = queue.removeFirst();
      result.add(vertex);
      
      for (var neighbor in getNeighbors(vertex)) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
    
    return result;
  }
  
  @override
  String toString() => _adjacencyList.toString();
}

// ============================================
// 📌 BÖLÜM 3: COMPLEXITY (KARMAŞIKLIK ANALİZİ)
// ============================================

/*
⏱️ TIME COMPLEXITY (Zaman Karmaşıklığı)

┌─────────────┬──────────────────────────────────────┐
│ Big O       │ Açıklama                             │
├─────────────┼──────────────────────────────────────┤
│ O(1)        │ Sabit - Boyuttan bağımsız            │
│ O(log n)    │ Logaritmik - Binary Search           │
│ O(n)        │ Lineer - Tek döngü                   │
│ O(n log n)  │ Linearitmik - Merge/Quick Sort       │
│ O(n²)       │ Quadratic - İç içe döngü             │
│ O(2^n)      │ Exponential - Her adımda ikiye katla │
│ O(n!)       │ Factorial - Permütasyonlar           │
└─────────────┴──────────────────────────────────────┘

📊 DATA STRUCTURE COMPLEXITY

┌─────────────────┬──────────┬──────────┬──────────┐
│ Veri Yapısı     │ Erişim   │ Arama    │ Ekleme   │
├─────────────────┼──────────┼──────────┼──────────┤
│ Array/List      │ O(1)     │ O(n)     │ O(n)     │
│ Linked List     │ O(n)     │ O(n)     │ O(1)     │
│ Stack           │ O(n)     │ O(n)     │ O(1)     │
│ Queue           │ O(n)     │ O(n)     │ O(1)     │
│ Hash Table      │ O(1)*    │ O(1)*    │ O(1)*    │
│ Binary Tree     │ O(log n)*│ O(log n)*│ O(log n)*│
│ Heap            │ O(1)**   │ O(n)     │ O(log n) │
└─────────────────┴──────────┴──────────┴──────────┘
* Ortalama durum     ** Min/Max için

🧠 SPACE COMPLEXITY (Alan Karmaşıklığı)

- Extra değişkenler: O(1)
- Yeni array/list kopyası: O(n)
- Recursive çağrılar: O(call stack depth)
- 2D matrix: O(n * m)
*/

// ============================================
// 📌 BÖLÜM 4: MÜLAKAT SORULARI - VERİ YAPILARI
// ============================================

/*
❓ SIKÇA SORULAN VERİ YAPISI SORULARI:

1. Array vs LinkedList farkı nedir?
   - Array: İndeks ile O(1) erişim, ekleme/silme O(n)
   - LinkedList: Erişim O(n), ekleme/silme O(1)

2. Stack ve Queue arasındaki fark nedir?
   - Stack: LIFO (Last In First Out)
   - Queue: FIFO (First In First Out)

3. Hash Table/Map nasıl çalışır?
   - Key -> Hash Function -> Bucket Index
   - Collision handling: Chaining veya Open Addressing

4. Binary Search Tree avantajları nelerdir?
   - Sıralı veri saklama
   - O(log n) arama, ekleme, silme

5. Heap ne zaman kullanılır?
   - Priority Queue implementasyonu
   - K en büyük/küçük eleman bulma
   - Heap Sort algoritması

6. Graph ne zaman kullanılır?
   - Sosyal ağlar
   - Harita/yol bulma
   - Dependency resolution

7. DFS vs BFS ne zaman kullanılır?
   - DFS: Yol bulma, cycle detection, topological sort
   - BFS: En kısa yol, level-order traversal

8. Set ne zaman kullanılır?
   - Benzersiz elemanlar gerektiğinde
   - Hızlı üyelik kontrolü O(1)
   - Küme işlemleri (birleşim, kesişim)
*/

// ============================================
// 📌 BÖLÜM 5: ÖRNEK KULLANIM
// ============================================

void main() {
  // 🔹 LinkedList Örneği
  print("=== LINKED LIST ===");
  var linkedList = LinkedList<int>();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.prepend(0);
  print("LinkedList: $linkedList");  // [0, 1, 2, 3]
  
  // 🔹 Stack Örneği
  print("\n=== STACK ===");
  var stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print("Stack: $stack");            // [1, 2, 3]
  print("Pop: ${stack.pop()}");      // 3
  print("Peek: ${stack.peek}");      // 2
  
  // 🔹 Binary Search Tree Örneği
  print("\n=== BINARY SEARCH TREE ===");
  var bst = BinarySearchTree();
  bst.insert(5);
  bst.insert(3);
  bst.insert(7);
  bst.insert(1);
  bst.insert(9);
  print("In-Order: ${bst.inOrder()}");    // [1, 3, 5, 7, 9]
  print("Pre-Order: ${bst.preOrder()}");  // [5, 3, 1, 7, 9]
  print("Post-Order: ${bst.postOrder()}"); // [1, 3, 9, 7, 5]
  print("Level-Order: ${bst.levelOrder()}"); // [5, 3, 7, 1, 9]
  print("Height: ${bst.height()}");       // 3
  
  // 🔹 Min Heap Örneği
  print("\n=== MIN HEAP ===");
  var heap = MinHeap();
  heap.insert(5);
  heap.insert(3);
  heap.insert(8);
  heap.insert(1);
  print("Extract Min: ${heap.extractMin()}"); // 1
  print("Peek: ${heap.peek}");                // 3
  
  // 🔹 Graph Örneği
  print("\n=== GRAPH ===");
  var graph = Graph();
  graph.addEdge("A", "B");
  graph.addEdge("A", "C");
  graph.addEdge("B", "D");
  graph.addEdge("C", "D");
  graph.addEdge("D", "E");
  print("Graph: $graph");
  print("DFS from A: ${graph.dfs('A')}"); // [A, B, D, C, E] veya benzeri
  print("BFS from A: ${graph.bfs('A')}"); // [A, B, C, D, E]
}
