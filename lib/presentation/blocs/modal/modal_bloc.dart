import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/modal_entity.dart';
import '../../../domain/usecases/calculate_snap.dart';

part 'events/modal_event.dart';
part 'states/modal_state.dart';

class ModalBloc extends Bloc<ModalEvent, ModalBlocState> {
  ModalBloc() : super(const ModalInitial()) {
    on<OpenModal>(_onOpenModal);
    on<DragUpdate>(_onDragUpdate);
    on<DragEnd>(_onDragEnd);
    on<CollapseModal>(_onCollapseModal);
    on<CloseModal>(_onCloseModal);
  }

  Future<void> _onOpenModal(OpenModal event, Emitter<ModalBlocState> emit) async {
    emit(const ModalLoading(ModalStateData(isLoading: true)));
    await Future.delayed(const Duration(milliseconds: 500));
    final entity = ModalEntity(
      state: ModalViewState.halfExpanded,
      heightPercentage: 0.5,
      url: event.url,
    );
    emit(ModalOpen(ModalStateData(entity: entity, isLoading: false)));
  }

  void _onDragUpdate(DragUpdate event, Emitter<ModalBlocState> emit) {
    final currentData = state.data;
    final currentEntity = currentData.entity;
    if (currentEntity == null) return;
    final newHeight = (currentEntity.heightPercentage + event.delta).clamp(0.05, 1.0);
    final newEntity = currentEntity.copyWith(
      heightPercentage: newHeight,
      state: CalculateSnapUseCase().execute(newHeight),
    );
    emit(ModalOpen(currentData.copyWith(entity: newEntity)));
  }

  void _onDragEnd(DragEnd event, Emitter<ModalBlocState> emit) {
    final currentData = state.data;
    final currentEntity = currentData.entity;
    if (currentEntity == null) return;
    final newState = CalculateSnapUseCase().execute(currentEntity.heightPercentage);
    final newHeight = _getHeightForState(newState);
    final newEntity = currentEntity.copyWith(state: newState, heightPercentage: newHeight);
    emit(ModalOpen(currentData.copyWith(entity: newEntity)));
  }

  void _onCollapseModal(CollapseModal event, Emitter<ModalBlocState> emit) {
    final currentData = state.data;
    final currentEntity = currentData.entity;
    if (currentEntity == null) return;
    final newEntity = currentEntity.copyWith(
      state: ModalViewState.collapsed,
      heightPercentage: 0.2,
    );
    emit(ModalOpen(currentData.copyWith(entity: newEntity)));
  }

  void _onCloseModal(CloseModal event, Emitter<ModalBlocState> emit) {
    emit(const ModalInitial());
  }

  double _getHeightForState(ModalViewState state) {
    switch (state) {
      case ModalViewState.collapsed:
        return 0.2;
      case ModalViewState.halfExpanded:
        return 0.5;
      case ModalViewState.fullExpanded:
        return 1.0;
    }
  }
}
