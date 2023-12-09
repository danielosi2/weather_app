import 'package:flutter/material.dart';

class ForeCastItem extends StatelessWidget {
  const ForeCastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: const Column(
          children: [
            Text(
              '3:30',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Icon(Icons.cloud),
            SizedBox(height: 8),
            Text('301.43')
          ],
        ),
      ),
    );
  }
}
