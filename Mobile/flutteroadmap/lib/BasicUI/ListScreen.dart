// ------------------------------------------------------------
// LIST SCREEN (STATELESS)
// ------------------------------------------------------------
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => "Ürün ${index + 1}");

    return Scaffold(
      appBar: AppBar(title: const Text("List Screen (ListView)")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blue),
              title: Text(items[index]),
              subtitle: Text("Bu ürünün ID'si: $index"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${items[index]} seçildi"),
                    duration: const Duration(milliseconds: 800),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
