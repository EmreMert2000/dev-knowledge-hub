import 'package:flutter/material.dart';

// ------------------------------------------------------------
// PRODUCT SCREEN (STATEFUL)
// ------------------------------------------------------------
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int productCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Screen (Stateful)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ürün Sayısı: $productCount",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => productCount++),
              child: const Text("Ürün Ekle (+)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (productCount > 0) setState(() => productCount--);
              },
              child: const Text("Ürün Azalt (-)"),
            ),
          ],
        ),
      ),
    );
  }
}
