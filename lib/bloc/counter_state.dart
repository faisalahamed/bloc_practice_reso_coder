part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class CounterIncrementState extends CounterState {
  const CounterIncrementState({countervalue}) : super(counterValue: countervalue);

  @override
  List<Object> get props => [counterValue];
}
class CounterDecrementState extends CounterState {
  const CounterDecrementState({countervalue}) : super(counterValue: countervalue);

  @override
  List<Object> get props => [counterValue];
}
