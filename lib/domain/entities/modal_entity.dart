import 'package:equatable/equatable.dart';

enum ModalViewState { collapsed, halfExpanded, fullExpanded }

class ModalEntity extends Equatable {
  final ModalViewState state;
  final double heightPercentage;
  final String url;

  const ModalEntity({required this.state, this.heightPercentage = 0.5, required this.url});

  ModalEntity copyWith({ModalViewState? state, double? heightPercentage, String? url}) {
    return ModalEntity(
      state: state ?? this.state,
      heightPercentage: heightPercentage ?? this.heightPercentage,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [state, heightPercentage, url];
}
