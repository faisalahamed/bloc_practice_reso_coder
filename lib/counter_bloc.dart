import 'dart:async';

import 'counter_event.dart';

class CounterBloc {
  int _counter = 0;
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  // 4. Update the State in widget
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    // 1. listen to button action
    _counterEventController.stream.listen(event);
  }
  void event(CounterEvent event) {
    // 2. depending upon event change value
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    } else {
      _counter = 0;
    }
    // 3. Adds the value to StateStream Sink
    _inCounter.add(_counter);
  }
}
