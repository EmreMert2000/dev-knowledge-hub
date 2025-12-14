import 'package:flutter/material.dart';

/// Bu dosya Flutter’daki tüm temel Button türlerini
/// ne zaman / neden kullanılmaları gerektiğiyle birlikte örnekler.
/// Material 3 (Flutter 3+) yapısına uygundur.

class Handlinguserinput extends StatelessWidget {
  const Handlinguserinput({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Material 3 aktif
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const ButtonExampleScreen(),
    );
  }
}

class ButtonExampleScreen extends StatelessWidget {
  const ButtonExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Button Örnekleri')),

      /// FloatingActionButton
      /// Ana ve en önemli aksiyonlar için kullanılır
      /// (örn: yeni ekle, oluştur, yaz)
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --------------------------------------------------
            /// ElevatedButton
            /// --------------------------------------------------
            /// Hafif gölge (depth) içerir
            /// Eskiden primary button gibi çok kullanılırdı
            /// Şu an FilledButton daha çok önerilir
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),

            const SizedBox(height: 12),

            /// --------------------------------------------------
            /// FilledButton
            /// --------------------------------------------------
            /// Akışın SONUNU temsil eden en önemli aksiyonlar
            /// Save, Confirm, Join Now gibi
            FilledButton(
              onPressed: () {},
              child: const Text('FilledButton (Primary Action)'),
            ),

            const SizedBox(height: 12),

            /// --------------------------------------------------
            /// FilledButton.tonal
            /// --------------------------------------------------
            /// Orta öncelikli aksiyonlar
            /// Outlined’dan daha güçlü ama primary değil
            /// Örn: Next, Continue
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Tonal Button'),
            ),

            const SizedBox(height: 12),

            /// --------------------------------------------------
            /// OutlinedButton
            /// --------------------------------------------------
            /// Önemli ama primary olmayan aksiyonlar
            /// Geri, iptal, alternatif seçenekler
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),

            const SizedBox(height: 12),

            /// --------------------------------------------------
            /// TextButton
            /// --------------------------------------------------
            /// Border yok
            /// Daha çok link gibi davranır
            /// Konumuna göre anlam kazanır
            TextButton(onPressed: () {}, child: const Text('TextButton')),

            const SizedBox(height: 24),

            /// --------------------------------------------------
            /// IconButton
            /// --------------------------------------------------
            /// Sadece ikon içerir
            /// AppBar, ayarlar, silme gibi küçük aksiyonlar
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
