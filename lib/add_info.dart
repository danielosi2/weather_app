import 'package:flutter/material.dart';

class AddInfoItem extends StatelessWidget {
  const AddInfoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.water_drop),
        SizedBox(height: 8),
        Text(
          'humidity',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 8),
        Text(
          '94',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
