import 'package:bloc_learing/model/person.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

// class FetchResult extends HomeState {
//   final List<Person> persons;

//   FetchResult({required this.persons});
// }

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  
  final List<Person> personList;

  const HomeLoadedState({required this.personList});

  @override
  List<Object?> get props => [personList];
}
