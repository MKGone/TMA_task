import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/modal/modal_bloc.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        final delta = -details.delta.dy / screenHeight;
        context.read<ModalBloc>().add(DragUpdate(delta));
      },
      onVerticalDragEnd: (details) {
        context.read<ModalBloc>().add(DragEnd(details.primaryVelocity ?? 0.0));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: 40.0,
        height: 4.0,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }
}
