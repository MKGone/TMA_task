part of '../modal_bloc.dart';

abstract class ModalEvent {
  const ModalEvent();
}

class OpenModal extends ModalEvent {
  final String url;
  const OpenModal(this.url);
}

class DragUpdate extends ModalEvent {
  final double delta;
  const DragUpdate(this.delta);
}

class DragEnd extends ModalEvent {
  final double velocity;
  const DragEnd(this.velocity);
}

class CollapseModal extends ModalEvent {
  const CollapseModal();
}

class CloseModal extends ModalEvent {
  const CloseModal();
}
