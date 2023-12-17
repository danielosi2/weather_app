import 'package:flutter/material.dart';

class ForeCastItem extends StatelessWidget {
  const ForeCastItem({super.key, required this.icon, required this.time, required this.text});
  final IconData icon;
  final String time;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(text)
          ],
        ),
      ),
    );
  }
}
