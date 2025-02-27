import 'dart:async';
import 'package:event_bus/event_bus.dart';
import 'package:testflow/utils/log.dart';

class Events {
  static final EventBus _eventBus = EventBus();

  static void dispatch(dynamic event) {
    Log.trace('Event', '${event.runtimeType}.post');
    _eventBus.fire(event);
  }

  static StreamSubscription listen<T>(Function(T) onData) =>
      _eventBus.on<T>().listen(onData);
}

class Event {
  const Event();

  void dispatch() => Events.dispatch(this);
}
