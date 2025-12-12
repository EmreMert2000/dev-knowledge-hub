//Flutterın dökümantasyonlarını öğrenme sayfası
import 'package:flutter/material.dart';
import 'package:flutteroadmap/BasicWidgets/ContaninerWidget.dart';
import 'package:flutteroadmap/BasicWidgets/StatefullWidget.dart';
import 'package:flutteroadmap/FlutterDocsLearn/ListView.dart';

//Burada flutterın resmi dökümantasyon sayfasına yönlendirme yapacağız
//Önemli notları pub dosyalarını anlayacağız
class FlutterDocsLearn extends StatelessWidget {
  const FlutterDocsLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Docs Learn')),
      backgroundColor: Color(0xFFE3F2FD), // Açık mavi arka plan rengi

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter dökümantasyonlarını burada öğreneceğiz.',
              style: TextStyle(fontSize: 18),
            ),
            //Icon(Icons.book, size: 24.0, color: Colors.blue),
            // ElevatedButton(onPressed: onPressed, child: child)
            SizedBox(width: 10), // Buton ile metin arasında boşluk
            CounterBox(),
            /* Image(
              image: AssetImage('assets/images/flutter_docs.png'),
              width: 100,
            ), */
            ContainerWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Stateful Widget Öğrenme: '),
                SizedBox(width: 10),
                Icon(Icons.code, size: 20.0, color: Colors.green),
                ListViewExample(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
