import 'package:flutter/material.dart';

class CounterBox extends StatefulWidget {
  const CounterBox({super.key});

  @override
  State<CounterBox> createState() => _CounterBoxState();
}

class _CounterBoxState extends State<CounterBox> {
  int count = 0; // Değişen state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Sayaç: $count",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Text("Artır (+)"),
          ),
        ],
      ),
    );
  }
}
