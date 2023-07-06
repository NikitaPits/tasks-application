import 'package:flutter/material.dart';

class UnderlinedTitleWidget extends StatelessWidget {
  final String title;

  const UnderlinedTitleWidget({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 2.0,
          color: Colors.blue,
          margin: const EdgeInsets.only(top: 4.0),
        ),
      ],
    );
  }
}
