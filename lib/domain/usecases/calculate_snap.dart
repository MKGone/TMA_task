import '../entities/modal_entity.dart';

class CalculateSnapUseCase {
  ModalViewState execute(double currentHeightPct, double screenHeight) {
    if (currentHeightPct < 0.2) return ModalViewState.collapsed;
    if (currentHeightPct < 0.7) return ModalViewState.halfExpanded;
    return ModalViewState.fullExpanded;
  }
}
