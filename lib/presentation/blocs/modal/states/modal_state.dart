part of '../modal_bloc.dart';

class ModalStateData extends Equatable {
  final bool isLoading;
  final String? error;
  final ModalEntity? entity;

  const ModalStateData({this.isLoading = false, this.error, this.entity});

  ModalStateData copyWith({bool? isLoading, String? error, ModalEntity? entity}) {
    return ModalStateData(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, entity];
}

abstract class ModalBlocState extends Equatable {
  final ModalStateData data;
  const ModalBlocState(this.data);

  @override
  List<Object?> get props => [data];
}

class ModalInitial extends ModalBlocState {
  const ModalInitial() : super(const ModalStateData());
}

class ModalLoading extends ModalBlocState {
  const ModalLoading(super.data);
}

class ModalOpen extends ModalBlocState {
  const ModalOpen(super.data);
}

class ModalError extends ModalBlocState {
  const ModalError(super.data);
}
