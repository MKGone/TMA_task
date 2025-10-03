import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/modal/modal_bloc.dart';
import '../widgets/custom_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TMA Modal')),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.read<ModalBloc>().add(const OpenModal('https://flutter.dev')),
              child: const Text('Open Modal'),
            ),
          ),
          BlocBuilder<ModalBloc, ModalBlocState>(
            builder: (context, state) {
              if (state is ModalOpen && state.data.entity != null) {
                return CustomModal(entity: state.data.entity!);
              } else if (state is ModalError) {
                return Center(child: Text(state.data.error ?? 'Unknown error'));
              } else if (state is ModalLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
