import 'package:flutter/material.dart';

// ------------------------------------------------------------
// 1) COUNTER BOX (STATEFUL)
// ------------------------------------------------------------
class CounterBox extends StatefulWidget {
  const CounterBox({super.key});

  @override
  State<CounterBox> createState() => _CounterBoxState();
}

class _CounterBoxState extends State<CounterBox> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
            onPressed: () => setState(() => count++),
            child: const Text("Artır (+)"),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 2) COLOR CHANGER BOX (STATEFUL)
// ------------------------------------------------------------
class ColorChangerBox extends StatefulWidget {
  const ColorChangerBox({super.key});

  @override
  State<ColorChangerBox> createState() => _ColorChangerBoxState();
}

class _ColorChangerBoxState extends State<ColorChangerBox> {
  bool isRed = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isRed = !isRed),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isRed ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            isRed ? "Kırmızı" : "Yeşil",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// 3) TOGGLE BOX (STATEFUL)
// ------------------------------------------------------------
class ToggleBox extends StatefulWidget {
  const ToggleBox({super.key});

  @override
  State<ToggleBox> createState() => _ToggleBoxState();
}

class _ToggleBoxState extends State<ToggleBox> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            isActive ? "Aktif" : "Pasif",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Switch(
            value: isActive,
            onChanged: (val) => setState(() => isActive = val),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 4) SLIDER BOX (STATEFUL)
// ------------------------------------------------------------
class SliderBox extends StatefulWidget {
  const SliderBox({super.key});

  @override
  State<SliderBox> createState() => _SliderBoxState();
}

class _SliderBoxState extends State<SliderBox> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            "Değer: ${value.toInt()}",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Slider(
            min: 0,
            max: 100,
            value: value,
            onChanged: (newVal) => setState(() => value = newVal),
          ),
        ],
      ),
    );
  }
}
