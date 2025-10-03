import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tma_task/presentation/widgets/web_view_container.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/platform_utils.dart';
import '../../domain/entities/modal_entity.dart';
import '../blocs/modal/modal_bloc.dart';
import 'drag_handle.dart';
import 'modal_header.dart';

class CustomModal extends StatelessWidget {
  final ModalEntity entity;

  const CustomModal({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final topPadding = mediaQuery.padding.top;
    final bottomSafe = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;
    final availableHeight = screenHeight - topPadding - max(bottomSafe, bottomInset);

    final minHeight = AppConstants.kEstimatedHeaderHeight + AppConstants.kMinWebViewHeight;

    return Positioned(
      bottom: max(bottomSafe, bottomInset),
      left: 0,
      right: 0,
      child: SafeArea(
        top: PlatformUtils.isIOS,
        bottom: false,
        child: GestureDetector(
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              final delta = -details.delta.dy / screenHeight;
              context.read<ModalBloc>().add(DragUpdate(delta));
            },
            onVerticalDragEnd: (details) {
              context.read<ModalBloc>().add(DragEnd(details.primaryVelocity ?? 0.0));
            },
            child: AnimatedContainer(
              duration: AppConstants.kModalAnimationDuration,
              curve: AppConstants.kModalCurve,
              height: (entity.heightPercentage * availableHeight).clamp(minHeight, availableHeight),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DragHandle(),
                  const ModalHeader(),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: WebViewContainer(url: entity.url),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
