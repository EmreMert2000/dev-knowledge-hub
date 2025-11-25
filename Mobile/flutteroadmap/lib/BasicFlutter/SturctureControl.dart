//State instate stful widgets
// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutteroadmap/BasicFlutter/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //Stateful widget'larda state yönetimi için kullanılan temel yapıtır.Değişen widget'ın durumunu (state) yönetmek ve güncellemek için kullanılır.
  //Stateless widget'lar ise değişmeyen widget'lar için kullanılır ve state yönetimi içermez.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('State in Stateful Widgets')),
        body: const Center(child: CounterWidget()),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0; // State değişkeni

  void _incrementCounter() {
    setState(() {
      // State'i güncellemek için setState kullanılır
      _counter++; // State'i güncelle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Butona basılma sayısı:'),
        Text(
          '$_counter', // State değişkenini kullan
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
          onPressed: _incrementCounter, // Butona basıldığında state'i güncelle
          child: const Text('Arttır'),
        ),
      ],
    );
  }
}

// BasicFlutter / TypesDart.dart

//initstate() widget yüklendiğinde bir kez çağrılır ve başlangıç ayarları için kullanılır.
//dispose() widget kaldırıldığında çağrılır ve kaynakları temizlemek için kullanılır.
@override
void initState() {
  // super.initState();
  // Başlangıç ayarları burada yapılır
}

//Widget kapatıldığında çalışır.
@override
void dispose() {
  // myController.dispose();
  //super.dispose();
}
// Asenkron fonksiyon örneği
Future<String> getUser() async {
  await Future.delayed(Duration(seconds: 2));
  return "Emre";
}

//Stream → sürekli veri akışı olan yapı:
Stream<int> counterStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// Stream kullanımı
void listenToStream() {
  Stream<int> stream = counterStream();
  stream.listen((value) {
    print("Stream Value: $value");
  });
}

//Temel Dart türü
String? nullableString = null; // Null olabilir
late int number; // Daha sonra atanacak
//User({required this.name}); // Adı zorunlu yapar

//Navigation örneği
void navigateToNextPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
}

//Build işlevi kullanımı neden yaygındır?

//Hot Restart:Uygulamayı komple yeniden başlatır, tüm state sıfırlanır.
//Hot Reload: Kod değişikliklerini anında uygular, state korunur.
//Null Safety: Dart dilinde null referans hatalarını önlemek için kullanılan bir özellik.

// Dart Temelleri - Types, Variables, Functions, Collections
