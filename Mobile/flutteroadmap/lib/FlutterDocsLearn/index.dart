//Flutterın dökümantasyonlarını öğrenme sayfası
import 'package:flutter/material.dart';

//Burada flutterın resmi dökümantasyon sayfasına yönlendirme yapacağız
//Önemli notları pub dosyalarını anlayacağız
class FlutterDocsLearn extends StatelessWidget {
  const FlutterDocsLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Docs Learn')),
      body: const Center(
        child: Text('Flutter dökümantasyonlarını burada öğreneceğiz.'),
      ),
    );
  }
}
