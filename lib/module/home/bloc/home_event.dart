import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

// class LoadPersonAction extends HomeEvent {
//   final String url;
//   const LoadPersonAction({required this.url}) : super();
// }
class LoadApiEvent extends HomeEvent {
  final String url;

  const LoadApiEvent({required this.url});
  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvent {
  const HomeInitialEvent();
  @override
  List<Object?> get props => [];
}
