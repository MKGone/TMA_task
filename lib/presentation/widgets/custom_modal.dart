import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tma_task/presentation/widgets/web_view_container.dart';

import '../../domain/entities/modal_entity.dart';
import '../blocs/modal/modal_bloc.dart';
import 'drag_handle.dart';
import 'modal_header.dart';

class CustomModal extends StatelessWidget {
  final ModalEntity entity;

  const CustomModal({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          context.read<ModalBloc>().add(DragUpdate(-details.delta.dy / screenHeight));
        },
        onVerticalDragEnd: (details) {
          context.read<ModalBloc>().add(DragEnd(details.primaryVelocity ?? 0.0));
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: entity.heightPercentage * screenHeight - bottomInset,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const DragHandle(),
              const ModalHeader(),
              Expanded(child: WebViewContainer(url: entity.url)),
            ],
          ),
        ),
      ),
    );
  }
}
