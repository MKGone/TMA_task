import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: 40.0,
      height: 4.0,
      decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(2.0)),
    );
  }
}
