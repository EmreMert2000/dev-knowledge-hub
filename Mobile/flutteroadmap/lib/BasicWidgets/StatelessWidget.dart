import 'package:flutter/material.dart';

// ------------------------------------------------------------
// 6) SIMPLE BOX (STATELESS)
// ------------------------------------------------------------
class SimpleBox extends StatelessWidget {
  final String text;

  const SimpleBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}

// ------------------------------------------------------------
// 7) ICON TITLE ROW (STATELESS)
// ------------------------------------------------------------
class IconTitleRow extends StatelessWidget {
  final IconData icon;
  final String title;

  const IconTitleRow({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 30, color: Colors.deepPurple),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// 8) INFO TILE (STATELESS)
// ------------------------------------------------------------
class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const InfoTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.teal),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      tileColor: Colors.teal.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
