import 'package:flutter/material.dart';

class CustomGridViewItemBuilder extends StatelessWidget {
  const CustomGridViewItemBuilder({super.key, required this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Text(number),
      ),
    );
  }
}
