// Basic Navigation Examples in Flutter
// This file demonstrates Navigator.push, Navigator.pushReplacement, and Navigator.pop

import 'package:flutter/material.dart';

// -------------------------------
// MAIN WIDGET
// -------------------------------
class NavigationExamples extends StatelessWidget {
  const NavigationExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation Examples")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // -------- PUSH EXAMPLE --------
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PageA()),
                );
              },
              child: const Text("Navigator.push → PageA"),
            ),

            const SizedBox(height: 20),

            // -------- PUSH REPLACEMENT EXAMPLE --------
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PageB()),
                );
              },
              child: const Text("Navigator.pushReplacement → PageB"),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------
// PAGE A (uses push)
// -------------------------------
class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page A")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // POP → go back to previous page
            Navigator.pop(context);
          },
          child: const Text("Back with Navigator.pop"),
        ),
      ),
    );
  }
}

// -------------------------------
// PAGE B (uses pushReplacement)
// -------------------------------
class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page B")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pushing PageC normally
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageC()),
            );
          },
          child: const Text("Go to PageC (push)"),
        ),
      ),
    );
  }
}

// -------------------------------
// PAGE C
// -------------------------------
class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page C")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back to PageB"),
        ),
      ),
    );
  }
}
