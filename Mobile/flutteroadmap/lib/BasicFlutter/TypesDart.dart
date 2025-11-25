// Dart Temelleri - Types, Variables, Functions, Collections
// BasicFlutter / TypesDart.dart

void main() {
  // ---------- 1. Değişken Tanımlama ----------
  String name = "Emre";
  int age = 25;
  double price = 19.99;
  bool isActive = true;

  print("Name: $name");
  print("Age: $age");
  print("Price: $price");
  print("Active: $isActive");

  // ---------- 2. List (Dizi) ----------
  List<String> users = ["Ali", "Veli", "Ayşe"];
  users.add("Emre");
  print("Users: $users");

  // ---------- 3. Map ----------
  Map<String, dynamic> userInfo = {"name": "Emre", "age": 25, "isAdmin": true};
  print("User Info: $userInfo");

  // ---------- 4. Set ----------
  Set<int> uniqueNumbers = {1, 2, 3, 4};
  print("Unique Numbers: $uniqueNumbers"); // 2 tekrar etmez

  // ---------- 5. Function Kullanımı ----------
  print("Sum: ${sum(5, 10)}");

  // ---------- 6. Null Safety ----------
  String? nullableValue = null;
  print("Nullable: $nullableValue");

  String nonNullable = "Hello";
  print("Non Nullable: $nonNullable");

  // ---------- 7. Sınıf Kullanımı ----------
  Person p = Person("Emre", 25);
  p.sayHello();
}

// Basit Fonksiyon
int sum(int a, int b) {
  return a + b;
}

// Basit Class
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print("Hello, my name is $name and I am $age years old.");
  }
}
