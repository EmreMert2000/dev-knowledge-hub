import 'package:flutter/material.dart';
import 'package:flutteroadmap/BasicWidgets/StatefullWidget.dart';
import 'package:flutteroadmap/BasicWidgets/StatelessWidget.dart';
import 'package:flutteroadmap/BasicUI/ProductScreen.dart';
import 'package:flutteroadmap/BasicUI/ListScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Stateless & Stateful Widget Çalışmaları",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // ---------- Stateless Widget Examples ----------
            SimpleBox(text: "Bu bir stateless SimpleBox örneği"),
            SizedBox(height: 20),

            InfoTile(
              title: "Başlık 1",
              subtitle: "Açıklama metni 1",
              icon: Icons.info,
            ),
            SizedBox(height: 20),

            InfoTile(
              title: "Başlık 2",
              subtitle: "Açıklama metni 2",
              icon: Icons.star,
            ),

            SizedBox(height: 40),

            // ---------- Stateful Widget Examples ----------
            CounterBox(),
            SizedBox(height: 20),

            ColorChangerBox(),
            SizedBox(height: 20),

            ToggleBox(),
            SizedBox(height: 20),

            SliderBox(),
          ],
        ),
      ),

      // ---------- Navigation Buttons ----------
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "product_btn",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductScreen()),
              );
            },
            child: const Icon(Icons.shopping_cart),
          ),

          const SizedBox(height: 12),

          FloatingActionButton(
            heroTag: "list_btn",
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListScreen()),
              );
            },
            child: const Icon(Icons.list),
          ),
        ],
      ),
    );
  }
}
