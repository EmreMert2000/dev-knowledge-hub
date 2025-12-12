//ContanierWidget.dart example

import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Widget Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Hem Column hem Row aynı anda nasıl kullanılır?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade100,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Column içinde Row 1"),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _Tag(text: "Sol"),
                      _Tag(text: "Orta"),
                      _Tag(text: "Sağ"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Column içinde Row 2"),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      _Tag(text: "1"),
                      SizedBox(width: 8),
                      _Tag(text: "2"),
                      SizedBox(width: 8),
                      _Tag(text: "3"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;

  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
