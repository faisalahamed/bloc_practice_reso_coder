part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  final int count;
  const CounterEvent({required this.count});

  @override
  List<Object> get props => [];
}

class CounterIncrementEvent extends CounterEvent {
  const CounterIncrementEvent(count) : super(count: count);
}

class CounterDecrementEvent extends CounterEvent {
  const CounterDecrementEvent(count) : super(count: count);

}
