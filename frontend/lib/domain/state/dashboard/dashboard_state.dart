import 'package:dafluta/dafluta.dart';

class DashboardState extends BaseState {
  int activeView = 0;

  static const int VIEW_REQUIREMENTS = 0;
  static const int VIEW_SUITES = 1;
  static const int VIEW_SESSIONS = 2;
  static const int VIEW_SETTINGS = 3;

  void onActiveViewChange(int index) {
    activeView = index;
    notify();
  }
}
