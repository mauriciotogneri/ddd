import 'package:testflow/domain/events/events.dart';

class UnstackViewEvent extends Event {
  final int amount;

  const UnstackViewEvent({required this.amount});
}
