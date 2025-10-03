import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/modal_entity.dart';
import '../blocs/modal/modal_bloc.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.read<ModalBloc>().add(const CloseModal()),
          ),
          BlocSelector<ModalBloc, ModalBlocState, ModalViewState?>(
            selector: (state) => state is ModalOpen ? state.data.entity?.state : null,
            builder: (context, modalState) {
              if (modalState == null) return const SizedBox.shrink();
              return IconButton(
                icon: Icon(
                  modalState == ModalViewState.collapsed ? Icons.close : Icons.arrow_downward,
                ),
                onPressed: () {
                  if (modalState == ModalViewState.collapsed) {
                    context.read<ModalBloc>().add(const CloseModal());
                  } else {
                    context.read<ModalBloc>().add(const CollapseModal());
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
