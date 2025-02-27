import 'package:testflow/utils/locator.dart';

abstract class Environment {
  String get name;

  bool get isLocal => name == 'local';

  bool get isRemote => name == 'remote';

  String get localhost => '127.0.0.1';

  Future configure() async {}

  static Environment get get => locator<Environment>();
}
